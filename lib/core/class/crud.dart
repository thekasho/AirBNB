import 'dart:convert';
import 'package:airbnb/core/class/request_status.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../functions/functions.dart';

class Crud {
  Future<Either<RequestStatus, Map>> postData(String linkurl, Map data) async {
    try {
      if (await checkNetwork()) {
        var response = await http
            .post(Uri.parse(linkurl), body: data)
            .timeout(const Duration(seconds: 5), onTimeout: () {
          return http.Response('Error', 408);
        });
        // print(response.body);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } else {
          return const Left(RequestStatus.serverFailure);
        }
      } else {
        return const Left(RequestStatus.offlineFailure);
      }
    } catch (e) {
      debugPrint("Crud Error: $e");
      return const Left(RequestStatus.serveException);
    }
  }
}
