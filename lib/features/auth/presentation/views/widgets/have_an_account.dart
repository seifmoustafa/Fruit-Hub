import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';
import 'package:fruit_hub/features/auth/presentation/views/signin_view.dart';

class HaveAnAccount extends StatelessWidget {
  const HaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: 'تمتلك حساب بالفعل؟',
              style: TextStyles.semiBold16.copyWith(
                color: const Color(0xFF949D9E),
              )),
          TextSpan(
              text: ' ',
              style: TextStyles.semiBold16
                  .copyWith(color: const Color(0xFF616A6B))),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pop(context, LoginView.routeName);
              },
            text: 'تسجيل دخول',
            style:
                TextStyles.semiBold16.copyWith(color: AppColors.primaryColor),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
