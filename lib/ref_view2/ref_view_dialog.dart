import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:u_f_l_demo/ref_view2/ref_view_model.dart';
// import 'package:get/get.dart';

class RefViewDialog {
  static bool isShow = false;

  static void showLoading(BuildContext context) {
    isShow = true;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.schedule,
                          color: Colors.black,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "loading",
                          style: TextStyle(color: Colors.black, fontSize: 13),
                        )
                      ],
                    ))
              ],
            ),
            onWillPop: () async {
              return false;
            });
      },
    );
  }

  static void closeLoading(BuildContext context) {
    if (!isShow) {
      return;
    }
    Navigator.pop(context);
    isShow = false;
  }

  bool isShowExit = false;

  void showExit(BuildContext context, RefViewMatch refViewMatch,
      RefViewDialogExit refViewDialogExit) {
    isShowExit = true;
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return ExitWidget(
          match: refViewMatch,
          exit: refViewDialogExit,
        );
      },
    );
  }

  void showSpeed(BuildContext context, {required RefViewDialogSpeed select}) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Stack(
          children: [
            Positioned(
                bottom: 35,
                left: 12,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 30, right: 30),
                  width: 280,
                  height: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                              "assets/images/speed_select_background.png"))),
                  //
                  child: Row(
                    children: [
                      speedItemView(context, "x0.25", 0.25, select),
                      speedItemView(context, "x0.5", 0.5, select),
                      speedItemView(context, "x1", 1, select),
                      speedItemView(context, "x1.5", 1.5, select),
                    ],
                  ),
                ))
          ],
        );
      },
    );
  }

  Widget speedItemView(BuildContext context, String name, double s,
      RefViewDialogSpeed refViewDialogSpeed) {
    return Expanded(
        child: GestureDetector(
      onTap: () {
        refViewDialogSpeed(name, s);
        Navigator.pop(context);
      },
      child: Container(
          alignment: Alignment.center,
          color: Colors.transparent,
          child: Text(
            name,
            style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                decoration: TextDecoration.none),
          )),
    ));
  }

  void showCoin(BuildContext context, RefViewMatch match,
      {required RefViewDialogCoin result}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return CoinWidget(match: match, result: result);
      },
    );
  }
}

class ExitWidget extends StatefulWidget {
  RefViewMatch? refViewMatch;
  RefViewDialogExit? refViewDialogExit;

  ExitWidget({required RefViewMatch match, required RefViewDialogExit exit}) {
    refViewMatch = match;
    refViewDialogExit = exit;
  }

  @override
  State<StatefulWidget> createState() =>
      ExitWidgetState(refViewMatch!, refViewDialogExit!);
}

class ExitWidgetState extends State<ExitWidget> {
  RefViewMatch? refViewMatch;
  RefViewDialogExit? refViewDialogExit;

  ExitWidgetState(RefViewMatch match, RefViewDialogExit exit) {
    refViewMatch = match;
    refViewDialogExit = exit;
  }

  int result = -1;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    String hint = "who is the winner";

    if (result == 1) {
      hint = refViewMatch!.leftName + " Win";
    }

    if (result == 2) {
      hint = refViewMatch!.rightName + " Win";
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
            width: 400,
            height: 280,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: const BorderRadius.all(Radius.circular(10.0))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                        child: GestureDetector(
                            onTap: () {
                              result = 1;
                              setState(() {});
                            },
                            child: Column(
                              children: [
                                iconView(refViewMatch!.leftIcon, 60),
                                SizedBox(height: 10),
                                Text(refViewMatch!.leftName,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        decoration: TextDecoration.none)),
                                SizedBox(height: 10),
                                result == 1
                                    ? Icon(Icons.wine_bar,
                                        color: Colors.yellow, size: 25)
                                    : SizedBox(height: 25)
                              ],
                            ))),
                    Column(children: [
                      GestureDetector(
                          onTap: () {
                            // downloadHighlights();
                            // refViewDialogExit!(0);
                            showDownload();
                          },
                          child: btnView("Download\nHighlights", cyanColor, 0)),
                      SizedBox(height: 20),
                      Text(
                        refViewMatch!.leftScore.toString() +
                            "-" +
                            refViewMatch!.rightScore.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            decoration: TextDecoration.none),
                      ),
                    ]),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        result = 2;
                        setState(() {});
                      },
                      child: Column(
                        children: [
                          iconView(refViewMatch!.rightIcon, 60),
                          SizedBox(height: 10),
                          Text(refViewMatch!.rightName,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  decoration: TextDecoration.none)),
                          SizedBox(height: 10),
                          result == 2
                              ? Icon(
                                  Icons.wine_bar,
                                  color: Colors.yellow,
                                  size: 25,
                                )
                              : SizedBox(height: 25)
                        ],
                      ),
                    ))
                  ],
                ),
                SizedBox(height: 0),
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    hint,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        decoration: TextDecoration.none),
                  ),
                )),
                Row(
                  children: [
                    SizedBox(width: 30),
                    GestureDetector(
                        onTap: () {
                          if (result <= 0) {
                            Fluttertoast.showToast(msg: "Please Select Winner");
                            return;
                          }
                          int index = 0;
                          Navigator.popUntil(context, (route) {
                            if (index < 2) {
                              index++;
                              return false;
                            }
                            return true;
                          });
                        },
                        child: btnView("Confirm", blueColor, 0)),
                    Expanded(child: SizedBox()),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: btnView("Cancel", greyColor, 0)),
                    SizedBox(width: 30)
                  ],
                ),
                SizedBox(height: 20),
              ],
            ))
      ],
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

  Color blueColor = Color.fromRGBO(10, 57, 212, 1);
  Color blackColor = Color.fromRGBO(0, 0, 0, 1);
  Color redColor = Color.fromRGBO(168, 46, 21, 1);
  Color cyanColor = Color.fromRGBO(0, 223, 223, 1);
  Color greyColor = Color.fromRGBO(103, 103, 103, 1);

  Widget btnView(String name, Color color, int height) {
    return Container(
      height: height == 0 ? 40 : 50,
      width: 150,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(25.0))),
      child: Text(
        name,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }

  void showDownload() {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                // top:0,
                //   bottom:0,
                // bottom: 35,
                // left: 12,
                child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 30, right: 30),
              width: 280,
              // color: Colors.white,
              height: 140,
              // decoration: BoxDecoration(
              //     image: DecorationImage(
              //         fit: BoxFit.fill,
              //         image: AssetImage(
              //             "assets/images/speed_select_background.png"))),
              //
              child: Column(
                children: [
                  GestureDetector(
                      onTap: () {
                        refViewDialogExit!(0);
                      },
                      child: btnView("Match and\nHighlights", blueColor, 0)),
                  SizedBox(height: 10),
                  GestureDetector(
                      onTap: () {
                        refViewDialogExit!(1);
                      },
                      child: btnView("Highlights Only", cyanColor, 0)),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      refViewDialogExit!(2);
                    },
                    child: btnView("Match Only", redColor, 0),
                  )
                ],
              ),
            ))
          ],
        );
      },
    );
  }
}

