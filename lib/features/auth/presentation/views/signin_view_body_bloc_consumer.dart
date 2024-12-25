import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/widgets/custom_progress_hud.dart';
import 'package:fruit_hub/core/helper_functions/custom_top_snack_bar.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/signin_view_body.dart';
import 'package:fruit_hub/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';

class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninFailure) {
          customErrorTopSnackBar(context: context, message: state.message);
        }
        if (state is SigninSuccess) {
          customSuccessTopSnackBar(
              context: context,
              message: state.message,
              displayDuration: const Duration(milliseconds: 50),
              animationDuration: const Duration(milliseconds: 1000),
              reverseAnimationDuration: const Duration(milliseconds: 200));
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
            isLoading: state is SigninLoading ? true : false,
            child: const SigninViewBody());
      },
    );
  }
}
