import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<UserEntity> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });
  
}
