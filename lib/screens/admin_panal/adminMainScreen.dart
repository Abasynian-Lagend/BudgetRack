import 'package:e_comm/screens/auth_ui/welcome_screen.dart';
import 'package:e_comm/utils/app_constants.dart';
import 'package:e_comm/widgets/customDrawarWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AdminMainScreen extends StatefulWidget{
  const AdminMainScreen({super.key});
  
  @override
  State<AdminMainScreen> createState() => _AdminMainScreenState(); 
}

class _AdminMainScreenState extends State<AdminMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppConstants.appPrimaryTextColor),
        backgroundColor: AppConstants.appMainColor,
        title: Text('Admin Panal',
          style: TextStyle(color: AppConstants.appPrimaryTextColor),),
        centerTitle: true,
      ),
      drawer: DrawerWidget(),
    );
  }
}