import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/featured_item.dart';

class FeaturedList extends StatelessWidget {
  const FeaturedList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(4, (index) {
          return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: FeaturedItem());
        }),
      ),
    );
  }
}
