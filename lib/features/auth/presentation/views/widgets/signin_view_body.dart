import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_password_filed.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:fruit_hub/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/social_login_button.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/dont_have_an_account_widget.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  late String email, password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            spacing: 16,
            children: [
              CustomTextFormField(
                onSaved: (value) => email = value!,
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              CustomPasswordField(
                onSaved: (value) => password = value!,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'نسيت كلمة المرور؟',
                    style: TextStyles.semiBold13
                        .copyWith(color: AppColors.lightPrimaryColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context.read<SigninCubit>().signInWithEmailAndPassword(
                            email: email,
                            password: password,
                          );
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  text: 'تسجيل الدخول'),
              const SizedBox(
                height: 1,
              ),
              const DontHaveAnAccountWidget(),
              const SizedBox(
                height: 5,
              ),
              const OrDivider(),
              SocialLoginButton(
                onPressed: () {
                  context.read<SigninCubit>().signInWithGoogle();
                },
                image: Assets.imagesGoogleIcon,
                title: 'تسجيل بواسطة جوجل',
              ),
              SocialLoginButton(
                onPressed: () {},
                image: Assets.imagesApplIcon,
                title: 'تسجيل بواسطة أبل',
              ),
              SocialLoginButton(
                onPressed: () {},
                image: Assets.imagesFacebookIcon,
                title: 'تسجيل بواسطة فيسبوك',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
