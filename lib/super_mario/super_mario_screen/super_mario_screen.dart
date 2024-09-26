import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:super_mario/super_mario/super_mario_controller/super_mario_controller.dart';

class SuperMarioScreen extends StatelessWidget {
  const SuperMarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SuperMarioController(),
        builder: (controller) {
          return Container(
            alignment: Alignment(controller.marioX, controller.marioY),
            child: mario(controller.isMarioRight, controller.marioRun),
          );
        });
  }

  Widget mario(bool isRight, String image) {
    return Transform(
      alignment: Alignment.center,
      transform: isRight ? Matrix4.rotationY(pi) : Matrix4.rotationY(0),
      child: SizedBox(
        width: 50,
        height: 45,
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
