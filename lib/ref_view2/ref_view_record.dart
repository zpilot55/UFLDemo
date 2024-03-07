

import 'dart:io';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

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

  void downloadHighlights(BuildContext context) {
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

    RefViewDialog.showLoading(context);

    refViewFFmpeg.montage(highlight, np, () {
      addWatermark(np, (outPath) {
        RefViewDialog.closeLoading(context);
        exportVideo(outPath, "Highlights-$date", true);
      });
      // ImageGallerySaver.saveFile(np, name: "Highlights-$date").then((value){
      //   Fluttertoast.showToast(msg: "Success Download", toastLength: Toast.LENGTH_LONG);
      // });
    });
  }

  void downloadMatch(BuildContext context){
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

    RefViewDialog.showLoading(context);

    addWatermark(currentPath, (String outPath){
      RefViewDialog.closeLoading(context);
      exportVideo(outPath, "Match-$date", true);
    });

    // ImageGallerySaver.saveFile(currentPath, name: "Match-$date").then((value){
    //   Fluttertoast.showToast(msg: "Success Download", toastLength: Toast.LENGTH_LONG);
    // });
  }

  void addWatermark(String inputPath, RefViewFFmpegWatermark watermark) async {
    File f =  await getImageFile();

    String np = currentPath.replaceAll(
        XFile(currentPath).name, "export.mp4");
    refViewFFmpeg.watermark(inputPath, f.path, np, watermark);
  }


  void downloadAll(BuildContext context) async{
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

    RefViewDialog.showLoading(context);


    addWatermark(currentPath, (String outPath){
      // RefViewDialog.closeLoading(context);
      exportVideo(outPath, "Match-$date", false);

      if (highlight.length <= 0) {
        return;
      }

      String name = "Highlights-$date.mp4";

      String np = highlight[0].replaceAll(
          XFile(highlight[0]).name, name);

      refViewFFmpeg.montage(highlight, np, () {
        addWatermark(np, (outPath) {
          RefViewDialog.closeLoading(context);
          exportVideo(outPath, "Highlights-$date", true);
        });
      });
    });
  }

  void exportVideo(String path, String name, bool isShowHint){
    ImageGallerySaver.saveFile(path, name: name).then((value){
      if(isShowHint){
        Fluttertoast.showToast(msg: "Success Download", toastLength: Toast.LENGTH_LONG);
      }
    });
  }

  Future<File> getImageFile() async{
    DateTime time = DateTime.now();
    String date = time.year.toString() +
        "-" +
        time.month.toString() +
        "-" +
        time.day.toString() +
        " " +
        time.hour.toString() +
        ":" +
        time.minute.toString() +
        ":" +
        time.second.toString();

    Uint8List? pngBytes = await _getWatermark(tar: date);

    String np = currentPath.replaceAll(
        XFile(currentPath).name, "time.png");

    File file = File(np); //"/storage/emulated/0/456.png"
    file.writeAsBytes(pngBytes!);
    return file;
  }


  Future<Uint8List?> _getWatermark({required String tar}) async {
    var pictureRecorder = new PictureRecorder();
    var canvas = new Canvas(pictureRecorder);
    // var images = await getImage(
    //   'assets/images/fencer_default_icon.png',//assets的图片路径
    // );
    Paint _linePaint = new Paint();
    // 绘制图片
    // canvas.drawImage(images, Offset(32, 0), _linePaint); // 这个Offset是值可以自己算（0,0起点开始，中间的话就是画布宽度-2*图片的宽度）：图片的宽就是分辨率的宽。
    // 绘制文字
    ParagraphBuilder pb = ParagraphBuilder(ParagraphStyle(
        textAlign: TextAlign.center,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 25.0));
    // pb.pushStyle(TextStyle(color:Colors.red));
    pb.addText(tar);
    // 设置文本的宽度约束
    ParagraphConstraints pc = ParagraphConstraints(width: 300);
    Paragraph paragraph = pb.build()..layout(pc);
    canvas.drawParagraph(paragraph, Offset(0, 0)); //images.height!.toDouble() + 5
    var picture =
    await pictureRecorder.endRecording().toImage(300, 100); //设置生成图片的宽和高
    var pngImageBytes =
    await picture.toByteData(format: ImageByteFormat.png);

    return pngImageBytes?.buffer.asUint8List();
  }

  //图片转换
  // Future<Image> getImage(String asset) async {
  //   ByteData data = await rootBundle.load(asset);
  //   Codec codec = await instantiateImageCodec(data.buffer.asUint8List());
  //   FrameInfo fi = await codec.getNextFrame();
  //   return fi.image;
  // }


  bool isRecording() {
    return cameraController!.value.isRecordingVideo;
  }
}

typedef RefViewRecordStop = void Function();
typedef RefViewRecordStart = void Function();
