part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final UserEntity userEntity;
  final String message;
  SignupSuccess({required this.message, required this.userEntity});
}

class SignupFailure extends SignupState {
  final String message;

  SignupFailure({required this.message});
}
