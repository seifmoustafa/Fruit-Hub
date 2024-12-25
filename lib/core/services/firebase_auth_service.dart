import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fruit_hub/core/errors/exception.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
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
      log(
        'Error in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()} and code: ${e.code}',
      );
      throw CustomFirebaseException.getFirbaseAuthException(e.code);
    } catch (e) {
      log(
        'Error in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}',
      );

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
      log(
        'Error in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()} and code: ${e.code}',
      );
      throw CustomFirebaseException.getFirbaseAuthException(e.code);
    } catch (e) {
      log('Error in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}');
      throw CustomExeption('حدث خطأ ما , يرجى المحاولة مرة أخرى');
    }
  }

  Future<User> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      return (await FirebaseAuth.instance.signInWithCredential(credential))
          .user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Error in FirebaseAuthService.signInWithGoogle: ${e.toString()} and code: ${e.code}',
      );
      throw CustomFirebaseException.getFirbaseAuthException(e.code);
    } catch (e) {
      log(
        'Error in FirebaseAuthService.signInWithGoogle: ${e.toString()}',
      );
      throw CustomExeption('حدث خطأ ما , يرجى المحاولة مرة أخرى');
    }
  }

  Future<User> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(
        loginResult.accessToken!.tokenString,
      );

      return (await FirebaseAuth.instance
              .signInWithCredential(facebookAuthCredential))
          .user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Error in FirebaseAuthService.signInWithFacebook: ${e.toString()} and code: ${e.code}',
      );
      throw CustomFirebaseException.getFirbaseAuthException(e.code);
    } catch (e) {
      log(
        'Error in FirebaseAuthService.signInWithFacebook: ${e.toString()}',
      );
      throw CustomExeption('حدث خطأ ما , يرجى المحاولة مرة أخرى');
    }
  }
}
