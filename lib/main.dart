import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ftc_scorer_app/pages/main_page.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'FTC Scorer app by Bolt.m3',
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    asyncInitState();
  }

  void asyncInitState() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(milliseconds: 200));
    String lang = prefs.getString("lang") ?? "kz";
    Get.off(MainPage(lang: lang));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGrey,
      body: Center(
        child: Image.asset("assets/logo.png"),
      ),
    );
  }
}
