import 'package:camera/camera.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import 'package:path_provider/path_provider.dart';
import 'package:u_f_l_demo/ref_view2/ref_view_dialog.dart';
import 'package:u_f_l_demo/ref_view2/ref_view_ffmpeg.dart';

class RefViewRecord {
  CameraController? cameraController;

  late RefViewFFmpeg refViewFFmpeg;

  // late final RefViewRecordStop refViewRecordStop;

  RefViewRecord({CameraController? camera}) {
    cameraController = camera;
    refViewFFmpeg = RefViewFFmpeg();
  }

  int videoIndex = 0;

  List<String> highlight = [];

  String currentPath = "";
  String lastPath = "";

  bool isStarting = false;

  void start({required RefViewRecordStart start}) {
    if (cameraController!.value.isRecordingVideo || isStarting) {
      return;
    }

    videoIndex++;

    isStarting = true;

    cameraController!.startVideoRecording().then((value) {
      isStarting = false;
      start();
    });
  }

  void stop({required RefViewRecordStop stop}) async {
    if (!cameraController!.value.isRecordingVideo) {
      return;
    }

    XFile file = await cameraController!.stopVideoRecording();

    lastPath = file.path;

    try {
      if (currentPath == "") {
        currentPath = file.path;
        stop();
      } else {
        //叠加
        String np = file.path
            .replaceAll(file.name, "REC" + videoIndex.toString() + ".mp4");
        refViewFFmpeg.montage([currentPath, file.path], np, () {
          currentPath = np;
          stop();
        });
      }

      // Future.delayed(const Duration(milliseconds: 1000), () {
      //
      // });

      // await XFile(currentPath).saveTo("/storage/emulated/0/比赛录像.mp4");

      // Fluttertoast.showToast(msg: "导出到/文件管理/比赛录像.mp4");
    } catch (e) {
      // Fluttertoast.showToast(msg: "导出失败，查看您的权限");
    }
  }

  void reset() {
    // highlight = [];
  }

  String currentHighlight = "";

  void mark(BuildContext context) {
    if (currentHighlight == currentPath) {
      Fluttertoast.showToast(msg: "Success Download");
      return;
    }
    RefViewDialog.showLoading(context);

    String np = currentPath.replaceAll(
        XFile(currentPath).name, "HL" + highlight.length.toString() + ".mp4");

    refViewFFmpeg.reducePrevious(currentPath, np, 10, () {
      ImageGallerySaver.saveFile(np).then((value){
        RefViewDialog.closeLoading(context);

        highlight.add(np);
        currentHighlight = currentPath;

        Fluttertoast.showToast(msg: "Success Download");
      });

    });
  }

  void download() {
    if (highlight.length <= 0) {
      Fluttertoast.showToast(msg: "Empty Highlight");
      return;
    }
    DateTime time = DateTime.now();
    String date = time.year.toString() +
        "-" +
        time.month.toString() +
        "-" +
        time.day.toString() +
        "-" +
        time.hour.toString() +
        ":" +
        time.minute.toString() +
        ":" +
        time.second.toString();

    String name = "Highlights-$date.mp4";

    String np = highlight[0].replaceAll(
        XFile(highlight[0]).name, name);

    refViewFFmpeg.montage(highlight, np, () {
      ImageGallerySaver.saveFile(np, name: "Highlights-$date").then((value){
        Fluttertoast.showToast(msg: "Success Download", toastLength: Toast.LENGTH_LONG);
      });
    });

  }

  bool isRecording() {
    return cameraController!.value.isRecordingVideo;
  }
}

typedef RefViewRecordStop = void Function();
typedef RefViewRecordStart = void Function();
