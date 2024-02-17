import 'dart:async';

class RefViewCountdown {

  Timer? timer;

  RefViewCountdown(
      {required RefViewCountdownCallback update, required RefViewCountdownEnd end}) {
    this.refViewCountdownCallback = update;
    this.refViewCountdownEnd = end;
  }

  RefViewCountdownCallback? refViewCountdownCallback;

  RefViewCountdownEnd? refViewCountdownEnd;

  int maxSeconds = 0;

  String currentTime = "";

  int currentSeconds = 0;

  void startTime(int max) {
    if (timer != null) {
      timer?.cancel();
    }

    maxSeconds = max;
    currentSeconds = max;
    timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      // print('11');
      currentSeconds--;

      currentTime = formatDuration(Duration(seconds: currentSeconds));

      if (currentSeconds <= 0) {
        currentSeconds = 0;
        currentTime = "00:00";

        refViewCountdownEnd!();
        refViewCountdownCallback!(currentTime);

        stopTime();

      }else{
        refViewCountdownCallback!(currentTime);
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

  // void initTime() {
  //   refViewMatch.currentSeconds = refViewMatch.maxSeconds;
  //   currentTime = formatDuration(Duration(seconds: refViewMatch.currentSeconds));
  //   refViewTimeCallback!(currentTime);
  // }

  void dispose() {
    if (timer != null) {
      timer!.cancel();
    }
  }
}

typedef RefViewCountdownCallback = void Function(
    String currentTime);

typedef RefViewCountdownEnd = void Function();
