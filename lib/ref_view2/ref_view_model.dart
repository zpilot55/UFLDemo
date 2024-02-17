import 'package:u_f_l_demo/ref_view2/ref_view_operate.dart';

class RefViewEvent {
  int isLeftLost = 0; //影响左
  int isLeftMain = 0; //发起左

  int time = -1; //发生时间

  int cardType = -1;

  String hint = ""; //提示

  double lost = 0; //失分
}

class RefViewMatch {
  List<List<RefViewEvent>>? periodList;

  String leftName = "Kobe Bryant";
  String rightName = "LeBron James";
  String leftIcon =
      "http://pic.imeitou.com/uploads/allimg/2016070214/cvlvaeqy5jk.jpg";
  String rightIcon =
      "http://img.crcz.com/allimg/201809/25/1537873515255049.jpg";

  int maxTouch = 3;

  int maxSeconds = 180; //180
  int currentSeconds = 0;

  int currentPeriod = 1;
  int maxPeriod = 3; //3

  int leftChallenge = 3;
  int rightChallenge = 3;

  int leftScore = 0;
  int rightScore = 0;

  int priority = 0;

  RefViewMatch() {
    periodList = [];
    for (int i = 0; i < maxPeriod + 1; i++) {
      //+1 包含加时赛
      periodList!.add([]);
    }
  }

  List<RefViewEvent> getEvent(int period) {
    return periodList![(period - 1)];
  }

  void addEvent(RefViewEvent value) {
    getEvent(currentPeriod).add(value);
  }

  List getLostScore() {
    List<RefViewEvent> eventList = getEvent(currentPeriod);
    double leftLost = 0;
    double rightLost = 0;
    eventList.forEach((element) {
      if (element.isLeftLost == RefViewOperateState.POS_LEFT) {
        leftLost += element.lost;
      }
      if (element.isLeftLost == RefViewOperateState.POS_RIGHT) {
        rightLost += element.lost;
      }
    });

    int result = -1;
    if (leftLost >= maxTouch) {
      if (leftLost == rightLost) {
        result = 0;
      } else {
        result = 2;
      }
    }
    if (rightLost >= maxTouch) {
      if (leftLost == rightLost) {
        result = 0;
      } else {
        result = 1;
      }
    }

    return [leftLost.toInt(), rightLost.toInt(), result];
  }

  int result() {
    List<RefViewEvent> eventList = getEvent(currentPeriod);
    int leftLost = 0;
    int rightLost = 0;
    eventList.forEach((element) {
      if (element.isLeftLost == RefViewOperateState.POS_LEFT) {
        leftLost += element.lost.toInt();
      }
      if (element.isLeftLost == RefViewOperateState.POS_RIGHT) {
        rightLost += element.lost.toInt();
      }
    });

    if (leftLost > rightLost) {
      return 2;
    }
    if (rightLost > leftLost) {
      return 1;
    }
    return 0;
  }

  List getCard() {
    List<RefViewEvent> eventList = getEvent(currentPeriod);
    int leftYellow = 0;
    int leftRed = 0;
    int leftBlack = 0;

    int rightYellow = 0;
    int rightRed = 0;
    int rightBlack = 0;

    eventList.forEach((element) {
      if (element.cardType == 0) {
        if (element.isLeftLost == RefViewOperateState.POS_LEFT) {
          leftYellow++;
        }
        if (element.isLeftLost == RefViewOperateState.POS_RIGHT) {
          rightYellow++;
        }
      }
      if (element.cardType == 1) {
        if (element.isLeftLost == RefViewOperateState.POS_LEFT) {
          leftRed++;
        }
        if (element.isLeftLost == RefViewOperateState.POS_RIGHT) {
          rightRed++;
        }
      }
      if (element.cardType == 2) {
        if (element.isLeftLost == RefViewOperateState.POS_LEFT) {
          leftBlack++;
        }
        if (element.isLeftLost == RefViewOperateState.POS_RIGHT) {
          rightBlack++;
        }
      }
    });

    return [leftYellow, leftRed, leftBlack, rightYellow, rightRed, rightBlack];
  }

  void reset() {}

  bool isOvertime() {
    if (currentPeriod > maxPeriod) {
      return true;
    }
    return false;
  }

  bool isAppend() {
    if (leftScore == rightScore &&
        currentPeriod >= maxPeriod &&
        leftScore < maxTouch &&
        priority == 0) {
      return true;
    }
    return false;
  }
}
