import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/class/request_status.dart';
import '../../core/data/remote/requests.dart';
import '../../helpers/helpers.dart';
import '../../links.dart';
import '../../repo/local/local.dart';

abstract class CarCont extends GetxController {
  checkNetwork();
  getCars();
  reserve(int id);
}
class CarContImp extends CarCont {
  Requests requests = Requests(Get.find());
  RequestStatus requestStatus = RequestStatus.none;
  bool isConnected = false;
  List allCars = [];
  int userid = 0;

  @override
  checkNetwork() async {
    isConnected = await InternetConnectionChecker().hasConnection;
  }

  @override
  getCars() async {
    try {
      requestStatus = RequestStatus.loading;
      update();

      if(!isConnected){
        Get.defaultDialog(
          backgroundColor: white,
          title: "Error",
          titlePadding: EdgeInsets.only(bottom: 2.h, top: 1.h),
          titleStyle: TextStyle(
              fontSize: 18.sp,
              fontFamily: "Cairo",
              color: red,
              fontWeight: FontWeight.bold
          ),
          content: Text(
            "No Internet Connection !!",
            style: TextStyle(
              fontSize: 18.sp,
              fontFamily: "Cairo",
            ),
          ),
        );
        requestStatus = RequestStatus.failure;
        update();
        return;
      }

      var loginData  = await LocaleApi.getLoginData();
      if(loginData != null){
        userid = loginData['id'];
      }

      Map allRequest = {
        'type': "all",
        'user_id': userid.toString(),
      };
      var acars = await requests.postData(allRequest, Links.cars);

      if(acars['status'] == "success" && acars['result'].length >= 1){
        allCars = [];
        allCars.addAll(acars['result']);
        requestStatus = RequestStatus.success;
        update();
      }
    } catch (e) {
      print("Error $e");
    }
  }

  @override
  reserve(id) async {
    try {
      if(id >= 1){
        if(!isConnected){
          Get.defaultDialog(
            backgroundColor: white,
            title: "Error",
            titlePadding: EdgeInsets.only(bottom: 2.h, top: 1.h),
            titleStyle: TextStyle(
              fontSize: 18.sp,
              fontFamily: "Cairo",
              color: red,
              fontWeight: FontWeight.bold,
            ),
            content: Text(
              "No Internet Connection !!",
              style: TextStyle(
                fontSize: 18.sp,
                fontFamily: "Cairo",
              ),
            ),
          );
          requestStatus = RequestStatus.failure;
          update();
          return;
        }
        Get.defaultDialog(
          backgroundColor: white,
          title: "Success",
          titlePadding: EdgeInsets.only(bottom: 2.h, top: 1.h),
          titleStyle: TextStyle(
            fontSize: 18.sp,
            fontFamily: "Cairo",
            color: green,
            fontWeight: FontWeight.bold,
          ),
          content: Text(
            "Reservation Success..",
            style: TextStyle(
              fontSize: 18.sp,
              fontFamily: "Cairo",
            ),
          ),
        );
      }
    } catch (e) {
      print("$e");
    }
  }

  @override
  void onReady() async {
    super.onReady();
    await checkNetwork();
    await getCars();
    update();
  }

}