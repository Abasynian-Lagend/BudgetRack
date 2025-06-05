import 'dart:async';
import 'package:e_comm/screens/auth_ui/welcome_screen.dart';
import 'package:e_comm/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Get.offAll(() => WelcomeScreen());
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.appSecondaryColor,
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: Get.width,
                alignment: Alignment.center,
                height: 300,
                child: Image.asset("assets/images/BudgetRackSplashLogo.png",
                  height: 200,
                  width: 200,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40.0),
              width: Get.width,
              alignment: Alignment.center,
              child: Text(
                AppConstants.appPoweredBy,
                style: TextStyle(
                    color: AppConstants.appSecondaryTextColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}