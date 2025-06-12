import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm/controllers/deviceTokenController.dart';
import 'package:e_comm/models/user_models.dart';
import 'package:e_comm/utils/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //For Password Visibility
  var isPasswordVisible = false.obs;

  Future<UserCredential?> SignUpMethod (
      String userName,
      String userEmail,
      String userPhone,
      String userCity,
      String userPassword,
      String userDeviceToken,
      ) async {
    final DeviceTokenController deviceTokenController = Get.put(DeviceTokenController());
    try{
      EasyLoading.show(status: 'Please Wait');
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: userEmail,
          password: userPassword,
      );

      await userCredential.user!.sendEmailVerification();

      UserModel userModel = UserModel(
          uId: userCredential.user!.uid,
          username: userName,
          email: userEmail,
          phone: userPhone,
          userImg: '',
          userDeviceToken: deviceTokenController.deviceToken.toString(),
          country: '',
          userAddress: '',
          street: '',
          city: userCity,
          isAdmin: false,
          isActive: true,
          createdOn: DateTime.now(),
      );

      _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(userModel.toMap());
      EasyLoading.dismiss();
      return userCredential;

    } on FirebaseAuthException catch (e){
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