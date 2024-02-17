import 'package:flutter/material.dart';
import 'package:u_f_l_demo/ref_view2/ref_view_model.dart';
import 'package:u_f_l_demo/ref_view2/ref_view_widget.dart';

// Main
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("demo"),
      ),
      body: Home(),
    ));
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RefViewPage(match: RefViewMatch(),)),
                );
              },
              child: Container(
                alignment: Alignment.center,
                width: 100,
                height: 50,
                color: Colors.blue,
                child: Text(
                  "比试",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              )),
          // TextButton(
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => RefSetupPage()),
          //       );
          //     },
          //     child: Container(
          //       alignment: Alignment.center,
          //       width: 100,
          //       height: 50,
          //       color: Colors.blue,
          //       child: Text(
          //         "创建",
          //         style: TextStyle(color: Colors.white, fontSize: 16),
          //       ),
          //     )),
          // TextButton(
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => ScanQrCodePage()),
          //       );
          //     },
          //     child: Container(
          //       alignment: Alignment.center,
          //       width: 100,
          //       height: 50,
          //       color: Colors.blue,
          //       child: Text(
          //         "扫码",
          //         style: TextStyle(color: Colors.white, fontSize: 16),
          //       ),
          //     ))
        ],
      ),
    );
  }
}
