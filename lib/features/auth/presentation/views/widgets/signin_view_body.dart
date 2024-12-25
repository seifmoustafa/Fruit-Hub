import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/social_login_button.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/dont_have_an_account_widget.dart';

class SigninViewBody extends StatelessWidget {
  const SigninViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Column(
          spacing: 16,
          children: [
            const CustomTextFormField(
              hintText: 'البريد الإلكتروني',
              textInputType: TextInputType.emailAddress,
            ),
            const CustomTextFormField(
              suffixIcon: Icon(
                Icons.remove_red_eye,
                color: Color(0xffC9CECF),
              ),
              hintText: 'كلمة المرور',
              textInputType: TextInputType.visiblePassword,
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
            CustomButton(onPressed: () {}, text: 'تسجيل الدخول'),
            const SizedBox(
              height: 1,
            ),
            const DontHaveAnAccountWidget(),
            const SizedBox(
              height: 5,
            ),
            const OrDivider(),
            SocialLoginButton(
              onPressed: () {},
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
    );
  }
}
