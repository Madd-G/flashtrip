import 'dart:io' show Platform;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/destination_hotel_model.dart';
import '../models/destination_model.dart';

class ApiService {
  late SharedPreferences loginData;
  Dio dio = Dio();


  // final String _baseUrl = 'http://127.0.0.1:8000/';
  final String _baseUrl = 'http://10.0.2.2:8000/';

  // ApiService() {
  //   dio.interceptors.add(
  //     InterceptorsWrapper(
  //       onRequest: (options, handler) {
  //         return handler.next(options);
  //       },
  //       onResponse: (response, handler) {
  //         return handler.next(response);
  //       },
  //       onError: (DioError e, handler) {
  //         if (kDebugMode) {
  //           print('error interceptor');
  //         }
  //         if (e.response!.statusCode == 401) {
  //           if (kDebugMode) {
  //             print('error 401');
  //             print(e.message);
  //           }
  //         } else if (e.response!.statusCode == 500) {
  //           getAllDestination();
  //           if (kDebugMode) {
  //             print('error 500 ya');
  //             print(e.message);
  //           }
  //         } else {
  //           if (kDebugMode) {
  //             print(e.response);
  //           }
  //         }
  //         return handler.next(e);
  //       },
  //     ),
  //   );
  // }

  Future<DestinationModel> getAllDestination() async {
    final response = await dio.get(
      '${_baseUrl}get-destination',
    );

    if (response.statusCode == 200) {
      // if (kDebugMode) {
      //   print(" =============== fetch Product ===============");
      //   print(response.data);
      // }
      return DestinationModel.fromJson(response.data);
    } else if (response.statusCode == 500) {
      // if (kDebugMode) {
      //   print(" ==== Rerun fetchProducts =======");
      // }
      return getAllDestination();
    } else {
      // if (kDebugMode) {
      //   print(" ================ Throw Error ==============");
      // }
      throw response;
    }
    // try {
    //   final response = await dio.get(
    //     '${_baseUrl}get-destination',
    //   );
    //   if (response.statusCode == 500) {
    //     getAllDestination();
    //   }
    //   if (kDebugMode) {
    //     print('response.data ${response.data}');
    //   }
    //   return DestinationModel.fromJson(response.data);
    // }
    // on DioError catch (_) {
    //   rethrow;
    // }
  }

  Future<DestinationHotelModel> getDestinationHotel() async {
    final response = await dio.get(
      '${_baseUrl}get-destination-hotel',
    );

    if (response.statusCode == 200) {
      // if (kDebugMode) {
      //   print(" =============== fetch Product ===============");
      //   print(response.data);
      // }
      return DestinationHotelModel.fromJson(response.data);
    } else if (response.statusCode == 500) {
      // if (kDebugMode) {
      //   print(" ==== Rerun fetchProducts =======");
      // }
      return getDestinationHotel();
    } else {
      // if (kDebugMode) {
      //   print(" ================ Throw Error ==============");
      // }
      throw response;
    }
  }
}
