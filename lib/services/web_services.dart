import 'package:code_academy_auth/constants.dart';
import 'package:dio/dio.dart';

class WebServices{

  Future<Map<String, dynamic>?> post(String url, Map<String, dynamic> body) async{
    try{
      Dio dio = Dio();
      var response = await dio.post(
        url,
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

  Future<Map<String, dynamic>?> get(String url, [String? token]) async{
    try{
      Dio dio = Dio();
      print(token);
      var response = await dio.get(
        url,
        options: Options(
          headers: token != null ? {
            'Authorization': 'Bearer $token'
          } : null,
        ),
      );
      print("response: ${response.statusCode}");
      if(response.statusCode! >= 200 && response.statusCode! < 300){
          return response.data;
      }
      else{
        return null;
      }
    }
    catch(e){
      print('error heree');
      return null;
    }
  }

}