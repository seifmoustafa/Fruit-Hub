import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.email,
    required super.name,
  });
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      email: user.email ?? '',
      id: user.uid,
      name: user.displayName ?? '',
    );
    
  }
}
