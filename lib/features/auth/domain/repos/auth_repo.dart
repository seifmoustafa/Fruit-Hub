import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/faliure.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
}
