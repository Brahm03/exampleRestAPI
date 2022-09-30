import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:materialyou/views/home/views/auth/cubit/auth_cubit.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = context.watch<AuthCubit>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () => context.read<AuthCubit>().signUp(context),),
      appBar: AppBar(
        title: const Text('Sign up'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: data.usernameController,
            ),
            TextFormField(
              controller: data.emailController,
            ),
            TextFormField(
              controller: data.passwordController,
            ),

          ],
        ),
      ),
    );
  }
}
