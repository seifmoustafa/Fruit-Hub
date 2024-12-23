import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/exception.dart';

class FirebaseAuthService {
  // Sign in with email and password
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomExeption('كلمة المرور ضعيفة');
      } else if (e.code == 'email-already-in-use') {
        throw CustomExeption('الحساب موجود بالفعل');
      } else {
        throw CustomExeption('حدث خطأ ما');
      }
    } catch (e) {
      throw CustomExeption('حدث خطأ ما');
    }
  }
}
