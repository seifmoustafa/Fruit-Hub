import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Column(
          spacing: 16,
          children: [
            CustomTextFormField(
              hintText: 'البريد الإلكتروني',
              textInputType: TextInputType.emailAddress,
            ),
            CustomTextFormField(
              suffixIcon: Icon(
                Icons.remove_red_eye,
                color: Color(0xffC9CECF),
              ),
              hintText: 'كلمة المرور',
              textInputType: TextInputType.visiblePassword,
            ),
          ],
        ),
      ),
    );
  }
}
