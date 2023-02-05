import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ftc_scorer_app/pages/main_page.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'colors.dart';

late String lang;
late SharedPreferences prefs;

Future<void> main() async {
  prefs = await SharedPreferences.getInstance();
  lang = prefs.getString("lang") ?? "kz";
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'FTC Scorer app by Bolt.m3',
            home: SafeArea(
              child: AnimatedSplashScreen(
                duration: 250,
                splash: Hero(
                    tag: "logo",
                    child: Image.asset("assets/logo.png")
                ),
                nextScreen: MainPage(lang: lang),
                splashTransition: SplashTransition.fadeTransition,
                pageTransitionType: PageTransitionType.fade,
                backgroundColor: darkGrey,
              ),
            )
        );
      },
    );
  }
}