import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:u_f_l_demo/backend/firebase/firebase_config.dart';
import 'package:u_f_l_demo/ref_view2/ref_view_countdown.dart';
import 'package:u_f_l_demo/ref_view2/ref_view_dialog.dart';
import 'package:u_f_l_demo/ref_view2/ref_view_ffmpeg.dart';
import 'package:u_f_l_demo/ref_view2/ref_view_model.dart';
import 'package:u_f_l_demo/ref_view2/ref_view_operate.dart';
import 'package:u_f_l_demo/ref_view2/ref_view_record.dart';
import 'package:u_f_l_demo/ref_view2/ref_view_time.dart';
import 'package:u_f_l_demo/ref_view2/seekbar/flutter_seekbar.dart';
import 'package:video_player/video_player.dart';

late List<CameraDescription> _cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase();

  runApp(MaterialApp(home: RefViewPage(match: RefViewMatch())));
}

/// CameraApp is the Main Application.
class RefViewPage extends StatefulWidget {
  /// Default Constructor
  // const RefViewPage({super.key});

  late RefViewMatch refViewMatch;

  RefViewPage({required RefViewMatch match}) {
    refViewMatch = match;
  }

  @override
  State<RefViewPage> createState() => RefViewPageState(refViewMatch!);
}

class RefViewPageState extends State<RefViewPage> {
  RefViewPageState(RefViewMatch match) {
    refViewMatch = match;
  }

  CameraController? controller;
  VideoPlayerController? videoController;

  RefViewTime? refViewTime;

  late RefViewMatch refViewMatch;

  RefViewRecord? refViewRecord;

  late RefViewDialog refViewDialog;

