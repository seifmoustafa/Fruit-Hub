class UserEntity {
  final String uId;
  final String email;
  final String name;

  UserEntity({
    required this.uId,
    required this.email,
    required this.name,
  });
  toMap() {
    return {
      'uId': uId,
      'email': email,
      'name': name,
    };
  }
}
