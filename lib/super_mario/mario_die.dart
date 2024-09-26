import 'dart:async';

import 'package:get/get.dart';
import 'package:super_mario/home/screens/game_over.dart';
import 'package:super_mario/super_mario/super_mario_controller/super_mario_controller.dart';

class MarioDie {
  final double monsterX;
  final double monsterY;
  final Timer monsterTimer;

  // Contrroler ingection
  SuperMarioController controller = Get.put(SuperMarioController());

  // Constructor
  MarioDie({
    required this.monsterX,
    required this.monsterY,
    required this.monsterTimer,
  });
  Timer? _timerDied;
  void setTimerDied(Timer value) {
    _timerDied = value;
  }

  Timer get timerDied => _timerDied!;

  void checkIfMarioDies() {
    if (monsterY == controller.marioY &&
        (monsterX <= controller.marioX + .05 &&
            monsterX >= controller.marioX - .05)) {
      monsterTimer.cancel();
      controller.timerMarioLeft?.cancel();
      controller.timerMarioRight?.cancel();
      _jump();

      _timerDied = Timer.periodic(
        const Duration(microseconds: 70),
        (timer) {
          if (controller.marioY == 0.9039999999999995) {
            timer.cancel();
            Get.off(() => const GameOver());
          }
        },
      );
    }
  }

  void _jump() {
    //to check if is mario jump
    controller.setIsJump(true);
    //Time For Jump To Calculate The Time Of Jumping
    double time = 0;
    // to calculate mario hight
    double initialHight = controller.marioY;
    // The Jump's Hight
    double hight = 0;
    _timerDied = Timer.periodic(
      const Duration(milliseconds: 70),
      (timer) {
        //Time For Calculate The Hight
        time += .04;
        // Calculating The Hight Of Jump
        hight = -10 * time * time + 5 * time;

        if (initialHight - hight > 1.0 || initialHight - hight < -1) {
          controller.setMarioY(1.0);
          controller.setIsJump(false);
          timer.cancel();
          controller.update();
        } else {
          controller.setMarioY(initialHight - hight);
          controller.update();
        }
      },
    );
  }
}
