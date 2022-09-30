part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class SignUpState extends AuthInitial {
  SignUpState();
}

class SignInState extends AuthInitial {
  SignInState();
}
