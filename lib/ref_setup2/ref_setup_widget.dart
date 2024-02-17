import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:u_f_l_demo/app_state.dart';
import 'package:u_f_l_demo/backend/firebase/firebase_config.dart';
import 'package:u_f_l_demo/backend/schema/matchdetails_dev_record.dart';
import 'package:u_f_l_demo/backend/schema/matches_dev_record.dart';
import 'package:u_f_l_demo/backend/schema/matchstatslog_dev_record.dart';
import 'package:u_f_l_demo/backend/schema/structs/match_event_struct.dart';
import 'package:u_f_l_demo/backend/schema/structs/match_stat_snapshot_struct.dart';
import 'package:u_f_l_demo/backend/schema/util/firestore_util.dart';
import 'package:u_f_l_demo/flutter_flow/flutter_flow_util.dart';
import 'package:u_f_l_demo/ref_setup/ref_setup_model.dart';
import 'package:u_f_l_demo/ref_view/ref_view_widget.dart';
import 'package:u_f_l_demo/ref_view2/ref_view_widget.dart';
import 'package:u_f_l_demo/ref_view2/ref_view_model.dart';
import 'package:u_f_l_demo/select_fencer2/select_fencer_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "TabBar Inside AppBar Demo",
    home: RefSetupPage(),
  ));
}

class RefSetupPage extends StatefulWidget {
  @override
  RefSetupPageState createState() => RefSetupPageState();
}

