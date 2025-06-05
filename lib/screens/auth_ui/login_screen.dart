import 'package:e_comm/screens/auth_ui/signup_screen.dart';
import 'package:e_comm/screens/user_panal/main_screen.dart';
import 'package:e_comm/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstants.appMainColor,
          title: Text('Login',
          style: TextStyle(color: AppConstants.appStatusBarColor),),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                isKeyboardVisible
                    ? Text('Welcome Back')
                    : Column(
                  children: [
                    Lottie.asset('assets/images/LoginScreen.json')
                  ],
                ),
                SizedBox(height: Get.height / 50),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12),
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        cursorColor: AppConstants.appSecondaryColor,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.email_outlined),
                          contentPadding: EdgeInsets.only(top: 4, left: 8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)
                          )
                        ),
                      ),
                    ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      cursorColor: AppConstants.appSecondaryColor,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.lock_outline),
                          suffixIcon: Icon(Icons.visibility_off),
                          contentPadding: EdgeInsets.only(top: 4, left: 8),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)
                          )
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  alignment: Alignment.centerRight,
                  child: Text('Forget Password?',
                    style: TextStyle(
                      color: AppConstants.appMainColor,
                      fontWeight: FontWeight.bold,
                    ),),
                ),
                SizedBox(height: 20),
                Material(
                  child: Container(
                    width: Get.width / 2,
                    height: Get.height / 18,
                    decoration: BoxDecoration(
                      color: AppConstants.appMainColor,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: TextButton(
                        onPressed: () {
                          Get.offAll(() => MainScreen());
                        },
                        child: Text("SIGN IN",
                          style: TextStyle(
                            color: AppConstants.appStatusBarColor
                          ),
                        ),
                    ),
                  ),
                ),
                SizedBox(height: Get.height / 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an Account? ",
                      style: TextStyle(
                          color: AppConstants.appPrimaryTextColor
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.offAll(() => SignUpScreen()),
                      child: Text("Sign Up",
                        style: TextStyle(
                            color: AppConstants.appSecondaryColor,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}