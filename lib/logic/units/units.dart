import 'package:airbnb/links.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/class/request_status.dart';
import '../../core/data/remote/requests.dart';
import '../../helpers/helpers.dart';
import '../../repo/local/local.dart';

abstract class UnitsCont extends GetxController {
  checkNetwork();
  getUnits();
  likeUnit(int id);
  filterUnits(int type);
}
class UnitsContImp extends UnitsCont {
  Requests requests = Requests(Get.find());
  RequestStatus requestStatus = RequestStatus.none;
  bool isConnected = false;
  List allUnits = [];
  List fUnits = [];
  List mainUnits = [];
  String username = '';
  int userid = 0;
  int currentPage = 0;
  String typeName = 'all';

  @override
  checkNetwork() async {
    isConnected = await InternetConnectionChecker().hasConnection;
  }

  @override
  getUnits() async {
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

      Map featuredRequest = {
        'type': "featured",
        'user_id': userid.toString(),
      };
      var funits = await requests.postData(featuredRequest, Links.units);

      Map allRequest = {
        'type': "all",
        'user_id': userid.toString(),
      };
      var aunits = await requests.postData(allRequest, Links.units);

      if(aunits['status'] == "success" && aunits['result'].length >= 1){

        fUnits = [];
        fUnits.addAll(funits['result']);

        allUnits = [];
        allUnits.addAll(aunits['result']);
        mainUnits.addAll(aunits['result']);

        requestStatus = RequestStatus.success;
        update();

      }
    } catch (e) {
      print("Error $e");
    }
  }

  @override
  likeUnit(id) async {
    try {
      if(id >= 1){
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

        Map likeRequest = {
          'user_id': userid.toString(),
          'unit_id': id.toString(),
        };
        var likeRes = await requests.postData(likeRequest, Links.likeUnit);
        if(likeRes['status'] == "success"){
          await getUnits();
          requestStatus = RequestStatus.success;
          update();
        }
      }
    } catch (e) {
      print("Error $e");
    }
  }

  @override
  filterUnits(type) {
    try {
      typeName = type == 1 ? 'apartment' : type == 2 ? 'villa' : type == 3 ? 'house' : type == 4 ? 'farmhouse' : '';
      if(mainUnits.isNotEmpty){
        if(typeName != '') {
          allUnits = mainUnits.where((c) => c['type'] == typeName).toList();
        }
        if(typeName == ''){
          allUnits = mainUnits;
        }
        update();
      }
      print(typeName);
    } catch (e) {
      print("Error $e");
    }
  }

  @override
  void onReady() async {
    super.onReady();
    await checkNetwork();
    await getUnits();

    update();
  }

}