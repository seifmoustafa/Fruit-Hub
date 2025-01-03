import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: const Color(0xFFF3F5F7),
      ),
      child: Stack(
        children: [
          Positioned(
            // top: 0,
            // right: 0,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_outline),
            ),
          ),
          Positioned.fill(
              child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.asset(Assets.imagesWatermelonTest),
              const SizedBox(
                height: 24,
              ),
              ListTile(
                title: const Text(
                  'بطيخ',
                  textAlign: TextAlign.right,
                  style: TextStyles.semiBold13,
                ),
                subtitle: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '20جنية ',
                        style: TextStyles.bold13
                            .copyWith(color: AppColors.secondaryColor),
                      ),
                      TextSpan(
                        text: '/',
                        style: TextStyles.bold13
                            .copyWith(color: AppColors.liteSecondaryColor),
                      ),
                      TextSpan(
                        text: ' الكيلو',
                        style: TextStyles.semiBold13
                            .copyWith(color: AppColors.liteSecondaryColor),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.right,
                ),
                trailing: const CircleAvatar(
                  backgroundColor: AppColors.primaryColor,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
