import 'package:bloc/bloc.dart';
import 'package:code_academy_auth/constants.dart';
import 'package:code_academy_auth/local/cache.dart';
import 'package:code_academy_auth/models/resturant.dart';
import 'package:code_academy_auth/services/web_services.dart';
import 'package:meta/meta.dart';

part 'resturants_state.dart';

class ResturantsCubit extends Cubit<ResturantsState> {
  List<Resturant> resturants = [];
  WebServices webServices = WebServices();

  ResturantsCubit() : super(ResturantsInitial());

  void getAllResturnats()async{
    if(resturants.isEmpty){
      emit(LoadingState());
      String? token = Cache.getKey('token');
      Map<String, dynamic>? json = await webServices.get(getAllResturantsUrl, token);
      if(json != null){
        for(var res in json['data']){
          print(res);
          resturants.add(Resturant.fromJson(res));
        }
        emit(SuccessState());
      }
      else{
        emit(FailState());
      }
    }
    
  }
}
