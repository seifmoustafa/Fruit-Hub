import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/faliure.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({required String email, required String password, required String name}) {
    

    throw UnimplementedError();
  }
}
