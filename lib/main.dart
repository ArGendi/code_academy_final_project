import 'package:code_academy_auth/controllers/home/home_cubit.dart';
import 'package:code_academy_auth/controllers/user/user_cubit.dart';
import 'package:code_academy_auth/local/cache.dart';
import 'package:code_academy_auth/screens/home/home_screen.dart';
import 'package:code_academy_auth/screens/login_screen.dart';
import 'package:code_academy_auth/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Cache.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> UserCubit()),
        BlocProvider(create: (context)=> HomeCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Cache.getToken() != null ? HomeScreen() : LoginScreen(),
      ),
    );
  }
}
