import 'package:e_comm/controllers/forgetPasswordController.dart';
import 'package:e_comm/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';


class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final ForgetPasswordController forgetPasswordController = Get.put(ForgetPasswordController());
  TextEditingController userEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.appMainColor,
        title: Text('Login',
          style: TextStyle(color: AppConstants.appPrimaryTextColor),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 25),
              Column(
                children: [
                  Lottie.asset('assets/images/ForgetPasswordScreen.json')
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

              SizedBox(height: Get.height / 20,),
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

                      if(email.isEmpty){
                        Get.snackbar(
                          'Error',
                          'Please Enter All Details',
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: AppConstants.appMainColor,
                          colorText: AppConstants.appPrimaryTextColor,
                        );
                      }else{
                        String email = userEmail.text.trim();
                        forgetPasswordController.ForgetPasswordMethod(email);
                      }
                    },
                    child: Text("Forget Password",
                      style: TextStyle(
                          color: AppConstants.appPrimaryTextColor
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}