import 'package:e_comm/screens/auth_ui/signin_screen.dart';
import 'package:e_comm/utils/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> ForgetPasswordMethod(
      String userEmail,
      ) async {
    try {
      EasyLoading.show(status: 'Please Wait');

      await _auth.sendPasswordResetEmail(email: userEmail);
      Get.snackbar(
        'Request Sent Successfully',
        'Password Reset Link sent to $userEmail',
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppConstants.appMainColor,
        colorText: AppConstants.appPrimaryTextColor,
      );
      
      Get.offAll(()=> SignInScreen());

      EasyLoading.dismiss();
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar(
        'Error',
        '$e',
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppConstants.appMainColor,
        colorText: AppConstants.appPrimaryTextColor,
      );
    }
  }
}
