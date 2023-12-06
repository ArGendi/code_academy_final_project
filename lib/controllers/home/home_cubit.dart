import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  int currentPage = 0;

  HomeCubit() : super(HomeInitial());

  void changePage(int index){
    currentPage = index;
    emit(PageChangedState());
  }
}
