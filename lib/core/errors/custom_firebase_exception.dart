import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/exception.dart';

abstract class CustomFirebaseException extends FirebaseAuthException {
  CustomFirebaseException({required super.code});

  static CustomExeption getFirbaseAuthException(String code) {
    if (code == 'email-already-in-use') {
      return CustomExeption('الحساب موجود بالفعل');
    }
    //  else if (code == 'weak-password') {
    //   return CustomExeption('كلمة المرور ضعيفة');
    // }
    // else if (code == 'invalid-email') {
    //   return CustomExeption('يرجي كتابة البريد الإلكتروني بشكل صحيح');
    // }
    else if (code == 'operation-not-allowed') {
      return CustomExeption('التسجيل غير مفعل');
    } else if (code == 'network-request-failed') {
      return CustomExeption('لا يوجد اتصال بالإنترنت');
    } else if (code == 'too-many-requests') {
      return CustomExeption('تم تجاوز الحد الأقصى لعدد المحاولات');
    } else if (code == 'user-disabled') {
      return CustomExeption('الحساب معطل');
    } else if (code == 'user-not-found') {
      return CustomExeption('الحساب غير موجود');
    } else if (code == 'wrong-password') {
      return CustomExeption('كلمة المرور غير صحيحة');
    } else if (code == 'internal-error') {
      return CustomExeption('حدث خطاء ما');
    } else if (code == 'invalid-credential') {
      return CustomExeption('بيانات الحساب غير صحيحة');
    } else if (code == 'email-already-in-use') {
      return CustomExeption('البريد الإلكتروني مستخدم بالفعل');
    } else if (code == 'invalid-verification-code') {
      return CustomExeption('كود التحقق غير صحيح');
    } else if (code == 'invalid-verification-id') {
      return CustomExeption('كود التحقق غير صحيح');
    } else {
      return CustomExeption('حدث خطأ ما');
    }
  }
}
