import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:super_mario/constants/assets.dart';

import 'package:super_mario/monsters/goomba/goomba_sreen/goomba_screen.dart';
import 'package:super_mario/super_mario/super_mario_controller/super_mario_controller.dart';
import 'package:super_mario/super_mario/super_mario_screen/arrows_buttons.dart';
import 'package:super_mario/super_mario/super_mario_screen/clouds.dart';
import 'package:super_mario/super_mario/super_mario_screen/super_mario_screen.dart';

class StageOneScreen extends StatelessWidget {
  const StageOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                flex: 4,
                child: Stack(
                  children: [
                    Container(
                      color: Colors.blue,
                    ),
                    const SuperMarioScreen(),
                    const GoombaScreen(),
                    const Clouds(),
                    GetBuilder(
                        init: SuperMarioController(),
                        builder: (controller) {
                          return Container(
                            alignment: Alignment(controller.pipeX, 1),
                            child: SizedBox(
                              width: 100,
                              height: 90,
                              child: Image.asset(
                                Assets.greenPipe,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        })
                  ],
                )),
            const Expanded(flex: 1, child: ArrowsButtons())
          ],
        ),
      ),
    );
  }
}
