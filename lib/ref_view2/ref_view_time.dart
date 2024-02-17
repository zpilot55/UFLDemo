import 'dart:async';

import 'package:u_f_l_demo/ref_view2/ref_view_model.dart';

class RefViewTime {
  Timer? timer;

  late RefViewMatch refViewMatch;

  RefViewTime(
      {required RefViewTimeCallback update,
      required RefViewTimeEnd end,
      required RefViewMatch match}) {
    this.refViewTimeCallback = update;
    this.refViewTimeEnd = end;
    this.refViewMatch = match;
  }

  RefViewTimeCallback? refViewTimeCallback;

  RefViewTimeEnd? refViewTimeEnd;

  // int maxSeconds = 0;

  String currentTime = "";

  void startTime() {
    if (timer != null) {
      timer?.cancel();
    }
    timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      // print('11');
      refViewMatch.currentSeconds--;

      currentTime =
          formatDuration(Duration(seconds: refViewMatch.currentSeconds));

      if (refViewMatch.currentSeconds <= 0) {
        refViewMatch.currentSeconds = 0;
        currentTime = "00:00";

        refViewTimeEnd!();
        refViewTimeCallback!(currentTime);

        stopTime();
      } else {
        refViewTimeCallback!(currentTime);
      }

      // setState(() {
      //
      // });

      // print(currentTime);
    });
  }

  String formatDuration(Duration duration) {
    int hours = duration.inHours;
    int minutes = (duration - Duration(hours: hours)).inMinutes;
    int remainingSeconds = (duration - Duration(minutes: minutes)).inSeconds;

    // int mSeconds =
    (duration - Duration(minutes: remainingSeconds)).inMilliseconds;

    // String hour = formatNumber(hours, false);
    String minute = formatNumber(minutes, false);
    String seconds = formatNumber(remainingSeconds, true);
    // String mS = formatNumber(mSeconds, false);
    return minute + ':' + seconds;
  }

  String formatNumber(int number, bool isSecond) {
    if (number < 10) {
      return "0" + number.toString();
    } else {
      return number.toString();
    }
  }

  void stopTime() {
    if (timer != null) {
      timer?.cancel();
    }
  }

  void initTime() {
    if (refViewMatch.isOvertime()) {
      //
      refViewMatch.currentSeconds = 60; //
    } else {
      refViewMatch.currentSeconds = refViewMatch.maxSeconds;
    }

    currentTime =
        formatDuration(Duration(seconds: refViewMatch.currentSeconds));
    refViewTimeCallback!(currentTime);
  }

  void dispose() {
    if (timer != null) {
      timer!.cancel();
    }
  }
}

typedef RefViewTimeCallback = void Function(String currentTime);

typedef RefViewTimeEnd = void Function();
