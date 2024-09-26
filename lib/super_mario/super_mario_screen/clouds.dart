import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:super_mario/constants/assets.dart';
import 'package:super_mario/super_mario/super_mario_controller/super_mario_controller.dart';

class Clouds extends StatelessWidget {
  const Clouds({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SuperMarioController(),
        builder: (controller) {
          return Stack(
            children: [
              Align(
                  alignment: Alignment(controller.cloud1X, -.9),
                  child: cloudContainer(context)),
              Align(
                  alignment: Alignment(controller.cloud2X, -.9),
                  child: cloudContainer(context))
            ],
          );
        });
  }

  SizedBox cloudContainer(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 50, child: Image.asset(Assets.cloud1)),
          SizedBox(width: 50, child: Image.asset(Assets.cloud3)),
          SizedBox(width: 120, child: Image.asset(Assets.cloud2)),
          SizedBox(width: 50, child: Image.asset(Assets.cloud1)),
          SizedBox(width: 50, child: Image.asset(Assets.cloud3)),
        ],
      ),
    );
  }
}
