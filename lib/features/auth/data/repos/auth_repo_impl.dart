import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/faliure.dart';
import 'package:fruit_hub/core/errors/exception.dart';
import 'package:fruit_hub/core/services/firebase_auth_service.dart';
import 'package:fruit_hub/features/auth/data/models/user_model.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
        password: password,
        email: email,
      );
      return right(UserModel.fromFirebaseUser(user));
    } on CustomExeption catch (e) {
      return left(ServerFaliure(message: e.message));
    } catch (e) {
      log('Error in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}');
      return left(
          ServerFaliure(message: 'حدث خطأ ما يرجى المحاولة مرة أخرى لاحقا!'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(UserModel.fromFirebaseUser(user));
    } on CustomExeption catch (e) {
      return left(ServerFaliure(message: e.message));
    } catch (e) {
      log('Error in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}');
      return left(
          ServerFaliure(message: 'حدث خطأ ما يرجى المحاولة مرة أخرى لاحقا!'));
    }
  }
}