class CoinWidget extends StatefulWidget {
  RefViewMatch? refViewMatch;
  RefViewDialogCoin? refViewDialogCoin;

  CoinWidget({required RefViewMatch match, required RefViewDialogCoin result}) {
    refViewMatch = match;
    refViewDialogCoin = result;
  }

  @override
  State<StatefulWidget> createState() =>
      CoinWidgetState(refViewMatch!, refViewDialogCoin!);
}

class CoinWidgetState extends State<CoinWidget> {
  RefViewMatch? refViewMatch;
  RefViewDialogCoin? refViewDialogCoin;

  CoinWidgetState(RefViewMatch match, RefViewDialogCoin result) {
    refViewMatch = match;
    refViewDialogCoin = result;
  }

  int result = -1;

  String coinAni = "assets/images/coin_animation.gif";
  String coinOn = "assets/images/coin_animation_on.png";
  String coinOff = "assets/images/coin_animation_off.png";

  String coinUrl = "";

  String hint = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //获取随机数
    int res = Random().nextInt(100); //0-99

    result = 0;
    if (res <= 49) {
      result = 1;
    } else {
      result = 2;
    }

    coinUrl = coinAni;
    hint = "";
    // print(res.toString());
    //

    Future.delayed(Duration(milliseconds: result == 1 ? 1900 : 1100), () {
      print("延迟两秒钟后输出");

      if (result == 1) {
        coinUrl = coinOn;
        hint = refViewMatch!.leftName + " priority";
        refViewMatch!.priority = 1;
      } else {
        coinUrl = coinOff;
        hint = refViewMatch!.rightName + " priority";
        refViewMatch!.priority = 2;
      }

      refViewDialogCoin!(result);

      setState(() {});

      // result(r);
      // Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                // bottom: 35,
                // left: 0,
                // right: 0,
                child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 30, right: 30),
              width: 280,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              //
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // color: Colors.amber,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(coinUrl), fit: BoxFit.fill)),
                    alignment: Alignment.center,
                    width: 80,
                    height: 80,
                    // child: const Text(
                    //   'Whoops!',
                    //   style: TextStyle(fontSize: 30),
                    // ),
                  ),
                  SizedBox(height: 15),
                  Text(hint,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          decoration: TextDecoration.none)),
                  SizedBox(height: 15),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: btnView("Confirm", blueColor, 0)),
                ],
              ),
            ))
          ],
        ),
        onWillPop: () async {
          return false;
        });
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

  Color blueColor = Color.fromRGBO(10, 57, 212, 1);
  Color blackColor = Color.fromRGBO(0, 0, 0, 1);
  Color redColor = Color.fromRGBO(168, 46, 21, 1);
  Color cyanColor = Color.fromRGBO(0, 223, 223, 1);
  Color greyColor = Color.fromRGBO(103, 103, 103, 1);

  Widget btnView(String name, Color color, int height) {
    return Container(
      height: height == 0 ? 40 : 50,
      width: 150,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(25.0))),
      child: Text(
        name,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}

typedef RefViewDialogSpeed = void Function(String spShow, double sp);

typedef RefViewDialogCoin = void Function(int result);

typedef RefViewDialogExit = void Function(int type);