class RefSetupPageState extends State<RefSetupPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  late RefSetupModel _model;

  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();

    _model = createModel(context, () => RefSetupModel());

    _tabController = TabController(length: 2, vsync: this)
      ..addListener(() {
        // or (tabController.indexIsChanging)
        if (!_tabController.indexIsChanging) {
          print("监听切换tab ${_tabController.index}");
          setState(() {});
        }
      });

    //default
    setWeaponSelect(0);
    setModeSelect(0);

    _model.periodCountValue = periodsCount;
    _model.timeCountValue = timePerPeriod;
    _model.touchesCountValue = touchesToWin;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget getTabBar() {
    return Container(
        margin: EdgeInsets.only(left: 15, top: 5, bottom: 0, right: 15),
        // padding: EdgeInsets.only(left: 0, top: 3, bottom: 3, right: 0),
        height: 48,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(8, 8, 8, 1),
            Color.fromRGBO(20, 20, 20, 1)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter), //圆角半径
          borderRadius: const BorderRadius.all(Radius.circular(25.0)),
          //边框线宽、颜色
          // border: Border.all(width: 1.0, color: Colors.black),
          // 阴影的颜色，模糊半径
          boxShadow: [
            BoxShadow(
                color: Colors.white24, blurRadius: 0.2, offset: Offset(0, -1))
          ],
        ),
        child: Stack(
          children: [
            Row(
              children: [
                tabView("Unranked Match", _tabController.index == 0, 25, 0),
                tabView("Ranked Match", _tabController.index == 1, 0, 25),
              ],
            ),
            TabBar(
                controller: _tabController,
                dividerHeight: 0,
                indicatorWeight: 1,
                indicatorColor: Colors.transparent,
                padding: EdgeInsets.zero,
                tabs: [
                  Tab(
                    // text: "Unranked Match",
                    text: "",
                    //   child: tabView("Unranked Match", _tabController.index == 0)
                    // icon: Icon(Icons.home)
                  ),
                  // child: Text("Unranked Match", style: TextStyle(color: _tabController.index == 0? Colors.white : Color.fromRGBO(255, 255, 255, 0.6)),)
                  Tab(
                    // text: "Ranked Match",
                    text: "",
                    // child: tabView("Ranked Match", _tabController.index == 1)
                    // icon: Icon(Icons.edit)
                  ),
                  // Tab(text: "设置", icon: Icon(Icons.settings)),
                ]),
          ],
        ));
  }

  Widget tabView(String text, bool isSelect, double left, double right) {
    return Expanded(
        child: Container(
      margin: EdgeInsets.only(left: left, top: 0, bottom: 0, right: right),
      // color: Color.fromRGBO(255, 0, 0, 0.5),
      decoration: isSelect
          ? BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(44, 46, 50, 0.1),
                    Color.fromRGBO(0, 42, 178, 0.72),
                    Color.fromRGBO(1, 61, 255, 0.72),
                    Color.fromRGBO(0, 77, 255, 1)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter), //圆角半径
            )
          : BoxDecoration(),
      height: 48,
      alignment: Alignment.center,
      child: Text(text,
          style: TextStyle(
              color: isSelect
                  ? Colors.white
                  : Color.fromRGBO(255, 255, 255, 0.6))),
    ));
  }

  Widget getTabBarPages() {
    return TabBarView(controller: _tabController, children: <Widget>[
      Container(
        // color: Colors.red,
        child: ListView(
          children: [unrankedView()],
        ),
      ),
      Container(
        // color: Colors.green,
        child: ListView(
          children: [rankedView()],
        ),
      ),
      // Container(color: Colors.blue)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // flexibleSpace: SafeArea(
          //   child: getTabBar(),
          // ),
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios_new, color: Colors.white)),
          backgroundColor: Color.fromRGBO(23, 23, 23, 1)),
      // body: getTabBarPages()
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromRGBO(23, 23, 23, 1),
          Color.fromRGBO(51, 51, 51, 1)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Column(
          children: [
            getTabBar(),
            Expanded(
              child: getTabBarPages(),
            )
          ],
        ),
      ),
    );
  }

  int modelSelect = 0;

  int periodsCount = 1;
  int timePerPeriod = 3;
  int touchesToWin = 5;

  Widget unrankedView() {
    return Column(
      children: [
        titleView(),
        fencerTitleView(),
        fencersView(),
        weaponView(),
        optionView("Periods", periodsCount, 0),
        SizedBox(
          height: 15,
        ),
        optionView("Time Per Period", timePerPeriod, 1),
        SizedBox(
          height: 15,
        ),
        optionView("Touches To Win", touchesToWin, 2),
        btnView(0),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }

  Widget rankedView() {
    return Column(
      children: [
        titleView(),
        fencerTitleView(),
        fencersView(),
        weaponView(),
        modeView(),
        btnView(1),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }

  Widget fencersView() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          children: [
            SizedBox(width: 15),
            Expanded(
                child: fencerView(
                    "assets/images/left_fencer_background.png",
                    getFencerIcon(FFAppState().refLeftPhoto),
                    //https://c-ssl.duitang.com/uploads/item/202004/10/20200410085329_ZZxMz.jpeg
                    false)),
            SizedBox(width: 15),
            Expanded(
                child: fencerView("assets/images/right_fencer_background.png",
                    getFencerIcon(FFAppState().refRightPhoto), true)),
            SizedBox(width: 15),
          ],
        ),
        Text(
          "VS",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.w400),
        )
      ],
    );
  }

  Widget fencerView(String assets, String url, bool isRight) {
    return GestureDetector(
      onTap: () {
        FFAppState().update(() {
          FFAppState().isRightFencer = isRight;
        });

        jumpSelect();
      },
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: 100,
            // margin: EdgeInsets.only(top: 20),
            // padding: EdgeInsets.only(top: 20),
            child: Image.asset(
              assets,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              SizedBox(height: 10),
              iconView(url, 80),
              SizedBox(height: 10),
              Text(
                valueOrDefault<String>(
                  isRight
                      ? FFAppState().refRightName
                      : FFAppState().refLeftName,
                  isRight ? 'Right Fencer' : 'Left Fencer',
                ),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
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

  Widget weaponView() {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/weapon_background.png"),
              fit: BoxFit.fill)),
      padding: EdgeInsets.only(left: 15, top: 10, bottom: 10, right: 15),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(bottom: 10, top: 0),
            child: Text(
              "Select Weapon", //(No Weapon)
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          Row(
            // mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: weaponItemView("Foil", 0)),
              // SizedBox(width: 10),
              Expanded(child: weaponItemView("Epee", 1)),
              // SizedBox(width: 10),
              Expanded(child: weaponItemView("Saber", 2)),
              // SizedBox(width: 10),
              Expanded(child: weaponItemView("Noodle", 3)),
            ],
          ),
        ],
      ),
      // color: Colors.green,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.centerLeft,
    );
  }

  int weaponSelect = 0;

  Widget weaponItemView(String name, int index) {
    return GestureDetector(
        onTap: () {
          setState(() {
            weaponSelect = index;
            setWeaponSelect(index);
          });
        },
        child: Container(
            height: 75,
            // alignment: Alignment.bottomCenter,
            decoration: index == weaponSelect
                ? BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(44, 46, 50, 0.7),
                        Color.fromRGBO(0, 42, 178, 0.72),
                        Color.fromRGBO(1, 61, 255, 0.72),
                        Color.fromRGBO(0, 77, 255, 1)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(5) //圆角半径
                    )
                : BoxDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  width: 25,
                  height: 25,
                  "assets/images/weapon_icon.png",
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(name, style: TextStyle(fontSize: 13, color: Colors.white))
              ],
            )));
  }

  void setWeaponSelect(int index) {
    if (index == 0) {
      FFAppState().refereeweaponselect = 'Foil';
    }
    if (index == 1) {
      FFAppState().refereeweaponselect = 'Epee';
    }

    if (index == 2) {
      FFAppState().refereeweaponselect = 'Sabre';
    }

    if (index == 3) {
      FFAppState().refereeweaponselect = 'Noodle';
    }
    FFAppState().isWeaponSelected = true;
  }

  void setModeSelect(int index) {
    if (index == 0) {
      FFAppState().refereemodeselect = 'RankedAdult';
    }

    if (index == 1) {
      FFAppState().refereemodeselect = 'RankedYouth';
    }
  }

  Widget optionView(String name, int count, int index) {
    return Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        padding: EdgeInsets.only(top: 4, bottom: 4, left: 20, right: 10),
        decoration: BoxDecoration(
          // gradient: LinearGradient(colors: [
          //   Color.fromRGBO(59, 59, 59, 1),
          //   // Color.fromRGBO(20, 20, 20, 1)
          // ], begin: Alignment.topCenter, end: Alignment.bottomCenter), //圆角半径
          color: Color.fromRGBO(59, 59, 59, 1),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          //边框线宽、颜色
          // border: Border.all(width: 1.0, color: Colors.black),
          // 阴影的颜色，模糊半径
          boxShadow: [
            BoxShadow(
                color: Colors.black45, blurRadius: 2, offset: Offset(0, 0))
          ],
        ),
        child: Row(
          children: [
            Expanded(
                child: Text(
              name,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18, color: Colors.white),
            )),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15, top: 6, bottom: 6),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(47, 47, 47, 1),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0))),
              child: Row(children: [
                // Container(child: Text("-", style: TextStyle(color: Colors.white, fontSize: 20),)),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        if (count <= 1) {
                          return;
                        }
                        switch (index) {
                          case 0:
                            periodsCount--;
                            _model.periodCountValue = periodsCount;
                            break;
                          case 1:
                            timePerPeriod--;
                            _model.timeCountValue = timePerPeriod;
                            break;
                          case 2:
                            touchesToWin--;
                            _model.touchesCountValue = touchesToWin;
                            break;
                        }
                      });
                    },
                    child: Icon(Icons.horizontal_rule, color: Colors.white)),
                SizedBox(
                  width: 20,
                ),
                Container(
                    // padding: EdgeInsets.only(left: 15, top: 6, bottom: 6, right: 15),
                    width: 38,
                    height: 38,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(33, 33, 33, 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5.0))),
                    child: Text(
                      "$count",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        if (count >= 99) {
                          return;
                        }
                        switch (index) {
                          case 0:
                            periodsCount++;
                            _model.periodCountValue = periodsCount;
                            break;
                          case 1:
                            timePerPeriod++;
                            _model.timeCountValue = timePerPeriod;
                            break;
                          case 2:
                            touchesToWin++;
                            _model.touchesCountValue = touchesToWin;
                            break;
                        }
                      });
                    },
                    child: Icon(Icons.add, color: Colors.white))
              ]),
            )
          ],
        ));
  }

  Widget titleView() {
    return Container(
      child: Text(
        "Match Setup",
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 22, color: Colors.white),
      ),
      // color: Colors.green,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 20, top: 20, bottom: 0),
    );
  }

  Widget fencerTitleView() {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 10, bottom: 25),
      child: Row(
        children: [
          Text(
            "Fencers:",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "Click Name to Scan QR",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 13, color: Colors.white),
          ),
        ],
      ),
      // color: Colors.green,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.centerLeft,
    );
  }

  Widget modeView() {
    return Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        padding: EdgeInsets.only(top: 8, bottom: 18, left: 20, right: 20),
        decoration: BoxDecoration(
          // gradient: LinearGradient(colors: [
          //   Color.fromRGBO(59, 59, 59, 1),
          //   // Color.fromRGBO(20, 20, 20, 1)
          // ], begin: Alignment.topCenter, end: Alignment.bottomCenter), //圆角半径
          color: Color.fromRGBO(59, 59, 59, 1),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          //边框线宽、颜色
          // border: Border.all(width: 1.0, color: Colors.black),
          // 阴影的颜色，模糊半径
          boxShadow: [
            BoxShadow(
                color: Colors.black45, blurRadius: 2, offset: Offset(0, 0))
          ],
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 5, bottom: 10),
              child: Text(
                "Select Mode",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: modeItemView(
                        "Adult",
                        "assets/images/mode_adult_background.png",
                        "15 Touches",
                        "Up To 3 Periods",
                        0)),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: modeItemView(
                        "Youth",
                        "assets/images/mode_youth_background.png",
                        "10Touches",
                        "Up To 2 Periods",
                        1)),
              ],
            )
          ],
        ));
  }

  Widget modeItemView(String name, String background, String touches,
      String periods, int index) {
    return GestureDetector(
        onTap: () {
          setState(() {
            modelSelect = index;
            setModeSelect(index);
          });
        },
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              foregroundDecoration: modelSelect == index
                  ? BoxDecoration(
                      color: Color.fromRGBO(10, 57, 212, 0.8),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                    )
                  : BoxDecoration(
                      color: Colors.black45,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                    ),
              // color: Theme.of(context).primaryColor.withOpacity(0.5),
              child: Image.asset(
                background,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    name,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 45,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    touches,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    periods,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ],
            )
          ],
        ));
  }

  void jumpSelect() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectFencerPage()),
    ).then((value) {
      setState(() {});
    });
  }

  void setupConfirm(int index) async {
    currentUserLocationValue =
        await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));

    // FFAppState().update(() {
    //   FFAppState().currentPeriod = 1;
    // });
    //
    // FFAppState().update(() {
    //   FFAppState().addToRefFencers(FFAppState().leftFencerRef!);
    // });
    // FFAppState().update(() {
    //   FFAppState().addToRefFencers(FFAppState().rightFencerRef!);
    // });

    // Create matchdetails

    // var matchdetailsDevRecordReference = MatchdetailsDevRecord.collection.doc();
    // await matchdetailsDevRecordReference.set({
    //   ...createMatchdetailsDevRecordData(
    //     overallStats: createMatchStatSnapshotStruct(
    //       pointsL: 0,
    //       pointsR: 0,
    //       yellowCardsL: 0,
    //       yellowCardsR: 0,
    //       redCardsL: 0,
    //       redCardsR: 0,
    //       simultaneous: 0,
    //       haltsRef: 0,
    //       haltsL: 0,
    //       haltsR: 0,
    //       simpleAttackHitsL: 0,
    //       simpleAttackHitsR: 0,
    //       simpleAttackOffTarL: 0,
    //       simpleAttackOffTarR: 0,
    //       compoundAttackHitsL: 0,
    //       compoundAttackHitsR: 0,
    //       compoundAttackOffTarL: 0,
    //       compoundAttackOffTarR: 0,
    //       parryRiposteHitsL: 0,
    //       parryRiposteHitsR: 0,
    //       parryRiposteOffTargetL: 0,
    //       parryRiposteOffTargetR: 0,
    //       remiseHitsL: 0,
    //       remiseHitsR: 0,
    //       remiseOffTarL: 0,
    //       remiseOffTarR: 0,
    //       counterattackHitsL: 0,
    //       counterattackHitsR: 0,
    //       counterattackOffTarL: 0,
    //       counterattackOffTarR: 0,
    //       pointInLineHitsL: 0,
    //       pointInLineHitsR: 0,
    //       pointInLineOffTarL: 0,
    //       pointInLineOffTarR: 0,
    //       timestamp: -1,
    //       periodstamp: -1,
    //       clearUnsetFields: false,
    //       create: true,
    //     ),
    //   ),
    //   ...mapToFirestore(
    //     {
    //       'MatchEvents': [
    //         getMatchEventFirestoreData(
    //           createMatchEventStruct(
    //             actionableFencer: FFAppState().refereeReference,
    //             scoreLeft: 0,
    //             scoreRight: 0,
    //             timeOfAction: functions.minutesToMS(_model.timeCountValue!),
    //             periodOfAction: 1,
    //             actionID: -1,
    //             clearUnsetFields: false,
    //             create: true,
    //           ),
    //           true,
    //         )
    //       ],
    //     },
    //   ),
    // });
    // _model.currentMatchDetails = MatchdetailsDevRecord.getDocumentFromData({
    //   ...createMatchdetailsDevRecordData(
    //     overallStats: createMatchStatSnapshotStruct(
    //       pointsL: 0,
    //       pointsR: 0,
    //       yellowCardsL: 0,
    //       yellowCardsR: 0,
    //       redCardsL: 0,
    //       redCardsR: 0,
    //       simultaneous: 0,
    //       haltsRef: 0,
    //       haltsL: 0,
    //       haltsR: 0,
    //       simpleAttackHitsL: 0,
    //       simpleAttackHitsR: 0,
    //       simpleAttackOffTarL: 0,
    //       simpleAttackOffTarR: 0,
    //       compoundAttackHitsL: 0,
    //       compoundAttackHitsR: 0,
    //       compoundAttackOffTarL: 0,
    //       compoundAttackOffTarR: 0,
    //       parryRiposteHitsL: 0,
    //       parryRiposteHitsR: 0,
    //       parryRiposteOffTargetL: 0,
    //       parryRiposteOffTargetR: 0,
    //       remiseHitsL: 0,
    //       remiseHitsR: 0,
    //       remiseOffTarL: 0,
    //       remiseOffTarR: 0,
    //       counterattackHitsL: 0,
    //       counterattackHitsR: 0,
    //       counterattackOffTarL: 0,
    //       counterattackOffTarR: 0,
    //       pointInLineHitsL: 0,
    //       pointInLineHitsR: 0,
    //       pointInLineOffTarL: 0,
    //       pointInLineOffTarR: 0,
    //       timestamp: -1,
    //       periodstamp: -1,
    //       clearUnsetFields: false,
    //       create: true,
    //     ),
    //   ),
    //   ...mapToFirestore(
    //     {
    //       'MatchEvents': [
    //         getMatchEventFirestoreData(
    //           createMatchEventStruct(
    //             actionableFencer: FFAppState().refereeReference,
    //             scoreLeft: 0,
    //             scoreRight: 0,
    //             timeOfAction: functions.minutesToMS(_model.timeCountValue!),
    //             periodOfAction: 1,
    //             actionID: -1,
    //             clearUnsetFields: false,
    //             create: true,
    //           ),
    //           true,
    //         )
    //       ],
    //     },
    //   ),
    // }, matchdetailsDevRecordReference);

    // var matchstatslogDevRecordReference =
    //     MatchstatslogDevRecord.collection.doc();
    // await matchstatslogDevRecordReference.set({
    //   ...mapToFirestore(
    //     {
    //       'MatchStats': [
    //         getMatchStatSnapshotFirestoreData(
    //           createMatchStatSnapshotStruct(
    //             pointsL: 0,
    //             pointsR: 0,
    //             yellowCardsL: 0,
    //             yellowCardsR: 0,
    //             redCardsL: 0,
    //             redCardsR: 0,
    //             simultaneous: 0,
    //             haltsRef: 0,
    //             haltsL: 0,
    //             haltsR: 0,
    //             simpleAttackHitsL: 0,
    //             simpleAttackHitsR: 0,
    //             simpleAttackOffTarL: 0,
    //             simpleAttackOffTarR: 0,
    //             compoundAttackHitsL: 0,
    //             compoundAttackHitsR: 0,
    //             compoundAttackOffTarL: 0,
    //             compoundAttackOffTarR: 0,
    //             parryRiposteHitsL: 0,
    //             parryRiposteHitsR: 0,
    //             parryRiposteOffTargetL: 0,
    //             parryRiposteOffTargetR: 0,
    //             remiseHitsL: 0,
    //             remiseHitsR: 0,
    //             remiseOffTarL: 0,
    //             remiseOffTarR: 0,
    //             counterattackHitsL: 0,
    //             counterattackHitsR: 0,
    //             counterattackOffTarL: 0,
    //             counterattackOffTarR: 0,
    //             pointInLineHitsL: 0,
    //             pointInLineHitsR: 0,
    //             pointInLineOffTarL: 0,
    //             pointInLineOffTarR: 0,
    //             timestamp: -1,
    //             periodstamp: 0,
    //             clearUnsetFields: false,
    //             create: true,
    //           ),
    //           true,
    //         )
    //       ],
    //     },
    //   ),
    // });
    // _model.currentMatchStatsLog = MatchstatslogDevRecord.getDocumentFromData({
    //   ...mapToFirestore(
    //     {
    //       'MatchStats': [
    //         getMatchStatSnapshotFirestoreData(
    //           createMatchStatSnapshotStruct(
    //             pointsL: 0,
    //             pointsR: 0,
    //             yellowCardsL: 0,
    //             yellowCardsR: 0,
    //             redCardsL: 0,
    //             redCardsR: 0,
    //             simultaneous: 0,
    //             haltsRef: 0,
    //             haltsL: 0,
    //             haltsR: 0,
    //             simpleAttackHitsL: 0,
    //             simpleAttackHitsR: 0,
    //             simpleAttackOffTarL: 0,
    //             simpleAttackOffTarR: 0,
    //             compoundAttackHitsL: 0,
    //             compoundAttackHitsR: 0,
    //             compoundAttackOffTarL: 0,
    //             compoundAttackOffTarR: 0,
    //             parryRiposteHitsL: 0,
    //             parryRiposteHitsR: 0,
    //             parryRiposteOffTargetL: 0,
    //             parryRiposteOffTargetR: 0,
    //             remiseHitsL: 0,
    //             remiseHitsR: 0,
    //             remiseOffTarL: 0,
    //             remiseOffTarR: 0,
    //             counterattackHitsL: 0,
    //             counterattackHitsR: 0,
    //             counterattackOffTarL: 0,
    //             counterattackOffTarR: 0,
    //             pointInLineHitsL: 0,
    //             pointInLineHitsR: 0,
    //             pointInLineOffTarL: 0,
    //             pointInLineOffTarR: 0,
    //             timestamp: -1,
    //             periodstamp: 0,
    //             clearUnsetFields: false,
    //             create: true,
    //           ),
    //           true,
    //         )
    //       ],
    //     },
    //   ),
    // }, matchstatslogDevRecordReference);
    // Create matches doc

    // var matchesDevRecordReference = MatchesDevRecord.collection.doc();
    // await matchesDevRecordReference.set({
    //   ...createMatchesDevRecordData(
    //     user1: FFAppState().leftFencerRef,
    //     user2: FFAppState().rightFencerRef,
    //     weapon: FFAppState().refereeweaponselect,
    //     noOfPeriods: _model.periodCountValue,
    //     scoreLeft: 0,
    //     scoreRight: 0,
    //     location: currentUserLocationValue,
    //     matchDetails: _model.currentMatchDetails?.reference,
    //     matchRanking: 'U',
    //     scheduledTime: getCurrentTimestamp,
    //     matchStatsLog: _model.currentMatchStatsLog?.reference,
    //   ),
    //   ...mapToFirestore(
    //     {
    //       'fencers': FFAppState().refFencers,
    //     },
    //   ),
    // });

    // _model.currentMatchInProgress = MatchesDevRecord.getDocumentFromData({
    //   ...createMatchesDevRecordData(
    //     user1: FFAppState().leftFencerRef,
    //     user2: FFAppState().rightFencerRef,
    //     weapon: FFAppState().refereeweaponselect,
    //     noOfPeriods: _model.periodCountValue,
    //     scoreLeft: 0,
    //     scoreRight: 0,
    //     location: currentUserLocationValue,
    //     matchDetails: _model.currentMatchDetails?.reference,
    //     matchRanking: 'U',
    //     scheduledTime: getCurrentTimestamp,
    //     matchStatsLog: _model.currentMatchStatsLog?.reference,
    //   ),
    //   ...mapToFirestore(
    //     {
    //       'fencers': FFAppState().refFencers,
    //     },
    //   ),
    // }, matchesDevRecordReference);

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => RefViewWidget(
    //       initStartTime: _model.timeCountValue,
    //       startNumOfPeriods: _model.periodCountValue,
    //       startNumOfTouches: _model.touchesCountValue,
    //       currentMatchInProgress: _model.currentMatchInProgress,
    //       currentMatchDetails: _model.currentMatchDetails,
    //       rankCode: 'U',
    //     ),
    //   ),
    // );

    jumpView(index);

    setState(() {});
  }

  Widget btnView(int index) {
    return Visibility(
        visible: isShowConfirm(index),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 20),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setupConfirm(index);
                  },
                  child: Container(
                    height: 45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(10, 57, 212, 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25.0))),
                    child: Text(
                      "Start Match",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                )),
                SizedBox(width: 10)
              ],
            )
          ],
        ));
  }

  bool isShowConfirm(int index) {
    if (index == 0) {
      if ((FFAppState().leftFencerRef != FFAppState().SelectFencerReference) &&
          (FFAppState().rightFencerRef != FFAppState().SelectFencerReference) &&
          FFAppState().isWeaponSelected) {
        return true;
      }
      return false;
    } else {
      if ((FFAppState().leftFencerRef != FFAppState().SelectFencerReference) &&
          (FFAppState().rightFencerRef != FFAppState().SelectFencerReference) &&
          FFAppState().isWeaponSelected &&
          FFAppState().refereemodeselect != "") {
        return true;
      }
      return false;
    }
  }

  void jumpView(int index) {
    RefViewMatch m = RefViewMatch();

    if (index == 0) {
      m.maxPeriod = _model.periodCountValue!;
      m.maxTouch = _model.touchesCountValue!;
      m.maxSeconds = _model.timeCountValue! * 60;
    } else {
      if (FFAppState().refereemodeselect == "RankedAdult") {
        m.maxPeriod = 3;
        m.maxTouch = 15;
        m.maxSeconds = 5 * 60;
      } else {
        m.maxPeriod = 2;
        m.maxTouch = 10;
        m.maxSeconds = 5 * 60;
      }
    }

    m.leftName = FFAppState().refLeftName;
    m.rightName = FFAppState().refRightName;

    m.leftIcon = getFencerIcon(FFAppState().refLeftPhoto);
    m.rightIcon = getFencerIcon(FFAppState().refRightPhoto);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RefViewPage(match: m),
      ),
    );
  }

  //不要默认 使用本地
  String getFencerIcon(String url) {
    if (url != null && url != "" && !url.contains("Fencer_silhouette.png")) {
      return url;
    }
    return "";
  }
}
