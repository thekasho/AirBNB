import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../core/class/request_status.dart';
import '../../core/data/remote/requests.dart';
import '../../helpers/helpers.dart';
import '../../repo/local/local.dart';

abstract class ProfileCont extends GetxController {
  checkNetwork();
  checkAuth();
}
class ProfileContImp extends ProfileCont {
  Requests requests = Requests(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController mobile;
  RequestStatus requestStatus = RequestStatus.none;
  bool isConnected = false;
  String defaultName = "";
  String defaultMail = "";

  @override
  checkNetwork() async {
    isConnected = await InternetConnectionChecker().hasConnection;
  }

  @override
  checkAuth() async {
    requestStatus = RequestStatus.loading;
    update();
    var loginData  = await LocaleApi.getLoginData();
    if(loginData != null){
      username.value = TextEditingValue(text: loginData['username']);
      email.value = TextEditingValue(text: loginData['email']);
      mobile.value = TextEditingValue(text: loginData['mobile']);
      requestStatus = RequestStatus.success;
      update();
    } else {
      requestStatus = RequestStatus.success;
      update();
    }
  }

  @override
  void onInit() {
    checkNetwork();
    checkAuth();
    username = TextEditingController(text: defaultName);
    email = TextEditingController();
    mobile = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    mobile.dispose();
    super.dispose();
  }

}