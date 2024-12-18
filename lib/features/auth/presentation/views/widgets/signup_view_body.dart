import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/terms_and_conditions.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          spacing: 16,
          children: [
            CustomTextFormField(
                hintText: 'الاسم كامل', textInputType: TextInputType.name),
            CustomTextFormField(
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.emailAddress),
            CustomTextFormField(
                suffixIcon: Icon(
                  Icons.remove_red_eye,
                  color: Color(0xffc9cecf),
                ),
                hintText: 'كلمة المرور',
                textInputType: TextInputType.visiblePassword),
            TermsAndConditions(),
          ],
        ),
      ),
    );
  }
}
