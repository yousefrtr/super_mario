import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';
import 'package:super_mario/super_mario/mario_die.dart';

class GoombaController extends GetxController {
  // for goomba monester x align
  double _goombaX = -.3;
  double get goombaX => _goombaX;
  void setGoombaX(double value) {
    _goombaX = (value * 10000).round() / 10000;
  }

  // for goomba monester y align
  double _goombaY = 1.01;
  double get goombaY => _goombaY;
  void setGoombaY(double value) {
    _goombaY = value;
  }

  Timer? timerGommba;

  @override
  void onInit() {
    gombaTransport(true);
    super.onInit();
  }

  @override
  void onClose() {
    timerGommba?.cancel();
    super.onClose();
  }

  void gombaTransport(bool isLeft) {
    timerGommba = Timer.periodic(const Duration(milliseconds: 1), (timer) {
      setGoombaX(isLeft ? goombaX - .0008 : goombaX + .0008);

      update();

      MarioDie(monsterTimer: timerGommba!, monsterX: goombaX, monsterY: goombaY)
          .checkIfMarioDies();
      if (goombaX >= 1.2) {
        timer.cancel();

        Future.delayed(Duration(seconds: Random().nextInt(10) + 1), () {
          gombaTransport(true);
        });
      } else if (goombaX <= -1.2) {
        timer.cancel();

        Future.delayed(Duration(seconds: Random().nextInt(10) + 1), () {
          gombaTransport(false);
        });
      }
    });
  }
}
