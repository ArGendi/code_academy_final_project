import 'package:code_academy_auth/controllers/user/user_cubit.dart';
import 'package:code_academy_auth/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var cubit = BlocProvider.of<UserCubit>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: cubit.loginKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value) {
                        cubit.user.email = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter your email';
                        } else if (!value.contains('@') ||
                            !value.contains(".")) {
                          return 'Enter valid email';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      obscureText: true,
                      onSaved: (value) {
                        cubit.user.password = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter your password';
                        } else if (value.length < 8) {
                          return 'Very very weak password';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                      ),
                    ),
                    SizedBox(height: 15,),
                    SizedBox(
                      width: screenSize.width * 0.75,
                      child: ElevatedButton(
                        onPressed: () {
                          cubit.onLogin(context);
                        },
                        child: BlocBuilder<UserCubit, UserState>(
                          builder: (context, state) {
                            if(state is LoadingState){
                              return Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: CircularProgressIndicator(color: Colors.white,),
                              );
                            }
                            else{
                              return Text('Login');
                            }
                          },
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: ((context) => SignupScreen())));
                          }, 
                          child: Text('Register now'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}