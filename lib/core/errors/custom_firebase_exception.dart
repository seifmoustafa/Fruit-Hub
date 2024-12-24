import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/exception.dart';

class CustomFirebaseException extends FirebaseAuthException {
  CustomFirebaseException({required super.code});
  dynamic getFirbaseAuthException() {
    if (code == 'weak-password') {
      throw CustomExeption('كلمة المرور ضعيفة');
    } else if (code == 'email-already-in-use') {
      throw CustomExeption('الحساب موجود بالفعل');
    } else if (code == 'invalid-email') {
      throw CustomExeption('يرجي كتابة البريد الإلكتروني بشكل صحيح');
    } else if (code == 'operation-not-allowed') {
      throw CustomExeption('التسجيل غير مفعل');
    } else if (code == 'network-request-failed') {
      throw CustomExeption('لا يوجد اتصال بالإنترنت');
    } else if (code == 'too-many-requests') {
      throw CustomExeption('تم تجاوز الحد الأقصى لعدد المحاولات');
    } else if (code == 'user-disabled') {
      throw CustomExeption('الحساب معطل');
    } else if (code == 'user-not-found') {
      throw CustomExeption('الحساب غير موجود');
    } else if (code == 'wrong-password') {
      throw CustomExeption('كلمة المرور غير صحيحة');
    } else if (code == 'internal-error') {
      throw CustomExeption('حدث خطاء ما');
    } else if (code == 'invalid-credential') {
      throw CustomExeption('بيانات الحساب غير صحيحة');
    } else if (code == 'email-already-in-use') {
      throw CustomExeption('البريد الإلكتروني مستخدم بالفعل');
    } else if (code == 'invalid-verification-code') {
      throw CustomExeption('كود التحقق غير صحيح');
    } else if (code == 'invalid-verification-id') {
      throw CustomExeption('كود التحقق غير صحيح');
    } else {
      throw CustomExeption('حدث خطأ ما');
    }
  }
}
