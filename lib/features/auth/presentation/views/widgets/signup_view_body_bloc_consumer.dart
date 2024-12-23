import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:fruit_hub/features/auth/presentation/cubits/signup_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/signup_view_body.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupFailure) {
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(
          //     content: Text(state.message),
          //     backgroundColor: Colors.red,
          //   ),
          // );
          // AnimatedSnackBar.rectangle(
          //   duration: const Duration(seconds: 3),
          //   'خطأ في التسجيل',
          //   state.message,
          //   type: AnimatedSnackBarType.error,
          //   brightness: Brightness.light,
          // ).show(context);
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.error(
              message: state.message,
            ),
          );
        }
        if (state is SignupSuccess) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is SignupLoading ? true : false,
            child: const SignupViewBody());
      },
    );
  }
}
