import 'package:e_comm/utils/app_constants.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.appMainColor,
        title: Text(AppConstants.appMainName,
        style: TextStyle(color: AppConstants.appStatusBarColor),),
        centerTitle: true,
      ),
    );
  }
}