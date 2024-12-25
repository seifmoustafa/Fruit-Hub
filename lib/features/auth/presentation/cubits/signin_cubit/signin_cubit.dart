import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());

  final AuthRepo authRepo;

  void signInWithEmailAndPassword(
      {required String email, required String password}) async {
    emit(SigninLoading());
    final result = await authRepo.signInWithEmailAndPassword(
        email: email, password: password);
    result.fold(
      (failure) => emit(SigninFailure(message: failure.message)),
      (user) => emit(
          SigninSuccess(userEntity: user, message: 'تم تسجيل الدخول بنجاح')),
    );
  }

  void signInWithGoogle() async {
    emit(SigninLoading());
    final result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) => emit(SigninFailure(message: failure.message)),
      (user) => emit(
          SigninSuccess(userEntity: user, message: 'تم تسجيل الدخول بنجاح')),
    );
  }
}
