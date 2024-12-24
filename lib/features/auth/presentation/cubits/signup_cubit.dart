import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());
  final AuthRepo authRepo;
  Future<void> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    emit(SignupLoading());

    final result = await authRepo.createUserWithEmailAndPassword(
        email: email, password: password, name: name);
    result.fold(
      (failure) => emit(SignupFailure(message: failure.message)),
      (userEntity) => emit(SignupSuccess(
          message: 'تم إنشاء الحساب بنجاح', userEntity: userEntity)),
    );
  }
}
