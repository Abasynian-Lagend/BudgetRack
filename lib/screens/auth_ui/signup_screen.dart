import 'package:e_comm/controllers/signUp_controller.dart';
import 'package:e_comm/screens/auth_ui/signin_screen.dart';
import 'package:e_comm/screens/user_panal/main_screen.dart';
import 'package:e_comm/utils/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpController signUpController = Get.put(SignUpController());
  TextEditingController userName = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPhone = TextEditingController();
  TextEditingController userCity = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.appMainColor,
        title: Text('SignUp',
          style: TextStyle(color: AppConstants.appPrimaryTextColor),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              SizedBox(height: Get.height /20),
              Text('Create an Account',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: Get.height / 50),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: userName,
                    cursorColor: AppConstants.appSecondaryColor,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        hintText: 'UserName',
                        prefixIcon: Icon(Icons.person),
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
                  child: TextFormField(
                    controller: userPhone,
                    cursorColor: AppConstants.appSecondaryColor,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        hintText: 'Phone Number',
                        prefixIcon: Icon(Icons.phone_android),
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
                    controller: userCity,
                    cursorColor: AppConstants.appSecondaryColor,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: 'City',
                        prefixIcon: Icon(Icons.location_on_outlined),
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
                  child: Obx(
                      () => TextFormField(
                        controller: userPassword,
                        obscureText: signUpController.isPasswordVisible.value,
                        cursorColor: AppConstants.appSecondaryColor,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.lock_outline),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                signUpController.isPasswordVisible.toggle();
                              },
                                child: signUpController.isPasswordVisible.value
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility)),
                            contentPadding: EdgeInsets.only(top: 4, left: 8),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)
                            )
                        ),
                      ),
                  )
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
                      String name = userName.text.trim();
                      String email = userEmail.text.trim();
                      String phone = userPhone.text.trim();
                      String city = userCity.text.trim();
                      String password = userPassword.text.trim();
                      String userDeviceToken = '';

                      if (name.isEmpty || email.isEmpty || phone.isEmpty || city.isEmpty || password.isEmpty) {
                        Get.snackbar(
                          "Error",
                          'Please Enter all Details',
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: AppConstants.appMainColor,
                          colorText: AppConstants.appPrimaryTextColor,
                        );
                      } else {
                        UserCredential? userCredential = await signUpController.SignUpMethod(
                            name,
                            email,
                            phone,
                            city,
                            password,
                            userDeviceToken
                        );

                        if(userCredential != null){
                          Get.snackbar(
                            "Verification Email Sent",
                            "Please Check Your Email",
                            snackPosition: SnackPosition.TOP,
                            backgroundColor: AppConstants.appMainColor,
                            colorText: AppConstants.appPrimaryTextColor,
                          );

                          FirebaseAuth.instance.signOut();
                          Get.offAll(() => SignInScreen());
                        }
                      }
                    },
                    child: Text("SIGN UP",
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
                  Text("Already have an Account? ",
                    style: TextStyle(
                        color: AppConstants.appPrimaryTextColor
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.offAll(() => SignInScreen()),
                    child: Text("Sign In",
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