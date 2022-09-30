import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:materialyou/core/constants/apiBase.dart';
import 'package:materialyou/services/strogeservice.dart';
import 'package:materialyou/services/tokenservice.dart';
import 'package:materialyou/views/home/views/home/view/HomeView.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(SignInState());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  changeState(AuthState newstate) {
    emit(newstate);
  }

  Future signUp(context) async {
    try {
      Response res = await Dio().post(ApiBase.instance.createAccount, data: {
        "username": usernameController.text,
        "email": emailController.text,
        "password": passwordController.text
      });

      if (res.statusCode == HttpStatus.ok) {
        debugPrint(res.data.toString());
        TokenService.instance.isExpered = JwtDecoder.isExpired(res.data['jwt']);
        TokenService.instance.expirationDate =
            JwtDecoder.getExpirationDate(res.data['jwt']);
        debugPrint("EXPIRED DATE ${TokenService.instance.expirationDate}");
        debugPrint(TokenService.instance.isExpered.toString());
        StorageService.instance.storage
            .write('isexpired', TokenService.instance.isExpered);
        StorageService.instance.storage.write('jwt', res.data['jwt']);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const HomeView()),
            (route) => false);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future signIn(context) async {
    try {
      Response res = await Dio().post(ApiBase.instance.login, data: {
        "identifier": emailController.text,
        "password": passwordController.text
      });
      if (res.statusCode == HttpStatus.ok) {
        debugPrint(res.data.toString());
        StorageService.instance.storage.write('jwt', res.data['jwt']);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const HomeView()),
            (route) => false);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
