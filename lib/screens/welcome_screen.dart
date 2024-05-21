import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../misc/colors.dart';
import 'signin_screen.dart';
import '../widgets/app_large_text.dart';
import '../widgets/app_text.dart';
import '../widgets/respensive_botton.dart';

class WelcomePge extends StatefulWidget {
  const WelcomePge({Key? key});

  @override
  State<WelcomePge> createState() => _WelcomePgeState();
}

class _WelcomePgeState extends State<WelcomePge> {
  List images = ["file8.jpg", "file11.jpg", "file12.jpg"];
  List appLargeText = [
    "Unlock Creativity",
    "Ignite Innovation",
    "Empower Ideas"
  ];
  int currentIndex = 0;
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        controller: _controller,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (_, index) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("img/" + images[index]),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 150, right: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppLargText(
                    text: appLargeText[index],
                    color: Colors.blueGrey.shade400,
                  ),
                  AppText(
                    text: "With AI",
                    color: Colors.white,
                    size: 30,
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: SlideAction(
                      borderRadius: 12,
                      elevation: 0,
                      innerColor: Colors.deepPurple,
                      outerColor: Colors.deepPurple[200],
                      sliderButtonIcon: Icon(
                        Icons.lock_open,
                        color: Colors.white,
                      ),
                      text: 'Slide to Start',
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Anta'),
                      onSubmit: () {
                        Get.to(() => const SignInScreen(),
                            transition: Transition.fade,
                            duration: Duration(milliseconds: 1300));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: images.length,
                      effect: ExpandingDotsEffect(
                        activeDotColor: Colors.deepPurple,
                        dotColor: Colors.deepPurple.shade100,
                        dotHeight: 15,
                        dotWidth: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
