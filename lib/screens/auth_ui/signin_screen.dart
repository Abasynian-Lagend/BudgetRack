import 'package:e_comm/controllers/userDataController.dart';
import 'package:e_comm/screens/admin_panal/adminMainScreen.dart';
import 'package:e_comm/screens/auth_ui/forget_password_screen.dart';
import 'package:e_comm/screens/auth_ui/signup_screen.dart';
import 'package:e_comm/screens/user_panal/main_screen.dart';
import 'package:e_comm/utils/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/signIn_controller.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SignInController signInController = Get.put(SignInController());
  final UserDataController userDataController = Get.put(UserDataController());
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.appMainColor,
        title: Text('Welcome Back',
        style: TextStyle(color: AppConstants.appPrimaryTextColor),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Column(
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
                      controller: userEmail,
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
                  child: Obx(()=> TextFormField(
                    controller: userPassword,
                    obscureText: signInController.isPasswordVisible.value,
                    cursorColor: AppConstants.appSecondaryColor,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock_outline),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            signInController.isPasswordVisible.toggle();
                          },
                            child: signInController.isPasswordVisible.value
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility)
                        ),
                        contentPadding: EdgeInsets.only(top: 4, left: 8),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)
                        )
                    ),
                  ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => ForgetPasswordScreen());
                  },
                  child: Text('Forget Password?',
                    style: TextStyle(
                      color: AppConstants.appMainColor,
                      fontWeight: FontWeight.bold,
                    ),),
                ),
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
                      onPressed: () async {
                        String email = userEmail.text.trim();
                        String password = userPassword.text.trim();

                        if(email.isEmpty || password.isEmpty){
                          Get.snackbar(
                            'Error',
                            'Please Enter All Details',
                            snackPosition: SnackPosition.TOP,
                            backgroundColor: AppConstants.appMainColor,
                            colorText: AppConstants.appPrimaryTextColor,
                          );
                        }else{
                          UserCredential? userCredential = await signInController
                              .SignInMethod(email, password);
                          var userData = await userDataController.getUserData(userCredential!.user!.uid);

                          if (userCredential != null){
                            if (userCredential.user!.emailVerified) {

                              if(userData[0]["isAdmin"] == true){
                                Get.snackbar(
                                  "Success Admin Login",
                                  "Logged in Successfully! ",
                                  snackPosition: SnackPosition.TOP,
                                  backgroundColor: AppConstants.appMainColor,
                                  colorText: AppConstants.appPrimaryTextColor,);
                                Get.offAll(() => AdminMainScreen() );
                              } else{
                                Get.snackbar(
                                  "Success User Login",
                                  "Logged in Successfully! ",
                                  snackPosition: SnackPosition.TOP,
                                  backgroundColor: AppConstants.appMainColor,
                                  colorText: AppConstants.appPrimaryTextColor,);
                                Get.offAll(()=> MainScreen());
                              }
                            } else {
                              Get.snackbar(
                                  "Error",
                                  "Please Verify Email First",
                                snackPosition: SnackPosition.TOP,
                                backgroundColor: AppConstants.appMainColor,
                                colorText: AppConstants.appPrimaryTextColor,);
                            }
                          }else{
                            Get.snackbar(
                              "Error",
                              "Please Try Again",
                              snackPosition: SnackPosition.TOP,
                              backgroundColor: AppConstants.appMainColor,
                              colorText: AppConstants.appPrimaryTextColor,);
                          }
                        }
                      },
                      child: Text("SIGN IN",
                        style: TextStyle(
                          color: AppConstants.appPrimaryTextColor
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
                        color: AppConstants.appSecondaryTextColor
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
  }
}