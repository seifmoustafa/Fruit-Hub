import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/exception.dart';
import 'package:fruit_hub/core/errors/custom_firebase_exception.dart';

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
      log('Error in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()} and code: ${e.code}');
      throw CustomFirebaseException(code: e.code).getFirbaseAuthException();
    } catch (e) {
      log('Error in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}');

      throw CustomExeption('حدث خطأ ما , يرجى المحاولة مرة أخرى');
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Error in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()} and code: ${e.code}');
      throw CustomFirebaseException(code: e.code).getFirbaseAuthException();
    } catch (e) {
      log('Error in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}');
      throw CustomExeption('حدث خطأ ما , يرجى المحاولة مرة أخرى');
    }
  }
}
