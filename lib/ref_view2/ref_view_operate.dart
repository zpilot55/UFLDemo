import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:u_f_l_demo/ref_view2/ref_view_model.dart';
import 'package:u_f_l_demo/ref_view2/ref_view_record.dart';

// Main
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: PieChartPage(),
      home: Center(),
    );
  }
}

class RefViewOperate extends StatefulWidget {
  RefViewOperate(
      {required RefViewOperateConfirm confirm,
      required RefViewOperatePause pause,
      required RefViewOperateResume resume,
      required RefViewOperateMark mark,
      required RefViewMatch match,
      required RefViewRecord record}) {
    this.refViewOperateConfirm = confirm;
    this.refViewMatch = match;
    this.refViewOperatePause = pause;
    this.refViewOperateResume = resume;
    this.refViewOperateMark = mark;
    this.refViewRecord = record;
  }

  late final RefViewOperateConfirm refViewOperateConfirm;
  late RefViewMatch refViewMatch;
  RefViewRecord? refViewRecord;
  late final RefViewOperatePause refViewOperatePause;
  late final RefViewOperateResume refViewOperateResume;
  late final RefViewOperateMark refViewOperateMark;

  @override
  State<StatefulWidget> createState() => RefViewOperateState(
      refViewOperateConfirm,
      refViewMatch,
      refViewRecord!,
      refViewOperatePause,
      refViewOperateResume,
      refViewOperateMark);
}

class RefViewOperateState extends State {
  int? touchedIndex;
  double radioIn = 45;
  double radioOut = 60;

  double left = 0;
  double top = 0;

  double size = 220;

  bool isShow = false;

  bool isShowConfirm = false;

  // bool isLeft = true;
  int position = -1; //0 middle 1 left 2 right

  static const int POS_MIDDLE = 0;
  static const int POS_LEFT = 1;
  static const int POS_RIGHT = 2;

  late RefViewMatch refViewMatch;
  RefViewRecord? refViewRecord;

  late RefViewOperatePause refViewOperatePause;

  bool isChallenge = false;

  static const int MENU_MAIN = 0;
  static const int MENU_CARD = 1;
  static const int MENU_SWORDS = 2;
  static const int MENU_SHIELD = 3;
  static const int MENU_CIRCLE = 4;

  static const int MENU_CARD_YELLOW = 0;
  static const int MENU_CARD_RED = 1;
  static const int MENU_CARD_BLACK = 2;

  RefViewOperateState(
      RefViewOperateConfirm confirm,
      RefViewMatch match,
      RefViewRecord record,
      RefViewOperatePause pause,
      RefViewOperateResume resume,
      RefViewOperateMark mark) {
    refViewOperateConfirm = confirm;
    refViewMatch = match;
    refViewRecord = record;
    refViewOperatePause = pause;
    refViewOperateResume = resume;
    refViewOperateMark = mark;
  }

  late final RefViewOperateConfirm refViewOperateConfirm;
  late final RefViewOperateResume refViewOperateResume;
  late final RefViewOperateMark refViewOperateMark;

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //     overlays: [SystemUiOverlay.bottom]);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);

    updateRecordState();

