import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub/features/auth/presentation/cubits/signup_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/have_an_account.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/terms_and_conditions.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});
  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, userName, password;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            spacing: 16,
            children: [
              CustomTextFormField(
                  onSaved: (value) => userName = value!,
                  hintText: 'الاسم كامل',
                  textInputType: TextInputType.name),
              CustomTextFormField(
                  onSaved: (value) => email = value!,
                  hintText: 'البريد الإلكتروني',
                  textInputType: TextInputType.emailAddress),
              CustomTextFormField(
                  onSaved: (value) => password = value!,
                  suffixIcon: const Icon(
                    Icons.remove_red_eye,
                    color: Color(0xffc9cecf),
                  ),
                  hintText: 'كلمة المرور',
                  textInputType: TextInputType.visiblePassword),
              const TermsAndConditions(),
              const SizedBox(),
              CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context
                          .read<SignupCubit>()
                          .createUserWithEmailAndPassword(
                            email,
                            password,
                            userName,
                          );
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  text: 'إنشاء حساب جديد'),
              const HaveAnAccount()
            ],
          ),
        ),
      ),
    );
  }
}
