import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:the_cat_app_test/data/constants/constants.dart';
import 'package:the_cat_app_test/domain/models/breed_model.dart';

Dio dio = Dio();

abstract class CatsServicesAbs {
  Future<dynamic> getBaseInfo();
}

class CatService extends CatsServicesAbs {
  @override
  Future<dynamic> getBaseInfo() async {
    try {
      Response response = await dio.get(
        Constants.url_base_cats,
      );
      List<dynamic> responseList = response.data;
      return responseList;
    } on DioException catch (error) {
      if (error.response != null) {
        log('Error on getBaseInfo: ${error.response?.statusCode}');
      } else if (error.type == DioExceptionType.connectionError) {
        throw Future.error("Error with conection: ${error.message}");
      } else {
        log('Error on getBaseInfo: ${error.message}');
      }
      throw Future.error(error.response?.data["message"]);
    } on Exception catch (error) {
      log("Error in getBaseInfo:$error");
      throw Future.error(error);
    }
  }
}
