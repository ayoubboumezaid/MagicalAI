import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class tryscreen extends StatefulWidget {
  const tryscreen({super.key});

  @override
  State<tryscreen> createState() => _tryscreenState();
}

class _tryscreenState extends State<tryscreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Center(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: SlideAction(
                              borderRadius: 12,
                              elevation: 0,
                              innerColor: Colors.deepPurple,
                              outerColor: Colors.deepPurple[200],
                              sliderButtonIcon: const Icon(
                                Icons.lock_open,
                                color: Colors.white,
                              ),
                              text: 'Slide to Start',
                              textStyle: const TextStyle(
                                color: Colors.white,fontSize: 24
                              ),
                              sliderRotate: false,
                              onSubmit: (){},
                            ),
                          ),
                        ),
    );
  }
}