import 'package:e_comm/utils/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //For Password Visibility
  var isPasswordVisible = false.obs;

  Future<UserCredential?> SignInMethod(
    String userEmail,
    String userPassword,
  ) async {
    try {
      EasyLoading.show(status: 'Please Wait');
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );

      EasyLoading.dismiss();
      return userCredential;
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
