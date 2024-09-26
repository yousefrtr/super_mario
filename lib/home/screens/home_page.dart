import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_mario/constants/assets.dart';
import 'package:super_mario/stages/stage_one/stage_one_screen/stage_one_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.backeGround),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Get.off(() => const StageOneScreen());
                  },
                  child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey[400]),
                      child: const Text(
                        "Start Game",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 255, 0, 0)),
                      )),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
