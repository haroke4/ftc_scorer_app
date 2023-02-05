import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class MainPage extends StatefulWidget {
  String lang;

  MainPage({super.key, required this.lang});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late SharedPreferences sharedPrefs;
  late String lang = widget.lang;


  @override
  void initState() {
    super.initState();
    asyncInit();
  }

  void asyncInit() async {
    sharedPrefs = await SharedPreferences.getInstance();

  }

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
        getButton("Go to main page", () {
          //here Get.to(Next page)
        }),
        const SizedBox(height: 10),
        getButton(
          lang == "kz" ? "Тілді таңдау" : "Выбрать язык",
          () {
            showDialog(
              context: context,

              builder: (BuildContext context) {
                return AlertDialog(

                  backgroundColor: const Color.fromRGBO(0, 0, 0, 0.1),
                  content: getLanguageButtons(),
                );
              },
            );
          },
        )
      ],
    );
  }

  Widget getLanguageButtons() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getButton("Қазақша", () {
          setState(() {
            lang = "kz";
          });
          sharedPrefs.setString("lang", "kz");
          Navigator.pop(context);
        }),
        const SizedBox(height: 10),
        getButton("Русский", () {
          setState(() {
            lang = "ru";
          });
          sharedPrefs.setString("lang", "ru");
          Navigator.pop(context);
        })
      ],
    );
  }

  // prefabs

  Widget getButton(String text, var onPressed) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      label: Text(text),
      backgroundColor: regularRed,
      heroTag: text,
    );
  }
}
