import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:materialyou/views/home/views/auth/cubit/auth_cubit.dart';
import 'package:materialyou/views/home/views/auth/view/signin/signin_view.dart';
import 'package:materialyou/views/home/views/auth/view/signup/sign_view.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthCubit(),
        child: BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
          if (state is SignInState) {
            return const SignInView();
          } else if (state is SignUpState) {
            return const SignUpView(
              
            );
          }
          return Container(
            color: Colors.amber,
          );
        }));
  }
}
