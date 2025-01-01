import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        trailing: Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            width: 34,
            height: 34,
            decoration: const ShapeDecoration(
              color: Color(0xFFEEF8ED),
              shape: OvalBorder(),
            ),
            child: SvgPicture.asset(Assets.imagesNotification),
          ),
        ),
        leading: SvgPicture.asset(Assets.imagesProfileImage),
        title: Text(
          'صباح الخير !..',
          textAlign: TextAlign.right,
          style: TextStyles.regular16.copyWith(color: const Color(0xFF949D9E)),
        ),
        subtitle: const Text(
          'أحمد مصطفي',
          textAlign: TextAlign.right,
          style: TextStyles.bold16,
        ));
  }
}
