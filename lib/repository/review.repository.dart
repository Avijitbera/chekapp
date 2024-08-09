
import 'package:checkapp/utils/urls.dart';
import 'package:dio/dio.dart';

class ReviewRepository {
  Dio dio;

  ReviewRepository(this.dio);

    Future addTag({
    required String token,
    String? message,
    double rating = 0.0,
    required String appId
  })async{

    List<List<dynamic>> list = [];
    var data = list.firstWhere((element) => element[0] == 1);
    
    try {
    var result = await dio.post(create_review,
      data: {
        "message":message,
        "appId":appId,
        "rating":rating,
        "type":""
      },
      options: Options(
        headers: {
          "authorization":token
        }
      ));
      if(result.data['success'] == true){

      }else{
        
      }
    } catch (e) {
      
    }
  }

  Future addReview({
    required String token,
    String? message,
    double rating = 0.0,
    required String appId
  })async{
    try {
    var result = await dio.post(create_review,
      data: {
        "message":message,
        "appId":appId,
        "rating":rating,
        "type":""
      },
      options: Options(
        headers: {
          "authorization":token
        }
      ));
      if(result.data['success'] == true){

      }else{

      }
    } catch (e) {
      
    }
  }
}
