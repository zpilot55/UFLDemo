import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:text_search/text_search.dart';
import 'package:u_f_l_demo/app_state.dart';
import 'package:u_f_l_demo/backend/backend.dart';
import 'package:u_f_l_demo/flutter_flow/flutter_flow_model.dart';
import 'package:u_f_l_demo/select_fencer/select_fencer_model.dart';
import 'package:u_f_l_demo/select_fencer2/select_fencer_scan_widget.dart';

void main() => runApp(MaterialApp(home: const SelectFencerPage()));

class SelectFencerPage extends StatefulWidget {
  const SelectFencerPage({super.key});

  @override
  State<SelectFencerPage> createState() => SelectFencerState();
}

class SelectFencerState extends State<SelectFencerPage> {
  late SelectFencerModel _model;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
            // flexibleSpace: SafeArea(
            //   child: getTabBar(),
            // ),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios_new, color: Colors.white),
            ),
            backgroundColor: Color.fromRGBO(23, 23, 23, 1)),
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromRGBO(23, 23, 23, 1),
            Color.fromRGBO(51, 51, 51, 1)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Column(children: [
            titleView(),
            scanView(),
            Expanded(child: infoView()),
            btnView(),
            SizedBox(
              height: 20,
            )
          ]),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectFencerModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  //启动扫描
  void qrscan() {
    // _model.currentFencerID =
    //     await FlutterBarcodeScanner.scanBarcode(
    //   '#C62828', // scanning line color
    //   'Cancel', // cancel button text
    //   true, // whether to show the flash icon
    //   ScanMode.QR,
    // );

    Navigator.push(
            context, MaterialPageRoute(builder: (context) => ScanQrCodePage()))
        .then((value) {
      print(value);
      print('-x');
      // _model.currentFencerID = "dMNlTLXn6sUTqHEvvJvlY1alrAk2"; //left
      // _model.currentFencerID = "FoQV9j6M2dhILKqR9sQKHlbe4j43"; //right
      _model.currentFencerID = value;

      queryUsersRecordOnce().then((value) {
        print(value);
        value = value
            .where((element) => element.uid == _model.currentFencerID)
            .toList();

        if (value.length <= 0) {
          return;
        }

        _model.currentUserRecord = value.first;

        setState(() {
          FFAppState().update(() {
            FFAppState().scannedFencerRef = _model.currentUserRecord?.reference;
            FFAppState().currentFencerName =
                _model.currentUserRecord!.displayName;
            FFAppState().currentFencerPicURL =
                _model.currentUserRecord!.photoUrl;
          });
        });
      });
    });
  }

  Widget scanView() {
    return GestureDetector(
      onTap: () {
        qrscan();
      },
      child: Container(
        margin: EdgeInsets.only(left: 15, top: 5, bottom: 0, right: 15),
        // padding: EdgeInsets.only(left: 0, top: 3, bottom: 3, right: 0),
        height: 55,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(8, 8, 8, 1),
            Color.fromRGBO(20, 20, 20, 1)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          //圆角半径
          borderRadius: const BorderRadius.all(Radius.circular(25.0)),
          //边框线宽、颜色
          // border: Border.all(width: 1.0, color: Colors.black),
          // 阴影的颜色，模糊半径
          boxShadow: [
            BoxShadow(
                color: Colors.white24, blurRadius: 0.2, offset: Offset(0, -1))
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.qr_code_scanner_sharp,
              color: Colors.white,
            ),
            SizedBox(width: 20),
            Text(
              "Click To Scan QR Code",
              style: TextStyle(color: Colors.white, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }

  Widget btnView() {
    return Row(
      children: [
        SizedBox(width: 15),
        Expanded(
            child: GestureDetector(
          onTap: () {
            clickConfirm();
          },
          child: Container(
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color.fromRGBO(10, 57, 212, 1),
                borderRadius: const BorderRadius.all(Radius.circular(25.0))),
            child: Text(
              "Confirm",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        )),
        SizedBox(width: 15),
        Expanded(
            child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color.fromRGBO(196, 196, 196, 1),
                borderRadius: const BorderRadius.all(Radius.circular(25.0))),
            child: Text(
              "Cancel",
              style:
                  TextStyle(color: Color.fromRGBO(61, 61, 61, 1), fontSize: 18),
            ),
          ),
        )),
        SizedBox(width: 15)
      ],
    );
  }

  Widget infoView() {
    return Container(
        alignment: Alignment.center,
        // color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconView(getSelectIcon(), 120),
            SizedBox(
              height: 20,
            ),
            Text(getSelectName(),
                style: TextStyle(color: Colors.white, fontSize: 22)),
            Text("Profile", style: TextStyle(color: Colors.white, fontSize: 13))
          ],
        ));
  }

  Widget iconView(String url, double size) {
    return ClipOval(
      child: Image.network(
        url,
        fit: BoxFit.cover,
        width: size,
        height: size,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            // color: Colors.amber,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/fencer_default_icon.png"),
                    fit: BoxFit.fill)),
            alignment: Alignment.center,
            width: size,
            height: size,
            // child: const Text(
            //   'Whoops!',
            //   style: TextStyle(fontSize: 30),
            // ),
          );
        },
      ),
    );
  }

  Widget titleView() {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 0, bottom: 10),
      child: Text(
        "Fencer Select",
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 22, color: Colors.white),
      ),
      // color: Colors.green,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.centerLeft,
    );
  }

  String getSelectName() {
    if (FFAppState().currentFencerName != null &&
        FFAppState().currentFencerName != "") {
      return FFAppState().currentFencerName;
    }
    return "<Select Fencer>";
  }

  String getSelectIcon() {
    if (FFAppState().currentFencerPicURL != null &&
        FFAppState().currentFencerPicURL != "" && !FFAppState().currentFencerPicURL.contains("Fencer_silhouette.png")) {
      return FFAppState().currentFencerPicURL;
    }
    return "";
  }

  void clickConfirm() {
    setState(() {
      if (FFAppState().isRightFencer) {
        FFAppState().update(() {
          FFAppState().rightFencerRef = FFAppState().scannedFencerRef;
          FFAppState().refRightName = FFAppState().currentFencerName;
          FFAppState().refRightPhoto = FFAppState().currentFencerPicURL;
        });
      } else {
        FFAppState().update(() {
          FFAppState().leftFencerRef = FFAppState().scannedFencerRef;
          FFAppState().refLeftName = FFAppState().currentFencerName;
          FFAppState().refLeftPhoto = FFAppState().currentFencerPicURL;
        });
      }

      FFAppState().update(() {
        FFAppState().scannedFencerRef =
            FirebaseFirestore.instance.doc('/users/2');
        FFAppState().currentFencerName = '';
        FFAppState().currentFencerPicURL = '';
      });
    });
    Navigator.pop(context);
  }
}
