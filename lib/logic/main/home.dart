import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../core/class/request_status.dart';
import '../../core/data/remote/requests.dart';
import '../../helpers/helpers.dart';
import '../../repo/local/local.dart';
import '../../ui/screens/screens.dart';

abstract class MainHomeCont extends GetxController {
  checkNetwork();
  checkAuth();
  changePage(int i);
  logOut();
}
class MainHomeContImp extends MainHomeCont {
  Requests requests = Requests(Get.find());
  RequestStatus requestStatus = RequestStatus.none;
  bool isConnected = false;
  String username = '';
  String avatar = 'https://mustafamahmoud.site/bnb/images/avatar.png';
  int currentPage = 0;

  List<Widget> pagesList = [
    const MainHomePage(),
    const Column(mainAxisAlignment: MainAxisAlignment.center, children: [Center(child: Text("Nearby"),)],),
    const Column(mainAxisAlignment: MainAxisAlignment.center, children: [Center(child: Text("Favourite"),)],),
    const AccountPage(),
  ];

  List pagesTitles = [
    "Home",
    "Nearby",
    "Favourite",
    "Account",
  ];

  List<IconData> pageIcons = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.map,
    FontAwesomeIcons.heart,
    FontAwesomeIcons.user,
  ];

  @override
  checkNetwork() async {
    isConnected = await InternetConnectionChecker().hasConnection;
  }

  @override
  changePage(int i) {
    currentPage = i;
    update();
  }

  @override
  checkAuth() async {
    var loginData  = await LocaleApi.getLoginData();
    if(loginData != null){
      username = loginData['username'];
      update();
      if(loginData['avatar'] != null){
        avatar = loginData['avatar'];
        update();
      }
    } else {
      Get.offAllNamed(screenHome);
    }
  }

  @override
  logOut() async {
    try {
      var loginData  = await LocaleApi.getLoginData();
      if(loginData != null){
        await LocaleApi.removeLoginData();
        Get.offAllNamed(screenHome);
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  void onInit() {
    requestStatus = RequestStatus.none;
    checkNetwork();
    checkAuth();
    super.onInit();
  }

}