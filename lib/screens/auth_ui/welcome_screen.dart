import 'package:e_comm/controllers/googleSignIn_controller.dart';
import 'package:e_comm/screens/auth_ui/signin_screen.dart';
import 'package:e_comm/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final GoogleSignInController _googleSignInController = Get.put(GoogleSignInController());

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      foregroundColor: AppConstants.appMainColor,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      minimumSize: const Size.fromHeight(50), // Consistent height
    );

    return Scaffold(
      backgroundColor: AppConstants.appMainColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Lottie.asset('assets/images/WelcomeScreen.json'),
          Container(
            margin: const EdgeInsets.only(top: 150),
            child: Text(
              'Happy Shopping',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppConstants.appPrimaryTextColor,
              ),
            ),
          ),
          SizedBox(height: Get.height / 6),

          // Google Sign-In Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SizedBox(
              width: Get.width,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.g_mobiledata_outlined, size: 24),
                onPressed: () {
                  _googleSignInController.signInWithGoogle();
                },
                label: const Text('Sign-In with Google'),
                style: buttonStyle,
              ),
            ),
          ),

          SizedBox(height: Get.height / 30),

          // Email Sign-In Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SizedBox(
              width: Get.width,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.email_outlined, size: 24),
                onPressed: () {
                  Get.to(() => SignInScreen());
                },
                label: const Text('Sign-In with Email'),
                style: buttonStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
