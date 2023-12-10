part of 'resturants_cubit.dart';

@immutable
abstract class ResturantsState {}

class ResturantsInitial extends ResturantsState {}
class LoadingState extends ResturantsState {}
class SuccessState extends ResturantsState {}
class FailState extends ResturantsState {}
