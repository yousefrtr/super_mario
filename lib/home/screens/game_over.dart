import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:super_mario/stages/stage_one/stage_one_screen/stage_one_screen.dart';

class GameOver extends StatelessWidget {
  const GameOver({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Game Over!",
                style: TextStyle(color: Colors.red, fontSize: 30),
              ),
              TextButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.grey)),
                  onPressed: () => Get.off(() => const StageOneScreen()),
                  child: const Text("restart")),
            ],
          ),
        ),
      ),
    );
  }
}
