import 'dart:developer';
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
      log('Error in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()} and code: ${e.code}');
      if (e.code == 'weak-password') {
        throw CustomExeption('كلمة المرور ضعيفة');
      } else if (e.code == 'email-already-in-use') {
        throw CustomExeption('الحساب موجود بالفعل');
      } else if (e.code == 'invalid-email') {
        throw CustomExeption('يرجي كتابة البريد الإلكتروني بشكل صحيح');
      } else if (e.code == 'operation-not-allowed') {
        throw CustomExeption('التسجيل غير مفعل');
      } else if (e.code == 'network-request-failed') {
        throw CustomExeption('لا يوجد اتصال بالإنترنت');
      } else if (e.code == 'too-many-requests') {
        throw CustomExeption('تم تجاوز الحد الأقصى لعدد المحاولات');
      } else if (e.code == 'user-disabled') {
        throw CustomExeption('الحساب معطل');
      } else if (e.code == 'user-not-found') {
        throw CustomExeption('الحساب غير موجود');
      } else if (e.code == 'wrong-password') {
        throw CustomExeption('كلمة المرور غير صحيحة');
      } else if (e.code == 'internal-error') {
        throw CustomExeption('حدث خطاء ما');
      } else if (e.code == 'invalid-credential') {
        throw CustomExeption('بيانات الحساب غير صحيحة');
      } else if (e.code == 'email-already-in-use') {
        throw CustomExeption('البريد الإلكتروني مستخدم بالفعل');
      } else if (e.code == 'invalid-verification-code') {
        throw CustomExeption('كود التحقق غير صحيح');
      } else if (e.code == 'invalid-verification-id') {
        throw CustomExeption('كود التحقق غير صحيح');
      } else {
        throw CustomExeption('حدث خطأ ما');
      }
    } catch (e) {
      log('Error in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}');

      throw CustomExeption('حدث خطأ ما , يرجى المحاولة مرة أخرى');
    }
  }
}
