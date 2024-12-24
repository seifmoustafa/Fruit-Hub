import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:fruit_hub/core/helper_functions/custom_top_snack_bar.dart';
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
          customErrorTopSnackBar(context, state.message);
        }
        if (state is SignupSuccess) {
          customSuccessTopSnackBar(context, state.message);
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
