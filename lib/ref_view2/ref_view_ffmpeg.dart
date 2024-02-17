import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';

class RefViewFFmpeg {
  final FlutterFFprobe _flutterFFprobe = new FlutterFFprobe();

  //剪辑 s秒到e秒
  void reduce(String inputPath, String outPath, double s, double e,
      RefViewFFmpegReduce refViewFFmpegReduce) {
    // String inputFilePath = inputFile.path;
    // String outputFilePath =
    //     await FileUtils.outputFileNameStr(inputFile);

    String inputFilePath = inputPath;
    String outputFilePath = outPath;

    var ffmpeg = new FlutterFFmpeg();
    ffmpeg
        .execute(
            // "-i $inputFilePath -ss $s -to $e -c:v libx264 $outputFilePath")//这里是ffmpeg指令 裁剪60s视频
            "-i $inputFilePath -ss $s -to $e -y $outputFilePath") //这里是ffmpeg指令 裁剪60s视频
        .then((rc) async {
      if (rc == 0) {
        //rc=0表示成功
        //裁剪60s 转换 libx264
        print("success");
        refViewFFmpegReduce();
      } else {
        // showToast('视频裁剪出现异常，请重试', context);
        // Navigator.pop(context);
        print("fail");
      }
    });
  }

  //剪辑 t秒前
  void reducePrevious(String inputPath, String outPath, double t,
      RefViewFFmpegReduce refViewFFmpegReduce) {
    _flutterFFprobe.getMediaInformation(inputPath).then((info) {
      print(
          "Media Information" + info.getAllProperties()['format']['duration']);
      double? time =
          double.tryParse(info.getAllProperties()['format']['duration']);
      if (t > time!) {
        t = time;
      }
      reduce(inputPath, outPath, time - t, time, refViewFFmpegReduce);
      //   print("Path: ${info.getMediaProperties()['filename']}");
      //   print("Format: ${info.getMediaProperties()['format_name']}");
      //   print("Duration: ${info.getMediaProperties()['duration']}");
      //   print("Start time: ${info.getMediaProperties()['start_time']}");
      //   print("Bitrate: ${info.getMediaProperties()['bit_rate']}");
      //   Map<dynamic, dynamic> tags = info.getMediaProperties()['tags'];
      //   if (tags != null) {
      //     tags.forEach((key, value) {
      //       print("Tag: " + key + ":" + value + "\n");
      //     });
      //   }
      //
      //   if (info.getStreams() != null) {
      //     List<StreamInformation> streams = info.getStreams();
      //
      //     if (streams.length > 0) {
      //       for (var stream in streams) {
      //         print("Stream id: ${stream.getAllProperties()['index']}");
      //         print("Stream type: ${stream.getAllProperties()['codec_type']}");
      //         print("Stream codec: ${stream.getAllProperties()['codec_name']}");
      //         print("Stream full codec: ${stream.getAllProperties()['codec_long_name']}");
      //         print("Stream format: ${stream.getAllProperties()['pix_fmt']}");
      //         print("Stream width: ${stream.getAllProperties()['width']}");
      //         print("Stream height: ${stream.getAllProperties()['height']}");
      //         print("Stream bitrate: ${stream.getAllProperties()['bit_rate']}");
      //         print("Stream sample rate: ${stream.getAllProperties()['sample_rate']}");
      //         print("Stream sample format: ${stream.getAllProperties()['sample_fmt']}");
      //         print("Stream channel layout: ${stream.getAllProperties()['channel_layout']}");
      //         print("Stream sar: ${stream.getAllProperties()['sample_aspect_ratio']}");
      //         print("Stream dar: ${stream.getAllProperties()['display_aspect_ratio']}");
      //         print("Stream average frame rate: ${stream.getAllProperties()['avg_frame_rate']}");
      //         print("Stream real frame rate: ${stream.getAllProperties()['r_frame_rate']}");
      //         print("Stream time base: ${stream.getAllProperties()['time_base']}");
      //         print("Stream codec time base: ${stream.getAllProperties()['codec_time_base']}");
      //
      //         Map<dynamic, dynamic> tags = stream.getAllProperties()['tags'];
      //         if (tags != null) {
      //           tags.forEach((key, value) {
      //             print("Stream tag: " + key + ":" + value + "\n");
      //           });
      //         }
      //       }
      //     }
      //   }
    });
  }

  //合并视频
  void montage(
      List<String> inputPath, String outputPath, RefViewFFmpegMontage montage) {
    // String x = "ffmpeg -i 1.mp4 -i douyin.mp4 -i 3.1.mp4 -filter_complex '[0:v:0][0:a:0][1:v:0][1:a:0][2:v:0][2:a:0]concat=n=3:v=1:a=1[ov][oa]' -map '[ov]' -map '[oa]' -vsync 2 output.mp4";
    // String xx = "ffmpeg -f concat -i concat:01.mp4|02.mp4 -c copy output.mp4";
    // String exe = "-i concat:'" +
    //     inputPathV1 +
    //     "|" +
    //     inputPathV2 +
    //     "' -c copy -y " +
    //     outputPath;
    //
    // String xxx = "-i " +
    //     inputPathV1 +
    //     " -i " +
    //     inputPathV2 +
    //     " -filter_complex '[0:0] [0:1] [1:0] [1:1] concat=n=2:v=1:a=1 [v] [a]' -map [v] -map [a] -y " +
    //     outputPath;

    String p = writeInstruct(inputPath);

    String xx1 = "-f concat -safe 0 -i " + p + " -c copy -y " + outputPath;

    var ffmpeg = new FlutterFFmpeg();

    ffmpeg
        .execute(xx1) //这里是ffmpeg指令 裁剪60s视频
        .then((rc) async {
      if (rc == 0) {
        //rc=0表示成功
        //裁剪60s 转换 libx264
        print("success");
        montage();
      } else {
        // showToast('视频裁剪出现异常，请重试', context);
        // Navigator.pop(context);
        print("fail");
      }
    });

    // ffmpeg.execute(xx1); //这里是ffmpeg指令 裁剪60s视频
  }

  String writeInstruct(List<String> inputPath) {
    if (inputPath.length <= 0) {
      return "";
    }
    String xp =
        inputPath.first.replaceAll(XFile(inputPath.first).name, "instruct.txt");
    File f = File(xp);

    if (!f.existsSync()) {
      f.createSync();
    }

    StringBuffer sb = StringBuffer();
    inputPath.forEach((element) {
      sb.writeln("file '" + element + "'");
    });

    f.writeAsStringSync(sb.toString());

    return xp;

    // f.writeAsStringSync(
    //     "file '/storage/emulated/0/c1.mp4'\rfile '/storage/emulated/0/c2.mp4'",
    //     flush: true);
  }
}

typedef RefViewFFmpegMontage = void Function();
typedef RefViewFFmpegReduce = void Function();
