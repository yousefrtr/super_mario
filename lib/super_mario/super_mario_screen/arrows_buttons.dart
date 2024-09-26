import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_mario/super_mario/super_mario_controller/super_mario_controller.dart';

class ArrowsButtons extends StatelessWidget {
  const ArrowsButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SuperMarioController(),
        builder: (controller) {
          return Container(
            color: Colors.brown,
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                arrowButton(Icons.arrow_back, controller.startGoLeft,
                    controller.stopLeftGo, false, null),
                controller.isJump
                    ? arrowButton(Icons.arrow_upward, null, null, true, null)
                    : arrowButton(
                        Icons.arrow_upward, null, null, true, controller.jump),
                arrowButton(Icons.arrow_forward, controller.startGoRight,
                    controller.stopRightGo, false, null)
              ],
            )),
          );
        });
  }

  Widget arrowButton(IconData icon, dynamic onStart, dynamic onStop, bool isUp,
      dynamic onTap) {
    return GestureDetector(
      onTapDown: isUp ? null : (_) => onStart(),
      onTapUp: isUp ? null : (_) => onStop(),
      onTapCancel: onStop,
      onTap: isUp ? onTap : null,
      child: Container(
        width: 50,
        height: 50,
        color: Colors.grey[300],
        child: Icon(icon),
      ),
    );
  }
}
