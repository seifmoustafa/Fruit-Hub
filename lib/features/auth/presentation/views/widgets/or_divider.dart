import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      spacing: 18,
      children: [
        Expanded(
          child: Divider(
            color: Color(0xffdcdede),
          ),
        ),
        Text(
          'أو',
          style: TextStyles.semiBold16,
        ),
        Expanded(
          child: Divider(
            color: Color(0xffdcdede),
          ),
        )
      ],
    );
  }
}
