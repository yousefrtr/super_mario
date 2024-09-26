import 'dart:async';

import 'package:get/get.dart';
import 'package:super_mario/constants/assets.dart';
import 'package:super_mario/constants/speeds.dart';

class SuperMarioController extends GetxController {
  @override
  void onClose() {
    timerMarioLeft?.cancel();
    timerMarioRight?.cancel();

    super.onClose();
  }

  String _marioRun = Assets.mario;
  void setMarioRun(String value) {
    _marioRun = value;
  }

  double pipeX = 2;

  String get marioRun => _marioRun;

  double _cloud1X = 0;
  double get cloud1X => _cloud1X;
  void setCloud1X(double value) {
    _cloud1X = value;
  }

  double _cloud2X = -18.555;
  double get cloud2X => _cloud2X;
  void setCloud2X(double value) {
    _cloud2X = value;
  }

  //marioY For Allianmint X For Super Mario
  double _marioX = -1;
  //For Get marioX
  double get marioX => _marioX;
  // change marioX
  void setMarioX(double value) {
    _marioX = (value * 10000).round() / 10000;
  }

  //marioY For Allianmint Y For Super Mario
  double _marioY = 1.0;
  //For Get marioY
  double get marioY => _marioY;
  // Change MarioY
  void setMarioY(double value) {
    _marioY = value;
  }

  // For The Jumps  < 2
  bool _isJump = false;
  //For Get IsTowJumps
  bool get isJump => _isJump;
  // Change isTowJumps
  void setIsJump(bool value) {
    _isJump = value;
  }

  bool isMarioRight = false;

  void jump() {
    //to check if is mario jump
    setIsJump(true);
    //Time For Jump To Calculate The Time Of Jumping
    double time = 0;
    // to calculate mario hight
    double initialHight = marioY;
    // The Jump's Hight
    double hight = 0;
    Timer.periodic(
      const Duration(milliseconds: 70),
      (timer) {
        //Time For Calculate The Hight
        time += .04;
        // Calculating The Hight Of Jump
        hight = -10 * time * time + 5 * time;

        if (initialHight - hight > 1.0 || initialHight - hight < -1) {
          setMarioRun(Assets.mario);
          setMarioY(1.0);
          setIsJump(false);
          timer.cancel();
          update();
        } else {
          setMarioRun(Assets.marioJump);
          setMarioY(initialHight - hight);
          update();
        }
      },
    );
  }

  Timer? timerMarioRight;
  void startGoRight() {
    timerMarioLeft?.cancel();
    isMarioRight = true;

    timerMarioRight = Timer.periodic(const Duration(milliseconds: 1), (timer) {
      setMarioRun(Assets.marioRun);
      _cloudsLeft();
      pipeX -= .0004;
      update();

      if (marioX < -.4) {
        setMarioX(marioX + Speeds.marioSpeed);

        update();
      } else {
        setMarioX(-.4);
      }
    });
  }

  void _cloudsRhite() {
    if (cloud1X < 18.555) {
      setCloud1X(cloud1X + Speeds.cloudSpeed);
      update();
    } else {
      setCloud1X(-18.555);
    }
    if (cloud2X < 18.555) {
      setCloud2X(cloud2X + Speeds.cloudSpeed);
      update();
    } else {
      setCloud2X(-18.555);
    }
  }

  void stopRightGo() {
    setMarioRun(Assets.mario);
    if (timerMarioRight != null) {
      timerMarioRight!.cancel();
      timerMarioRight = null;
    }
  }

//)

  Timer? timerMarioLeft;
  void startGoLeft() {
    isMarioRight = false;
    timerMarioRight?.cancel();

    timerMarioLeft = Timer.periodic(const Duration(milliseconds: 1), (timer) {
      setMarioRun(Assets.marioRun);
      _cloudsRhite();
      pipeX += .0004;
      if (marioX > -1) {
        if (marioX < -.4) {
          setMarioX(marioX - Speeds.marioSpeed);
        }

        update();
      } else {
        setMarioX(-1);
      }
    });
  }

  void _cloudsLeft() {
    if (cloud1X > -18.555) {
      setCloud1X(cloud1X - Speeds.cloudSpeed);
      update();
    } else {
      setCloud1X(18.555);
    }
    if (cloud2X > -18.555) {
      setCloud2X(cloud2X - Speeds.cloudSpeed);
      update();
    } else {
      setCloud2X(18.555);
    }
  }

  void stopLeftGo() {
    setMarioRun(Assets.mario);
    if (timerMarioLeft != null) {
      timerMarioLeft!.cancel();
      timerMarioLeft = null;
    }
  }
}
