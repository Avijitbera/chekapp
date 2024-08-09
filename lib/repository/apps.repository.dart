

import 'package:checkapp/model/AppDetails.dart';
import 'package:checkapp/model/StoreApplication.dart';
import 'package:checkapp/service/jsonToModel.dart';
import 'package:checkapp/utils/failed.dart';
import 'package:checkapp/utils/urls.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

class AppsRepository {

  Dio dio;

  AppsRepository(this.dio);

  Future<Either<Failed, AppDetails>> getAppDetails(String url)async{
    try {
      var result = await dio.post(app_details, data: {
        "url":url
      });
      if(result.data['success'] == true){
        var data = JsonToModel.intense.jsonToAppDetails(result.data['data']);
        return Either.right(data);
      }else{
        return Either.left(Failed(result.data['message'], fromServer: true));
      }
    } catch (e) {
       return Either.left(Failed("please check your internet connection"));
    }
  }

  Future<Either<Failed, List<StoreApplication>>> getTopPaid()async{
    try {
      var result = await dio.get(top_paid);
      if(result.data['success'] == true){
        var data = JsonToModel.intense.jsonToStoreApplication(result.data['topPaid']);
        return Either.right(data);
      }else{
        return Either.left(Failed(result.data['message'], fromServer: true));
      }
     
    } catch (e) {
      return Either.left(Failed("please check your internet connection"));
    }
  }

  Future<Either<Failed, List<StoreApplication>>> getTopFree()async{
    try {
      var result = await dio.get(top_free);
      if(result.data['success'] == true){
        var data = JsonToModel.intense.jsonToStoreApplication(result.data['topFree']);
        return Either.right(data);
      }else{
        return Either.left(Failed(result.data['message'], fromServer: true));
      }
     
    } catch (e) {
      return Either.left(Failed("please check your internet connection"));
    }
  }
  

  Future<Either<Failed, List<StoreApplication>>> getGrossing()async{
    try {
      var result = await dio.get(grossing);
      if(result.data['success'] == true){
        var data = JsonToModel.intense.jsonToStoreApplication(result.data['grossing']);
        return Either.right(data);
      }else{
        return Either.left(Failed(result.data['message'], fromServer: true));
      }
     
    } catch (e) {
      return Either.left(Failed("please check your internet connection"));
    }
  }

}