  late RefViewCountdown refViewCountdown;

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);

    setStatusShow(false);

    availableCameras().then((value) {
      // print(value);
      _cameras = value;

      controller = CameraController(_cameras[0], ResolutionPreset.high);

      refViewRecord = RefViewRecord(camera: controller!);

      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      }).catchError((Object e) {
        if (e is CameraException) {
          switch (e.code) {
            case 'CameraAccessDenied':
              // Handle access errors here.
              break;
            default:
              // Handle other errors here.
              break;
          }
        }
      });
    });

    // refViewMatch = RefViewMatch();

    refViewTime = RefViewTime(
        update: (String ct) {
          currentTime = ct;
          setState(() {});
        },
        end: () {
          //时间到
          setResumeState(false, refViewMatch.result());
        },
        match: refViewMatch);

    refViewCountdown = RefViewCountdown(
        update: (String ct) {
          countdownTime = ct;
          setState(() {});
        },
        end: () {});

    refViewRecord = RefViewRecord(camera: null);
    refViewDialog = RefViewDialog();
  }

  String countdownTime = "";

  String currentTime = "";

  String periodWinIcon = "";
  String periodWinName = "";

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    setStatusShow(true);

    controller!.dispose();

    refViewTime!.dispose();

    videoController!.dispose();

    super.dispose();
  }

  double leftNum = 1;
  double rightNum = 1;

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   home: CameraPreview(controller),
    // );

    return WillPopScope(
        child: MaterialApp(
            home: Scaffold(
          // appBar: AppBar(title: Text("test"),backgroundColor: Colors.red),
          extendBodyBehindAppBar: true, //主要代码为extendBodyBehindAppBar 这个属性
          appBar: AppBar(
            centerTitle: true,
            // 标题居中
            backgroundColor: getAppBarBackground(),
            // 背景颜色设置为透明
            shadowColor: getAppBarBackground(),
            // 阴影也要设置为透明
            //把AppBar 设置为透明色
            elevation: 0,
            title: getAppBarMain(),
            leading: getAppBarIcon(),
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(alignment: Alignment.center, children: [
              cameraView(), //底层相机
              Visibility(
                child: videoView(),
                visible: isShowVideo,
              ), //回放
              Visibility(child: infoView(), visible: state == 0), //信息
              Visibility(child: progressView(), visible: state == 1), //进行中
              Visibility(child: resultView(), visible: state == 2), //结果
              Visibility(
                child: eventView(),
                visible: state == 3,
              ), //事件,
              Visibility(child: seekView(), visible: isShowVideo),
              Visibility(child: speedView(), visible: isShowVideo),
            ]),
          ),
          // bottomNavigationBar: Text("123"),
        )),
        onWillPop: () async {
          clickExit();
          return false;
        });
  }

  /// 获取新列表中的权限 如果有一项不合格就返回false
  requestPermission(List<Permission> permissionList) async {
    Map<Permission, PermissionStatus> statuses = await permissionList.request();
    PermissionStatus currentPermissionStatus = PermissionStatus.granted;
    bool isP = true;
    statuses.forEach((key, value) {
      if (!value.isGranted) {
        currentPermissionStatus = value;
        isP = false;
        return;
      }
    });
    return isP;
  }

  //相机
  Widget cameraView() {
    if (controller == null || !controller!.value.isInitialized) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/img_record_backround.png"))),
      );
    }
    return Positioned(left: 0, right: 0, child: CameraPreview(controller!));
  }

  //回合
  Widget videoView() {
    // return videoController != null && videoController!.value.isInitialized
    //     ? AspectRatio(
    //         aspectRatio: videoController!.value.aspectRatio,
    //         child: VideoPlayer(videoController!),
    //       )
    //     : Container(color: Colors.black);

    return Row(
      children: [
        Expanded(
            child: Container(
          color: Colors.black,
        )),
        videoController != null && videoController!.value.isInitialized
            ? AspectRatio(
                aspectRatio: videoController!.value.aspectRatio,
                child: VideoPlayer(videoController!),
              )
            : Container(color: Colors.black),
        Expanded(
            child: Container(
          color: Colors.black,
        )),
      ],
    );
  }

  //计时
  Positioned timeView() {
    return Positioned(
        top: 70,
        child: Text(
            refViewTime!
                .formatDuration(Duration(seconds: refViewMatch.maxSeconds)),
            style: TextStyle(color: Colors.white, fontSize: 20)));
  }

  Widget bloodView(bool isLeft) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                  top: 5,
                  bottom: 5,
                  right: isLeft ? 50 : 0,
                  left: isLeft ? 0 : 50),
              margin: EdgeInsets.only(
                  left: isLeft ? 15 : 0, right: isLeft ? 0 : 15),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(isLeft
                          ? "assets/images/left_state_background.png"
                          : "assets/images/right_state_background.png"),
                      fit: BoxFit.fill)),
              child: Text(
                isLeft ? refViewMatch.leftName : refViewMatch.rightName,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            Positioned(
                right: isLeft ? 0 : null,
                left: isLeft ? null : 0,
                child: Container(
                  alignment: Alignment.center,
                  width: 44,
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(isLeft
                              ? "assets/images/left_state_block.png"
                              : "assets/images/right_state_block.png"),
                          fit: BoxFit.fill)),
                  child: Text(
                    isLeft ? "L" : "R",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ))
          ],
        ),
        Row(
          children: [
            Expanded(
                child: Stack(
              children: [
                Container(
                  key: isLeft ? globalKey : null,
                  alignment: Alignment.center,
                  height: 10,
                  margin: EdgeInsets.only(
                      left: isLeft ? 28 : 55, right: isLeft ? 55 : 28),
                  // padding: EdgeInsets.only(top: 3, bottom: 3),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage("assets/images/life_background.png"),
                          fit: BoxFit.fill)),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 10,
                  margin: EdgeInsets.only(
                      left: isLeft ? 28 : 55 + rightBlood,
                      right: isLeft ? 55 + leftBlood : 28),
                  // padding: EdgeInsets.only(top: 3, bottom: 3),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/life_value.png"),
                          fit: BoxFit.fill)),
                )
              ],
            ))
          ],
        )
      ],
    );
  }

  double leftBlood = 0;
  double rightBlood = 0;

  //左主要按钮
  Positioned mainLeftView() {
    return Positioned(
        left: 40,
        bottom: 40,
        child: TextButton(
          child: Text(
            "左按钮",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            setState(() {
              // if (rightNum > 0) {
              //   rightNum -= 0.1;
              // }
              _getWH();
            });
            // jumpVideo();
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red)),
        ));
  }

  //右主要按钮
  Positioned mainRightView() {
    return Positioned(
        right: 40,
        bottom: 40,
        child: TextButton(
          child: Text(
            "右按钮",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            setState(() {
              if (leftNum > 0) {
                leftNum -= 0.1;
              }
            });
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue)),
        ));
  }

  // Positioned mainView() {
  //   return Positioned(
  //       bottom: 40,
  //       child: TextButton(
  //         child: Text(
  //           isStart ? "停止比赛" : "开始比赛",
  //           style: TextStyle(color: Colors.white, fontSize: 20),
  //         ),
  //         onPressed: () async {
  //           if (isStart) {
  //             //停止
  //             if (!controller!.value.isRecordingVideo) {
  //               return;
  //             }
  //             XFile file = await controller!.stopVideoRecording();
  //             try {
  //               await file.saveTo("/storage/emulated/0/比赛录像.mp4");
  //               Fluttertoast.showToast(msg: "导出到/文件管理/比赛录像.mp4");
  //             } catch (e) {
  //               Fluttertoast.showToast(msg: "导出失败，查看您的权限");
  //             }
  //             path = file.path;
  //             print(file.path);
  //           } else {
  //             //开始
  //             if (controller!.value.isRecordingVideo) {
  //               return;
  //             }
  //             await controller!.startVideoRecording();
  //           }
  //           setState(() {
  //             isStart = !isStart;
  //           });
  //         },
  //         style: ButtonStyle(
  //             backgroundColor: MaterialStateProperty.all(Colors.green)),
  //       ));
  // }

  RefViewOperate? refViewOperate;

  Widget progressView() {
    return Column(
      children: [
        Container(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                SizedBox(width: 15),
                Column(
                  children: [
                    // SizedBox(height: 25),
                    iconView(
                        refViewMatch.leftIcon, 50, refViewMatch.priority == 1),
                    // Text(
                    //   "james",
                    //   style: TextStyle(color: Colors.white, fontSize: 13),
                    // )
                  ],
                ),
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom: 10),
                  child: ClipPath(
                    // shape: BeveledRectangleBorder(
                    //     // side: BorderSide(width: 1, color: Colors.red),
                    //     borderRadius: BorderRadius.only(
                    //         topLeft: Radius.elliptical(-10, 20),
                    //         bottomLeft: Radius.elliptical(40, 80),
                    //         bottomRight: Radius.circular(80))),
                    clipper: TrianglePath(),
                    child: Container(
                      height: 60,
                      // width: 250,
                      // alignment: Alignment.center,
                      color: Color.fromRGBO(0, 0, 0, 0.5),
                      padding: EdgeInsets.only(left: 0, right: 0, top: 0),
                      // decoration: ,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(child: bloodView(true)),
                          SizedBox(width: 5),
                          Text(
                            refViewMatch.leftScore.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          SizedBox(width: 15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  "Period " +
                                      refViewMatch.currentPeriod.toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13)),
                              SizedBox(height: 5),
                              Text(currentTime,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15)),
                            ],
                          ),
                          SizedBox(width: 15),
                          Text(
                            refViewMatch.rightScore.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          SizedBox(width: 5),
                          Expanded(child: bloodView(false))
                        ],
                      ),
                    ),
                  ),
                )),
                Column(
                  children: [
                    // SizedBox(height: 25),
                    iconView(
                        refViewMatch.rightIcon, 50, refViewMatch.priority == 2),
                    // Text(
                    //   "kobe",
                    //   style: TextStyle(color: Colors.white, fontSize: 13),
                    // )
                  ],
                ),
                SizedBox(width: 15),
              ],
            )),
        Expanded(
            child: Row(children: [
          Expanded(
              child: Container(
            child: refViewOperate = RefViewOperate(
                match: refViewMatch,
                record: refViewRecord!,
                confirm: (int tb) {
                  // setResumeState();
                  setState(() {
                    updateBlood();
                  });
                },
                pause: (bool isPauseBtn) {
                  if (isPauseBtn) {
                    setResumeState(true, -1);
                  } else {
                    refViewTime!.stopTime();
                    refViewRecord!.stop(stop: () {
                      showVideo();
                    });
                  }
                },
                resume: () {
                  refViewRecord!.start(start: () {
                    refViewTime!.startTime();
                    hideVideo();
                  });
                },
                mark: () {
                  refViewRecord!.mark(context);
                }),
            // color: Colors.deepPurple,
          )),
          // Expanded(child: PieChartPage())
        ]))
      ],
    );

    // return RawMaterialButton(
    //   shape: BeveledRectangleBorder(
    //       side: BorderSide(width: 1, color: Colors.red),
    //       borderRadius: BorderRadius.circular(10)),
    //   child: Text('老孟'),
    //   onPressed: () {},
    // );
  }

  final GlobalKey globalKey = GlobalKey();

  double _getWH() {
    double containerWidth = globalKey.currentContext!.size!.width;
    double containerHeight = globalKey.currentContext!.size!.height;
    print('Container widht is $containerWidth, height is $containerHeight');

    return (containerWidth - 55 - 28) / refViewMatch.maxTouch;
  }

  Color getAppBarBackground() {
    if (state == 0) {
      return Colors.black26;
    }
    if (state == 1) {
      return Colors.transparent;
    }
    if (state == 2) {
      return Colors.black26;
    }
    return Colors.black87;
  }

  Widget getAppBarIcon() {
    return state != 1
        ? GestureDetector(
            onTap: () {
              goBack();
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          )
        : Text("");
  }

  void goBack() {
    if (state == 3) {
      setResumeState(true, -1);
    } else {
      clickExit();
    }
  }

  Widget getAppBarMain() {
    setStatusShow(state != 1);

    if (state == 2) {
      return Row(
        children: [
          Text("Period " + refViewMatch.currentPeriod.toString()), //3:00 min
          Expanded(child: SizedBox()),
          // GestureDetector(
          //     onTap: () {
          //       print(',');
          //     },
          //     child: Text("Record")),
          // SizedBox(
          //   width: 30,
          // ),
          // GestureDetector(onTap: () {}, child: Text("Foil"))
        ],
      );
    }
    if (state == 0) {
      // return Text(
      // refViewTime!
      //     .formatDuration(Duration(seconds: refViewMatch.maxSeconds)),
      // style: TextStyle(color: Colors.white, fontSize: 16));

      return Text(countdownTime,
          style: TextStyle(color: Colors.white, fontSize: 16));
    }
    if (state == 3) {
      return Text("Period " + refViewMatch.currentPeriod.toString(),
          style: TextStyle(color: Colors.white, fontSize: 16));
    }
    return Text("");
  }

  Widget infoView() {
    return SafeArea(
        child: Row(children: [
      infoMenuView(refViewMatch.leftIcon, refViewMatch.leftName, 0, true,
          refViewMatch.priority == 1),
      Expanded(
          child: Container(
        padding: EdgeInsets.only(top: 20, bottom: 20),
        child: Column(children: [
          Text(
            "Period: " + refViewMatch.currentPeriod.toString(),
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            refViewMatch.leftScore.toString() +
                " - " +
                refViewMatch.rightScore.toString(),
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500),
          ),
          Expanded(child: SizedBox()),
          GestureDetector(
              onTap: () {
                clickExit();
              },
              child: btnView("END BOUT", blackColor, 0)),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
              onTap: () {
                setRecordState(true);

                // refViewDialog.showCoin(context, refViewMatch, result: (result) {
                //   setState(() {});
                // });
              },
              child: btnView("START", blueColor, 0))
        ]),
      )),
      infoMenuView(refViewMatch.rightIcon, refViewMatch.rightName, 1, true,
          refViewMatch.priority == 2),
    ]));
  }

  Widget infoMenuView(
      String url, String name, int index, bool isBackground, bool isPriority) {
    return Container(
        width: 130,
        padding: EdgeInsets.only(top: isBackground ? 40 : 15, bottom: 40),
        alignment: Alignment.center,
        // color: Colors.green,
        decoration: isBackground
            ? index == 0
                ? BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(0, 199, 255, 0.8),
                        Color.fromRGBO(0, 138, 165, 0.1),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  )
                : BoxDecoration(
                    gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(255, 38, 0, 0.8),
                      Color.fromRGBO(159, 25, 3, 0.1),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ))
            : BoxDecoration(),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          iconView(url, 60, isPriority),
          SizedBox(height: 10),
          Text(name, style: TextStyle(color: Colors.white)),
          Expanded(child: SizedBox()),
          Row(
            children: isBackground
                ? [
                    Expanded(
                        child: Container(
                            height: 50,
                            alignment: Alignment.center,
                            decoration: index == 0
                                ? BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color.fromRGBO(10, 67, 255, 0.1),
                                        Color.fromRGBO(0, 199, 255, 1),
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black38,
                                          blurRadius: 15,
                                          offset: Offset(0, 0))
                                    ],
                                  )
                                : BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color.fromRGBO(255, 38, 0, 0.8),
                                        Color.fromRGBO(159, 25, 3, 0.1),
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black38,
                                          blurRadius: 15,
                                          offset: Offset(0, 0))
                                    ],
                                  ),
                            child: Text(index == 0 ? "Left" : "Right",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500))))
                  ]
                : [],
          )
        ]));
  }

  Widget iconView(String url, double size, bool isPriority) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      ClipOval(
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
                      image:
                          AssetImage("assets/images/fencer_default_icon.png"),
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
      ),
      Visibility(
          visible: isPriority,
          child: Container(
            decoration: BoxDecoration(
                // color: Colors.green,
                image: DecorationImage(
                    image: AssetImage("assets/images/priority_tag.png"),
                    fit: BoxFit.fitWidth)),
            alignment: Alignment.bottomCenter,
            width: size,
            height: size / 2,
          ))
    ]);
  }

  // Widget iconView(String url, double size) {
  //   return ClipOval(
  //     child: Image.network(
  //       url,
  //       fit: BoxFit.cover,
  //       width: size,
  //       height: size,
  //       errorBuilder: (context, error, stackTrace) {
  //         return Container(
  //           // color: Colors.amber,
  //           decoration: BoxDecoration(
  //               image: DecorationImage(
  //                   image: AssetImage("assets/images/fencer_default_icon.png"),
  //                   fit: BoxFit.fill)),
  //           alignment: Alignment.center,
  //           width: size,
  //           height: size,
  //           // child: const Text(
  //           //   'Whoops!',
  //           //   style: TextStyle(fontSize: 30),
  //           // ),
  //         );
  //       },
  //     ),
  //   );
  // }

  Color blueColor = Color.fromRGBO(10, 57, 212, 1);
  Color blackColor = Color.fromRGBO(0, 0, 0, 1);
  Color redColor = Color.fromRGBO(168, 46, 21, 1);
  Color cyanColor = Color.fromRGBO(0, 223, 223, 1);
  Color greyColor = Color.fromRGBO(103, 103, 103, 1);

  Widget btnView(String name, Color color, int height) {
    return Container(
      height: height == 0 ? 40 : 50,
      width: 160,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(25.0))),
      child: Text(
        name,
        style: TextStyle(color: Colors.white, fontSize: 15),
      ),
    );
  }

  Widget resultView() {
    return SafeArea(
        child: Stack(children: [
      Column(
        children: [
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 30),
              // periodWinIcon == "" ? SizedBox() : iconView(periodWinIcon, 50),
              // SizedBox(width: 20),
              // Text(
              //   periodWinName,
              //   style: TextStyle(color: Colors.white, fontSize: 16),
              // ),
              GestureDetector(
                  onTap: () {
                    clickExit();
                  },
                  child: btnView("End Bout", blackColor, 0)),
              Expanded(child: SizedBox()),
              GestureDetector(
                  onTap: () {
                    setEventState();
                  },
                  child: btnView("MATCH EVENTS", redColor, 0)),
              SizedBox(width: 30),
            ],
          ),
          // Text(
          //   isEndPeriod() ? "Winner: " + getWinner() : "",
          //   style: TextStyle(color: Colors.white, fontSize: 16),
          // ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: SizedBox()),
              Column(
                children: [
                  iconView(
                      refViewMatch.leftIcon, 50, refViewMatch.priority == 1),
                  SizedBox(height: 10),
                  Text(
                    refViewMatch.leftName,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  )
                ],
              ),
              SizedBox(width: 50),
              Column(
                children: [
                  Text(
                    "Score",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  // Text(isEndPeriod() ? "$leftScore-$rightScore" : "",
                  //     style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 25,
                  //         fontWeight: FontWeight.w500)),
                  Text(
                      refViewMatch.leftScore.toString() +
                          " - " +
                          refViewMatch.rightScore.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500)),
                ],
              ),
              SizedBox(width: 50),
              Column(
                children: [
                  iconView(
                      refViewMatch.rightIcon, 50, refViewMatch.priority == 2),
                  SizedBox(height: 10),
                  Text(
                    refViewMatch.rightName,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  )
                ],
              ),
              Expanded(child: SizedBox()),
            ],
          ),
          Expanded(child: SizedBox()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: resultBtnView(),
          ),
          SizedBox(height: 40)
        ],
      ),
      // Container(
      //   // color: Colors.yellow,
      //   alignment: Alignment.center,
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text("Winner:Left Player", style: TextStyle(color: Colors.white, fontSize: 16),),
      //       SizedBox(height: 15),
      //       Text("$leftScore-$rightScore", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500)),
      //       SizedBox(height: 20),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //         btnView("Discard", 0, 1),
      //         SizedBox(width: 15),
      //         btnView("Confirm", 1, 1),
      //         SizedBox(width: 15),
      //         btnView("Download\nHighlights", 1, 1),
      //       ],)
      //     ],
      //   ),
      // )
    ]));
  }

  int state = 0;

  void setStartState() {
    state = 0;
    refViewMatch.currentPeriod++;

    hideVideo();

    refViewCountdown.startTime(60);

    checkOvertime();

    setState(() {});
  }

  void checkOvertime() {
    //加时赛
    if (refViewMatch.isOvertime()) {
      refViewDialog.showCoin(context, refViewMatch, result: (result) {
        setState(() {});
      });
    }
  }

  void setRecordState(bool isInit) {
    if (refViewRecord == null) {
      return;
    }

    if (isInit) {
      refViewTime!.initTime();
      leftBlood = 0;
      rightBlood = 0;

      refViewMatch.reset();
      refViewRecord!.reset();

      refViewRecord!.start(start: () {
        refViewTime!.startTime();
        state = 1;
        hideVideo();
      });
    } else {
      refViewRecord!.start(start: () {
        refViewTime!.startTime();
        state = 1;
        hideVideo();
      });
    }
  }

  bool isPause = false;

  void setResumeState(bool? isP, int result) {
    // if (result < 0) {
    //   return;
    // }
    if (isP != null) {
      isPause = isP;
    }

    state = 2;
    refViewTime!.stopTime();
    refViewRecord!.stop(stop: () {
      showVideo();
    });

    //平局
    periodWinName = "";
    periodWinIcon = "";

    if (refViewMatch.leftScore > refViewMatch.rightScore) {
      // refViewMatch.leftScore++;
      periodWinName = refViewMatch.leftName;
      periodWinIcon = refViewMatch.leftIcon;
    }
    if (refViewMatch.leftScore < refViewMatch.rightScore) {
      // refViewMatch.rightScore++;
      periodWinName = refViewMatch.rightName;
      periodWinIcon = refViewMatch.rightIcon;
    }

    setState(() {});
  }

  void setEventState() {
    state = 3;
    setState(() {});
  }

  String getWinner() {
    if (refViewMatch.leftScore > refViewMatch.rightScore) {
      return refViewMatch.leftName;
    }
    if (refViewMatch.rightScore > refViewMatch.leftScore) {
      return refViewMatch.rightName;
    }
    return "Nobody";
  }

  bool isEndPeriod() {
    if (refViewMatch.currentPeriod >= refViewMatch.maxPeriod ||
        refViewMatch.leftScore >= refViewMatch.maxTouch ||
        refViewMatch.rightScore >= refViewMatch.maxTouch) {
      return true;
    }
    return false;
  }

  List<Widget> resultBtnView() {
    if (isPause) {
      return [
        // GestureDetector(
        //     onTap: () {
        //       clickExit();
        //     },
        //     child: btnView("End Bout", blackColor, 1)),
        // SizedBox(
        //   width: 30,
        // ),
        GestureDetector(
            onTap: () {
              RefViewEvent event = RefViewEvent();
              event.hint = "Simultaneous";
              event.time =
                  refViewMatch.maxSeconds - refViewMatch.currentSeconds;
              event.isLeftMain = RefViewOperateState.POS_MIDDLE;
              event.isLeftLost = RefViewOperateState.POS_MIDDLE;
              event.lost = 0;
              refViewMatch.addEvent(event);
              Fluttertoast.showToast(msg: "Success");
            },
            child: btnView("Simultaneous", greyColor, 1)),
        SizedBox(
          width: 30,
        ),
        GestureDetector(
            onTap: () {
              // setStartState();
              setRecordState(false);
            },
            child: btnView("Resume", blueColor, 1)),
        // SizedBox(
        //   width: 30,
        // ),
        // GestureDetector(
        //     onTap: () {
        //       downloadHighlights();
        //     },
        //     child: btnView("Download\nHighlights", cyanColor, 1)),
      ];
    }
    if (isEndPeriod()) {
      if (refViewMatch.isAppend()) {
        return [
          GestureDetector(
              onTap: () {
                setStartState();
              },
              child: btnView("Append Period", blueColor, 1)),
          // SizedBox(
          //   width: 30,
          // ),
          // GestureDetector(
          //     onTap: () {
          //       clickExit();
          //     },
          //     child: btnView("End Bout", blackColor, 1))
        ];
      }
      return [
        GestureDetector(
            onTap: () {
              // setStartState();
              Navigator.pop(context);
            },
            child: btnView("Discard", greyColor, 1)),
        SizedBox(
          width: 30,
        ),
        GestureDetector(
            onTap: () {
              // setStartState();
              // Navigator.pop(context);
              clickExit();
            },
            child: btnView("Confirm", blackColor, 1)),
        // SizedBox(
        //   width: 30,
        // ),
        // GestureDetector(
        //     onTap: () {
        //       downloadHighlights();
        //     },
        //     child: btnView("Download\nHighlights", cyanColor, 1)),
      ];
    }
    return [
      GestureDetector(
          onTap: () {
            setStartState();
          },
          child: btnView("Next Period", blueColor, 1)),
      // SizedBox(
      //   width: 30,
      // ),
      // GestureDetector(
      //     onTap: () {
      //       clickExit();
      //     },
      //     child: btnView("End Bout", blackColor, 1))
    ];
  }

  void updateBlood() {
    List list = refViewMatch.getLostScore();

    double sp = _getWH();
    leftBlood = sp * list[0];
    rightBlood = sp * list[1];

    //更新得分
    refViewMatch.leftScore = list[1];
    refViewMatch.rightScore = list[0];

    //有结果了
    if (list[2] >= 0) {
      setResumeState(false, list[2]);
    }

    //附加赛的判定
    if (refViewMatch.isOvertime()) {
      if (refViewMatch.leftScore != refViewMatch.rightScore) {
        setResumeState(false, list[2]);
      }
    }
  }

  void showVideo() {
    isShowVideo = true;

    videoController = VideoPlayerController.file(
        new File(refViewRecord!.lastPath)) //refViewRecord!.currentPath
      ..initialize().then((_) {
        playVideo();

        setState(() {});
        // _controller.setPlaybackSpeed(0.1);
      });

    videoController!.addListener(() {
      // print("xx" + videoController!.value.position.toString());

      setState(() {
        value = videoController!.value.position.inSeconds.toDouble();
        print(max.toString() + "-" + value.toString());
      });
      if (videoController!.value.position >= videoController!.value.duration) {
        playVideo();
        setState(() {});
      }
    });

    // videoController!.setLooping(true);

    setState(() {});
  }

  void playVideo() {
    videoController!.play();

    int m = videoController!.value.duration.inSeconds;

    max = m.toDouble();

    m = m - 10;
    if (m < 0) {
      m = 0;
    }
    min = m.toDouble();

    videoController!.seekTo(Duration(seconds: m));
  }

  void hideVideo() {
    isShowVideo = false;
    videoController!.pause();
    videoController!.dispose();
    videoController = null;
    setState(() {});
  }

  bool isShowVideo = false;

  downloadHighlights(int type) async {
    bool isH = await requestPermission([Permission.storage]);
    if (isH) {
      if (type == 0) {
        refViewRecord!.downloadAll(context);
      }

      if (type == 1) {
        refViewRecord!.downloadHighlights(context);
      }

      if (type == 2) {
        refViewRecord!.downloadMatch(context);
      }
    }
  }

  Widget eventItemView(RefViewEvent event) {
    String point = "";
    Widget? view = eventItemCenterView(event);
    if (event.isLeftMain == RefViewOperateState.POS_LEFT) {
      point = "assets/images/point_blue.png";
      view = eventItemLeftView(event);
    }
    if (event.isLeftMain == RefViewOperateState.POS_RIGHT) {
      point = "assets/images/point_red.png";
      view = eventItemRightView(event);
    }
    return Container(
      // height: 50,
      padding: EdgeInsets.only(top: 15, bottom: 15),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
              bottom: 0,
              width: 15,
              height: 15,
              child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(point), fit: BoxFit.fill)))),
          view!
        ],
      ),
    );
  }

  Widget eventItemCenterView(RefViewEvent event) {
    String t = refViewTime!.formatDuration(Duration(seconds: event.time));
    const Radius r = Radius.circular(10.0);
    return Row(
      children: [
        Expanded(child: SizedBox()),
        // SizedBox(width: 40),
        Expanded(
            flex: 2,
            child: Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                // height: 40,
                child: Row(
                  children: [
                    SizedBox(width: 5),
                    Text(
                      t,
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      // height: 35,
                      padding: EdgeInsets.only(
                          left: 10, right: 10, bottom: 3, top: 3),
                      child: Text(event.hint,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                          // maxLines: 1,
                          softWrap: true,
                          overflow: TextOverflow.clip),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(47, 47, 47, 1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                    )),
                    SizedBox(width: 5),
                  ],
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(0, 199, 255, 1),
                        Color.fromRGBO(225, 38, 0, 1),
                        // Color.fromRGBO(83, 21, 11, 1),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: const BorderRadius.only(
                        topLeft: r,
                        topRight: r,
                        bottomRight: r,
                        bottomLeft: r)))),
        Expanded(child: SizedBox()),
      ],
    );
  }

  Widget eventItemRightView(RefViewEvent event) {
    String t = refViewTime!.formatDuration(Duration(seconds: event.time));
    const Radius r = Radius.circular(10.0);
    return Row(
      children: [
        Expanded(child: SizedBox()),
        SizedBox(width: 40),
        Expanded(
            child: Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                // height: 40,
                child: Row(
                  children: [
                    SizedBox(width: 5),
                    Text(
                      t,
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      // height: 35,
                      padding: EdgeInsets.only(
                          left: 10, right: 10, bottom: 3, top: 3),
                      child: Text(event.hint,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                          // maxLines: 1,
                          softWrap: true,
                          overflow: TextOverflow.clip),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(47, 47, 47, 1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                    )),
                    SizedBox(width: 5),
                  ],
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(225, 38, 0, 1),
                        Color.fromRGBO(83, 21, 11, 1),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: const BorderRadius.only(
                        topLeft: r, topRight: r, bottomRight: r)))),
      ],
    );
  }

  Widget eventItemLeftView(RefViewEvent event) {
    String t = refViewTime!.formatDuration(Duration(seconds: event.time));
    const Radius r = Radius.circular(10.0);
    return Row(
      children: [
        Expanded(
            child: Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                // height: 40,
                child: Row(
                  children: [
                    SizedBox(width: 5),
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      // height: 35,
                      padding: EdgeInsets.only(
                          left: 10, right: 10, bottom: 3, top: 3),
                      child: Text(event.hint,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                          // maxLines: 1,
                          softWrap: true,
                          overflow: TextOverflow.clip),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(47, 47, 47, 1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                    )),
                    SizedBox(width: 5),
                    Text(
                      t,
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                    SizedBox(width: 5),
                  ],
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(10, 56, 109, 1),
                        Color.fromRGBO(0, 199, 255, 1),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: const BorderRadius.only(
                        topLeft: r, bottomLeft: r, topRight: r)))),
        SizedBox(width: 40),
        Expanded(child: SizedBox())
      ],
    );
  }

  Widget eventView() {
    List<Widget> list = [];
    List<RefViewEvent> eList =
        refViewMatch.getEvent(refViewMatch.currentPeriod);

    // Text(refViewTime!.formatDuration(Duration(seconds: element.time)) +
    //     "-" +
    //     element.hint)

    eList.forEach((element) {
      list.add(eventItemView(element));
      //
    });

    return SafeArea(
        child: Container(
            color: Colors.black54,
            child: Row(
              children: [
                infoMenuView(refViewMatch.leftIcon, refViewMatch.leftName, 0,
                    false, refViewMatch.priority == 1),
                Expanded(
                    child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                        top: 0,
                        bottom: 0,
                        child: Container(
                          width: 1,
                          color: Colors.white54,
                        )),
                    Positioned(
                        child: Column(
                      children: [
                        Expanded(
                          child: Container(
                              // color: Colors.black,
                              child: ListView(
                            children: list,
                          )),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                            onTap: () {
                              setResumeState(null, -1);
                            },
                            child: btnView("END MATCH", blueColor, 0)),
                        SizedBox(height: 40)
                      ],
                    ))
                  ],
                )),
                infoMenuView(refViewMatch.rightIcon, refViewMatch.rightName, 1,
                    false, refViewMatch.priority == 2)
              ],
            )));
  }

  void clickExit() {
    refViewDialog.showExit(context, refViewMatch, (type) {
      downloadHighlights(type);
    });
  }

  void setStatusShow(bool isShow) {
    if (isShow) {
      // 这种模式显示状态栏
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
    } else {
      // 这种模式不现实状态栏
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: [SystemUiOverlay.bottom]);
    }
    setState(() {});
  }

  Widget seekView() {
    return Positioned(
        bottom: 10,
        width: MediaQuery.of(context).size.width,
        child: Container(
            // color: Colors.red,
            // width: 200,
            child: SeekBar(
          isRound: false,
          min: min,
          max: max,
          value: value,
          onValueChanged: (ProgressValue value) {
            print(value!.value.toString() + "-po+$min++$max");
            int s = (min + (max - min) * value.progress).toInt();
            videoController!.seekTo(Duration(seconds: s));
          },
          backgroundColor: Colors.black87,
          progressColor: blueColor,
        )));
  }

  String speed = "x1";

  Widget speedView() {
    return Positioned(
        bottom: 35,
        left: 0,
        width: 60,
        height: 25,
        child: GestureDetector(
          onTap: () {
            refViewDialog.showSpeed(context, select: (String sp, double s) {
              setState(() {
                speed = sp;
                videoController!.setPlaybackSpeed(s);
              });
            });
          },
          child: Container(
              child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                              "assets/images/speed_background.png"))),
                  child: Text(
                    speed,
                    style: TextStyle(color: Colors.white),
                  ))),
        ));
  }

  double value = 0, max = 0, min = 0;
}

class TrianglePath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(0 + 30, size.height);
    path.lineTo(size.width - 30, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class TrianglePath2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(0 + 17, size.height);
    path.lineTo(size.width - 17, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
