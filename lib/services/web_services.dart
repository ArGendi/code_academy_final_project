import 'package:code_academy_auth/constants.dart';
import 'package:dio/dio.dart';

class WebServices{

  Future<String?> register(Map<String, dynamic> body) async{
    try{
      Dio dio = Dio();
      var response = await dio.post(
        registerUrl,
        data: body,
      );
      if(response.statusCode! >= 200 && response.statusCode! < 300){
          return response.data['token'];
      }
      else{
        return null;
      }
    }
    catch(e){
      return null;
    }
  }

  Future<Map<String, dynamic>?> login(Map<String, dynamic> body) async{
    try{
      Dio dio = Dio();
      var response = await dio.post(
        loginUrl,
        data: body,
      );
      if(response.statusCode! >= 200 && response.statusCode! < 300){
          return response.data;
      }
      else{
        return null;
      }
    }
    catch(e){
      return null;
    }
  }
}