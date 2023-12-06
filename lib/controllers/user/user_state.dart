part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}
class LoadingState extends UserState {}
class SuccessState extends UserState {}
class FailState extends UserState {}


