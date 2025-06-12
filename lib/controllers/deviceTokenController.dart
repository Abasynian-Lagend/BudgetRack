import 'package:e_comm/utils/app_constants.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class DeviceTokenController extends GetxController{
  String? deviceToken;

  @override
  void onInit() {
    super.onInit();
    getDeviceToken();
  }

  Future<void> getDeviceToken() async{
    try{
      String? token = await FirebaseMessaging.instance.getToken();

      if (token != null){
        deviceToken = token;
        update();
      }
    } catch(e) {
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