    Alignment al = Alignment.bottomLeft;
    Alignment alS = Alignment.bottomLeft;
    String h = "Left";
    if (position == POS_LEFT) {
      al = Alignment.bottomLeft;
      alS = Alignment.bottomRight;
      h = "Left";
    }
    if (position == POS_MIDDLE) {
      al = Alignment.bottomCenter;
      alS = Alignment.bottomRight;
      h = "Center";
    }
    if (position == POS_RIGHT) {
      al = Alignment.bottomRight;
      alS = Alignment.bottomLeft;
      h = "Right";
    }
    return Container(
        // color: Colors.deepPurple,
        child: Stack(
      children: [
        GestureDetector(
          onPanStart: (detail) {
            print(detail);

            setState(() {
              if (isShow) {
                isShow = false;

                // isShowResume = true;

                resetConfirm();
              }
            });

            // setState(() {
            //   if (isShow) {
            //     isShow = false;
            //   } else {
            //     isShow = true;
            //     left = detail.globalPosition.dx;
            //     top = detail.globalPosition.dy;
            //
            //     isLeft = left < MediaQuery.of(context).size.width / 2;
            //     // Future.delayed(Duration(seconds: 5), () {
            //     //   // print("延迟两秒钟后输出");
            //     //   setState(() {
            //     //     isShow = false;
            //     //   });
            //     // });
            //   }
            // });
          },
          // onPanEnd: (detail) {
          //   setState(() {
          //     isShow = false;
          //     // left = detail.globalPosition.dx;
          //     // top = detail.globalPosition.dy;
          //   });
          // },
          // child: Container(color: Colors.deepPurple),
        ),
        Visibility(
            visible: !isShow,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                challengeView(true),
                challengeView(false),
                foulView(true),
                foulView(false),
                eventView(true),
                eventView(false),
                // Positioned(
                //     width: 120,
                //     bottom: 40,
                //     child: GestureDetector(
                //         onTap: () {
                //           // refViewOperatePause(true);
                //           clickOperate(POS_MIDDLE, MENU_MAIN, false);
                //         },
                //         child: btnView("Simultaneous", 0, 0))),
                Positioned(
                    width: 120,
                    bottom: 40,
                    child: GestureDetector(
                        onTap: () {
                          refViewOperatePause(true);
                        },
                        child: btnView("Pause", 2, 0))),
                Positioned(
                    width: 120,
                    bottom: 90,
                    child: GestureDetector(
                        onTap: () {
                          // refViewOperatePause(true);
                          refViewOperateResume();

                          // isShowResume = false;

                          setState(() {});
                        },
                        child: Visibility(
                            visible: isShowResume,
                            child: btnView("Resume", 1, 0)))),
              ],
            )),
        Visibility(
            visible: isShow,
            child: Container(
                // left: left - size / 2,
                // top: top - size / 2 - 60,
                // left: 50,
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 30),
                alignment: al,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                // right: 50,
                // top: 0,
                // bottom: 0,
                child: Container(
                    width: size,
                    height: size,
                    // color: Colors.cyan,
                    alignment: Alignment.topLeft,
                    child: Stack(
                      children: [
                        PieChart(
                          PieChartData(
                            pieTouchData: PieTouchData(
                              enabled: false,
                              touchCallback: (fl, pieTouchResponse) {
                                print("xxxx" + fl.toString());
                                if (fl is FlTapUpEvent ||
                                    fl is FlLongPressEnd ||
                                    fl is FlPanEndEvent) {
                                  // print("xx");
                                  setState(() {
                                    // if (pieTouchResponse?.touchedSection?.touchInput is FlLongPressEnd ||
                                    //     pieTouchResponse.touchInput is FlPanEnd) {
                                    //   touchedIndex = -1;
                                    // } else {
                                    //   touchedIndex = pieTouchResponse.touchedSectionIndex;
                                    // }
                                    try {
                                      if (pieTouchResponse != null) {
                                        touchedIndex = pieTouchResponse!
                                            .touchedSection!
                                            .touchedSectionIndex;
                                      }

                                      if (currentMenuType == MENU_MAIN) {
                                        //切换二级菜单
                                        if (touchedIndex == 0) {
                                          currentMenuType = MENU_SWORDS;
                                        }
                                        if (touchedIndex == 1) {
                                          currentMenuType = MENU_SHIELD;
                                        }
                                        if (touchedIndex == 2) {
                                          currentMenuType = MENU_CIRCLE;
                                        }

                                        //重置选择
                                        touchedIndex = -1;
                                      } else {
                                        //选中二级菜单
                                        // currentMenuType = 0;

                                        // isShow = false;

                                        Container c = pieTouchResponse!
                                            .touchedSection!
                                            .touchedSection!
                                            .badgeWidget as Container;
                                        Column cl = c.child as Column;
                                        Text clt = cl.children[2] as Text;

                                        String h = "";
                                        if (position == POS_LEFT) {
                                          h = refViewMatch.leftName + " ";
                                        }
                                        if (position == POS_RIGHT) {
                                          h = refViewMatch.rightName + " ";
                                        }
                                        setConfirm(h + clt!.data!);

                                        // onP(isLeft, touchedIndex!);
                                        // pCallback.onSelect(current, touchedIndex!);
                                      }
                                    } catch (e) {}
                                  });
                                } else {
                                  try {
                                    setState(() {
                                      touchedIndex = pieTouchResponse!
                                          .touchedSection!.touchedSectionIndex;
                                    });
                                  } catch (e) {}
                                }
                              },
                            ),
                            startDegreeOffset: 270,
                            borderData: FlBorderData(
                              show: false,
                            ),
                            sectionsSpace: 1,
                            centerSpaceRadius: radioIn,
                            sections: currentMenu(),
                            // showingSections()
                          ),
                        ),
                        Center(
                            child:
                                Text(h, style: TextStyle(color: Colors.white)))
                      ],
                    )))),
        Visibility(
            visible: isShow && isShowConfirm,
            child: Container(
                // left: left - size / 2,
                // top: top - size / 2 - 60,
                // left: 50,
                padding: EdgeInsets.only(left: 30, right: 30),
                alignment: alS,
                // width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height,
                // right: 50,
                // top: 0,
                // bottom: 0,
                // color: Colors.cyan,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Expanded(child: SizedBox()),
                        Container(
                          width: 160,
                          alignment: position == POS_RIGHT
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              // clickOperate(true, );
                              refViewOperateMark();
                            },
                            child: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "assets/images/mark_btn.png"))),
                            ),
                          ),
                        ),
                        SizedBox(height: 18),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                //记录判罚
                                addEvent(false);

                                isShow = false;

                                // refViewOperateResume();
                                // isShowResume = true;

                                if (isChallenge) {
                                  if (position == POS_LEFT) {
                                    refViewMatch.leftChallenge--;
                                  }
                                  if (position == POS_RIGHT) {
                                    refViewMatch.rightChallenge--;
                                  }
                                }

                                resetConfirm();
                              });
                            },
                            child: btnView(cancelHint, 0, 0)),
                        SizedBox(height: 15),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                //记录判罚
                                addEvent(true);

                                updateCard();
                                isShow = false;

                                // refViewOperateResume();
                                // isShowResume = true;

                                resetConfirm();

                                refViewOperateConfirm(touchedIndex!);
                              });
                            },
                            child: btnView(confirmHint, 1, 0)),
                        SizedBox(height: 45)
                      ],
                    ),
                  ],
                ))),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 15),
            cardView(redCard, cardCount[1]),
            SizedBox(width: 5),
            cardView(yellowCard, cardCount[0]),
            SizedBox(width: 5),
            cardView(blackCard, cardCount[2]),
            Expanded(child: SizedBox()),
            Visibility(
                visible: isShow && isShowConfirm,
                child: Column(children: [
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 2,
                    height: 50,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                "assets/images/hint_background.png"))),
                    child: Text(
                      centerHint,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ])),
            Expanded(child: SizedBox()),
            cardView(blackCard, cardCount[5]),
            SizedBox(width: 5),
            cardView(yellowCard, cardCount[3]),
            SizedBox(width: 5),
            cardView(redCard, cardCount[4]),
            SizedBox(width: 15),
          ],
        )
      ],
    ));
  }

  List cardCount = [0, 0, 0, 0, 0, 0];

  Widget cardView(String card, int count) {
    if (count <= 0) {
      return SizedBox();
    }
    return Column(children: [
      Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            width: 18,
            card,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 2),
          Text(count.toString(),
              style: TextStyle(fontSize: 13, color: Colors.white))
        ],
      )
    ]);
  }

  // List<PieChartSectionData> showingSections() {
  //   return List.generate(5, (index) {
  //     final isTouched = index == touchedIndex;
  //     final double opacity = isTouched ? 1 : 0.6;
  //
  //     // Condition
  //     switch (index) {
  //       case MENU_MAIN:
  //         return getMenu(0, "blue");
  //       // return PieChartSectionData(
  //       //   color: Colors.blue.withOpacity(opacity),
  //       //   value: 1,
  //       //   title: "blue pie",
  //       //   radius: radioOut,
  //       //   titleStyle: TextStyle(
  //       //     fontSize: 18,
  //       //     fontWeight: FontWeight.bold,
  //       //     decoration: TextDecoration.none,
  //       //     color: Colors.black,
  //       //   ),
  //       //   titlePositionPercentageOffset: 0.5,
  //       // );
  //       case MENU_CARD:
  //         return PieChartSectionData(
  //           color: Colors.red.withOpacity(opacity),
  //           value: 1,
  //           title: "red pie",
  //           radius: radioOut,
  //           titleStyle: TextStyle(
  //               fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
  //           titlePositionPercentageOffset: 0.99,
  //         );
  //       case 2:
  //         return PieChartSectionData(
  //           color: Colors.green.withOpacity(opacity),
  //           value: 1,
  //           title: "green pie",
  //           radius: radioOut,
  //           titleStyle: TextStyle(
  //               fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
  //           titlePositionPercentageOffset: 0.99,
  //         );
  //       case 3:
  //         return PieChartSectionData(
  //           color: Colors.yellow.withOpacity(opacity),
  //           value: 1,
  //           title: "yellow pie",
  //           radius: radioOut,
  //           titleStyle: TextStyle(
  //               fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
  //           titlePositionPercentageOffset: 0.99,
  //         );
  //       case 4:
  //         return PieChartSectionData(
  //           color: Colors.yellow.withOpacity(opacity),
  //           value: 1,
  //           title: "yellow pie",
  //           radius: radioOut,
  //           titleStyle: TextStyle(
  //               fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
  //           titlePositionPercentageOffset: 0.99,
  //         );
  //       default:
  //         return PieChartSectionData(
  //           color: Colors.yellow.withOpacity(opacity),
  //           value: 1,
  //           title: "yellow pie",
  //           radius: radioOut,
  //           titleStyle: TextStyle(
  //               fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
  //           titlePositionPercentageOffset: 0.99,
  //         );
  //     }
  //   });
  // }

  String yellowCard = "assets/images/card_yellow.png";
  String redCard = "assets/images/card_red.png";
  String blackCard = "assets/images/card_black.png";

  PieChartSectionData getMenu(
      int index, String name, Color background, String icon) {
    return PieChartSectionData(
      color: background.withOpacity(index == touchedIndex ? 0.85 : 0.45),
      value: 1,
      // title: false ? "" : name,
      title: "",
      badgeWidget: Container(
        // color: Colors.blue,
        alignment: Alignment.center,
        width: 80,
        height: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != ""
                ? Image(width: 28, height: 28, image: Image.asset(icon).image)
                : Container(),
            SizedBox(height: 5),
            Text(name,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  color: Colors.white,
                ))
          ],
        ),
      ),
      radius: radioOut,
      titleStyle: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.none,
        color: Colors.white,
      ),
      titlePositionPercentageOffset: 0.5,
    );
  }

  int currentMenuType = 0;

  Color green = Color.fromRGBO(32, 211, 62, 1);
  Color red = Color.fromRGBO(214, 11, 11, 1);
  Color blue = Color.fromRGBO(3, 53, 219, 1);
  Color black = Color.fromRGBO(15, 15, 15, 1);

  String swordsIcon = "assets/images/swords_icon.png";
  String shieldIcon = "assets/images/shield_icon.png";
  String circleIcon = "assets/images/circle_icon.png";

  List<PieChartSectionData> currentMenu() {
    if (currentMenuType == MENU_MAIN) {
      return [
        getMenu(0, "Swords", red, swordsIcon),
        getMenu(1, "Shield", green, shieldIcon),
        getMenu(2, "Circle", blue, circleIcon)
      ];
    }
    if (currentMenuType == MENU_CARD) {
      return [
        getMenu(MENU_CARD_YELLOW, "Yellow Card", black, yellowCard),
        getMenu(MENU_CARD_RED, "Red Card", black, redCard),
        getMenu(MENU_CARD_BLACK, "Black Card", black, blackCard),
        // getMenu(3, "径向3")
      ];
    }

    if (currentMenuType == MENU_SWORDS) {
      return [
        getMenu(0, "Simple attack", red, ""),
        getMenu(1, "Compound attack", red, ""),
        getMenu(2, "Point in line", red, ""),
        // getMenu(3, "Indirect Attack"),
        getMenu(3, "Beat Attack", red, "")
      ];
    }

    if (currentMenuType == MENU_SHIELD) {
      return [
        getMenu(0, "Parry-riposte", green, ""),
        getMenu(1, "Attack no, attack", green, ""),
        getMenu(2, "Opposition", green, ""),
      ];
    }

    if (currentMenuType == MENU_CIRCLE) {
      return [
        getMenu(0, "Counterattack", blue, ""),
        getMenu(1, "Remise", blue, ""),
        getMenu(2, "Simultaneous", blue, ""),
      ];
    }
    return [];
  }

  void clickOperate(int pos, int menuType, bool challenge) {
    setState(() {
      if (isShow) {
        isShow = false;
        // refViewOperateResume();
      } else {
        isShow = true;
        // left = detail.globalPosition.dx;
        // top = detail.globalPosition.dy;

        position = pos;

        // isLeft = left < MediaQuery.of(context).size.width / 2;
        // Future.delayed(Duration(seconds: 5), () {
        //   // print("延迟两秒钟后输出");
        //   setState(() {
        //     isShow = false;
        //   });
        // });
        isChallenge = challenge;

        currentMenuType = menuType;

        refViewOperatePause(false);
      }
    });
  }

  Widget btnView(String name, int color, int height) {
    Color c = Colors.black;
    if (color == 0) {
      c = Color.fromRGBO(0, 0, 0, 1);
    }
    if (color == 1) {
      c = Color.fromRGBO(10, 57, 212, 1);
    }
    if (color == 2) {
      c = Color.fromRGBO(168, 46, 21, 1);
    }
    return Container(
      height: height == 0 ? 40 : 50,
      width: 160,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: c,
          borderRadius: const BorderRadius.all(Radius.circular(25.0))),
      child: Text(
        name,
        style: TextStyle(color: Colors.white, fontSize: 15),
      ),
    );
  }

  Widget challengeView(bool isLeft) {
    Positioned view = Positioned(
        bottom: 90,
        left: isLeft ? 15 : null,
        right: isLeft ? null : 15,
        child: GestureDetector(
          onTap: () {
            if (isLeft) {
              if (refViewMatch.leftChallenge <= 0) {
                return;
              }
            } else {
              if (refViewMatch.rightChallenge <= 0) {
                return;
              }
            }
            clickOperate(isLeft ? POS_LEFT : POS_RIGHT, MENU_MAIN, true);
          },
          child: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(isLeft
                        ? "assets/images/left_challenge_btn.png"
                        : "assets/images/right_challenge_btn.png"))),
            alignment: isLeft ? Alignment.bottomRight : Alignment.bottomLeft,
            padding: EdgeInsets.only(
                right: isLeft ? 9 : 0,
                bottom: isLeft ? 2 : 0,
                left: !isLeft ? 9 : 0),
            child: Text(
              isLeft
                  ? refViewMatch.leftChallenge.toString()
                  : refViewMatch.rightChallenge.toString(),
              style: TextStyle(
                  color: Color.fromRGBO(3, 255, 238, 1), fontSize: 10),
            ),
          ),
        ));

    return view;
  }

  Widget foulView(bool isLeft) {
    return Positioned(
        left: isLeft ? 60 : null,
        right: !isLeft ? 60 : null,
        bottom: 120,
        child: GestureDetector(
          onTap: () {
            clickOperate(isLeft ? POS_LEFT : POS_RIGHT, MENU_CARD, false);
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/foul_btn.png"))),
          ),
        ));
  }

  Widget eventView(bool isLeft) {
    return Positioned(
        left: isLeft ? 45 : null,
        right: !isLeft ? 45 : null,
        bottom: 30,
        child: GestureDetector(
          onTap: () {
            clickOperate(isLeft ? POS_LEFT : POS_RIGHT, MENU_MAIN, false);
          },
          child: Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(isLeft
                        ? "assets/images/left_event_btn.png"
                        : "assets/images/right_event_btn.png"))),
          ),
        ));
  }

  String centerHint = "";
  String cancelHint = "";
  String confirmHint = "";

  void setConfirm(String hint) {
    isShowConfirm = true;
    centerHint = hint;

    if (currentMenuType == MENU_CARD || position == POS_MIDDLE) {
      confirmHint = "Ok";
      cancelHint = "Cancel";
    } else {
      confirmHint = "Hits";
      cancelHint = "Off Target";
    }
  }

  void resetConfirm() {
    isShowConfirm = false;
    touchedIndex = -1;
  }

  void addEvent(bool isValid) {
    RefViewEvent event = RefViewEvent();
    event.hint = centerHint;
    event.time = refViewMatch.maxSeconds - refViewMatch.currentSeconds;
    event.isLeftMain = position;

    if (currentMenuType == MENU_CARD) {
      if (!isValid) {
        return;
      }
      if (touchedIndex == MENU_CARD_YELLOW) {
        event.lost = 0.5;
      } else if (touchedIndex == MENU_CARD_BLACK) {
        event.lost = 0;
      } else {
        event.lost = 1;
      }
      event.isLeftLost = position;
      event.cardType = touchedIndex!;
    } else {
      if (position == POS_MIDDLE && !isValid) {
        return;
      }
      if (position != POS_MIDDLE) {
        event.isLeftLost = 3 - position;
      } else {
        event.isLeftLost = position;
      }
      if (isValid) {
        event.lost = 1;
        event.hint = centerHint + " Hits";
      } else {
        event.hint = centerHint + " Off Target";
      }
    }

    refViewMatch.addEvent(event);
  }

  void updateCard() {
    cardCount = refViewMatch.getCard();
  }

  bool isShowResume = false;

  void updateRecordState() {
    isShowResume = !refViewRecord!.isRecording();
    // Future.delayed(Duration(milliseconds: 200), (){
    //
    //   setState(() {
    //
    //   });
    // });
  }
}

typedef RefViewOperateConfirm = void Function(int tb);
typedef RefViewOperatePause = void Function(bool isPauseBtn);
typedef RefViewOperateResume = void Function();
typedef RefViewOperateMark = void Function();
