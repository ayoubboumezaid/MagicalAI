import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:magicalia/screens/ChooseOption_screen.dart';
import 'package:magicalia/screens/home_screen.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];
  @override
  void initState() {
    super.initState();
    _pages = [
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: '',
            baseStyle: TextStyle(),
            selectedStyle: TextStyle(),
          ),
          ChooseOptionScreen()),
           ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: 'Image Generator',
            baseStyle:const TextStyle(fontFamily: 'Anta',),
            selectedStyle:const TextStyle(fontFamily: 'Anta',color: Colors.black),
          ),
          Home()),
    ];
  }

  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Colors.deepPurple.shade400,
      screens: _pages,
      initPositionSelected: 0,
      backgroundColorAppBar: Color.fromARGB(255, 51, 255, 153),
      backgroundColorContent: Colors.black,
    );
  }
}
