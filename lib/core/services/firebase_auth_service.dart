import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/exception.dart';

class FirebaseAuthService {
  // Sign in with email and password
  Future<User> signInWithEmailAndPassword(
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
        throw CustomExeption('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomExeption('The account already exists for that email.');
      } else {
        throw CustomExeption('An error occurred');
      }
    } catch (e) {
      throw CustomExeption('An error occurred');
    }
  }
}
