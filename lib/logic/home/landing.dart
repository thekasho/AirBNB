import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../core/class/request_status.dart';
import '../../core/data/remote/requests.dart';
import '../../helpers/helpers.dart';
import '../../repo/local/local.dart';

abstract class LandingController extends GetxController {
  checkNetwork();
  checkAuth();
}

class LandingControllerImp extends LandingController {
  Requests requests = Requests(Get.find());
  RequestStatus requestStatus = RequestStatus.loading;
  bool isConnected = false;

  @override
  checkNetwork() async {
    isConnected = await InternetConnectionChecker().hasConnection;
  }

  @override
  checkAuth() async {
    var loginData  = await LocaleApi.getLoginData();
    if(loginData != null){
      Get.offAllNamed(screenMainHome);
    } else {
      requestStatus = RequestStatus.success;
      update();
    }
  }

  @override
  void onInit() {
    requestStatus = RequestStatus.loading;
    checkNetwork();
    checkAuth();
    super.onInit();
  }
}