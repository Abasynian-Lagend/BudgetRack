import 'package:e_comm/utils/app_constants.dart';
import 'package:e_comm/widgets/customDrawarWidget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppConstants.appPrimaryTextColor),
        backgroundColor: AppConstants.appMainColor,
        title: Text(AppConstants.appMainName,
        style: TextStyle(color: AppConstants.appPrimaryTextColor),),
        centerTitle: true,
      ),
      drawer: DrawerWidget(),
    );
  }
}