import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:materialyou/views/home/views/auth/cubit/auth_cubit.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<AuthCubit>().signIn(context);
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: context.watch<AuthCubit>().emailController,
                onChanged: (v) {
                  debugPrint(context
                      .read<AuthCubit>()
                      .emailController
                      .text
                      .toString());
                },
              ),
              TextFormField(
                controller: context.watch<AuthCubit>().passwordController,
              ),
              SizedBox(height: 20,),
              TextButton.icon(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),onPressed: () => context.read<AuthCubit>().changeState(SignUpState()), icon: Icon(Icons.hail_sharp), label: Text('create account', style: TextStyle(color: Colors.black),))
            ],
          ),
        ),
      ),
    );
  }
}
