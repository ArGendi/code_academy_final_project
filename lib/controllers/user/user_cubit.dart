import 'package:bloc/bloc.dart';
import 'package:code_academy_auth/constants.dart';
import 'package:code_academy_auth/local/cache.dart';
import 'package:code_academy_auth/models/user.dart';
import 'package:code_academy_auth/screens/home/home_screen.dart';
import 'package:code_academy_auth/screens/login_screen.dart';
import 'package:code_academy_auth/services/web_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  User user = User();
  GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  WebServices webServices = WebServices();

  UserCubit() : super(UserInitial());

  void onSignup(BuildContext context) async{
    bool valid = registerKey.currentState!.validate();
    if(valid){
      registerKey.currentState!.save();
      emit(LoadingState());
      Map<String, dynamic>? responseJson = await webServices.post(registerUrl ,user.toJsonForRegister());
      if(responseJson != null){
        await saveUserDataInCache('data',responseJson);
        emit(SuccessState());
        Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => HomeScreen())));
      }
      else{
        emit(FailState());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Connection error"), backgroundColor: Colors.red,)
        );
      }
    }
  }

  void onLogin(BuildContext context) async{
     bool valid = loginKey.currentState!.validate();
    if(valid){
      loginKey.currentState!.save();
      emit(LoadingState());
      Map<String, dynamic>? responseJson = await webServices.post(loginUrl,user.toJsonForLogin());
      if(responseJson != null){
        await saveUserDataInCache('user', responseJson);
        emit(SuccessState());
        Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => HomeScreen())));
      }
      else{
        emit(FailState());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Connection error"), backgroundColor: Colors.red,)
        );
      }
    }
  }

  void logout(BuildContext context) async{
    await Cache.removeCache();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
  }

  Future<void> saveUserDataInCache(String key, Map responseJson) async{
    await Cache.saveId(responseJson[key]['id']);
    await Cache.saveKey(nameKey, responseJson[key]['name']);
    await Cache.saveKey(emailKey, responseJson[key]['email']);
    await Cache.saveToken(responseJson['token']);
  }
}
