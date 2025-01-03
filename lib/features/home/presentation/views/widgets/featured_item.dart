import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:fruit_hub/features/home/presentation/views/widgets/featured_item_button.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: itemWidth,
      child: AspectRatio(
        aspectRatio: 342 / 158,
        child: Stack(
          children: [
            Image.asset(Assets.imagesWatermelonTest),
            Container(
              width: itemWidth * .5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: svg.Svg(Assets.imagesFeaturedItemBackground),
                    fit: BoxFit.fill),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 33.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    const SizedBox(
                      height: 0,
                    ),
                    Text('عروض العيد',
                        style:
                            TextStyles.regular13.copyWith(color: Colors.white)),
                    const Spacer(),
                    Text(
                      'خصم 25%',
                      style: TextStyles.bold19.copyWith(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 11 - 8,
                    ),
                    FeaturedItemButton(
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: 29 - 8,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
