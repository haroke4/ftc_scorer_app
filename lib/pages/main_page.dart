import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGrey,
      body: SafeArea(
        child: Center(child: getMainWidget()),
      ),
    );
  }

  Widget getMainWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getButton("Go to fucking jail", () {}),
        const SizedBox(height: 10),
        getButton("Select language", () {})
      ],
    );
  }

  Widget getButton(var text, var onPressed) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      label: Text(text),
      backgroundColor: regularRed,
    );
  }
}
