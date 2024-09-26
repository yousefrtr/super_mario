import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_mario/constants/assets.dart';
import 'package:super_mario/monsters/goomba/goomba_controller/goomba_controller.dart';

class GoombaScreen extends StatelessWidget {
  const GoombaScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: GoombaController(),
        builder: (controller) {
          return Container(
            alignment: Alignment(controller.goombaX, controller.goombaY),
            child: SizedBox(
              width: 40,
              height: 22,
              child: Image.asset(
                Assets.goomba,
                fit: BoxFit.cover,
              ),
            ),
          );
        });
  }
}
