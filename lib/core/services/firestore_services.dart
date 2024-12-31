import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hub/core/services/database_service.dart';
import 'package:fruit_hub/features/auth/data/models/user_model.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';

class FirestoreServices implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path, required Map<String, dynamic> data}) async {
    await firestore.collection(path).add(data);
  }

  @override
  Future<UserEntity> getUserData(
      {required String path, required String uId}) async {
    var data = await firestore.collection(path).doc(uId).get();
    return UserModel.fromJson(data.data() as Map<String, dynamic>);
  }
}
