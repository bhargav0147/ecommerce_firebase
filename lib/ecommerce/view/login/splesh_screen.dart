import 'dart:async';
import 'package:ecommerce_firebase/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLogin=false;
  @override
  void initState() {
    super.initState();
    isLogin = FirebaseHelper.helper.checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () async {
      Get.toNamed(isLogin==false?'signIn':'home');
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://cdn-icons-png.flaticon.com/512/7152/7152387.png',
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
