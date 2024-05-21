// ignore_for_file: unused_import, use_super_parameters, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:magicalia/screens/chat_screen.dart';
import 'home_screen.dart';
import '../utils/color_utils.dart';
import '../widgets/app_large_text.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChooseOptionScreen extends StatefulWidget {
  const ChooseOptionScreen({Key? key}) : super(key: key);

  @override
  State<ChooseOptionScreen> createState() => _ChooseOptionScreenState();
}

class _ChooseOptionScreenState extends State<ChooseOptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("33FF99"),
              hexStringToColor("7A00F2"),
              hexStringToColor("5050"),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 120),
            AppLargText(
              text: "Magical AI",
              color: Colors.black,
              size: 40,
            ),
            SizedBox(height: 180),
            GridView.count(
              padding: EdgeInsets.all(10),
              crossAxisCount: 2,
              shrinkWrap: true,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => const ChatScreen(),
                        transition: Transition.fade,
                        duration: Duration(milliseconds: 900));
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 40, 54, 61)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            height: 80,
                            width: 80,
                            child: Image.asset(
                              "assets/imageia2.png",
                              width: 150,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Chat with AI",
                            style: TextStyle(fontSize: 18, fontFamily: "Anta"),
                          )
                        ],
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const Home(),
                        transition: Transition.fade,
                        duration: Duration(milliseconds: 800));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 40, 54, 61)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 35,
                        ),
                        Image.asset(
                          "assets/imageia.png",
                          width: 100,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "AI Image Generator",
                          style: TextStyle(fontSize: 18, fontFamily: "Anta"),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
