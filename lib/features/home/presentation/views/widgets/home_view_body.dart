import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/widgets/fruit_item.dart';
import 'package:fruit_hub/core/widgets/search_text_field.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/featured_list.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/best_selling_grid_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              spacing: kSpacing,
              children: [
                CustomHomeAppBar(),
                SearchTextField(),
                FeaturedList(),
                BestSellingHeader(),
                SizedBox()
              ],
            ),
          ),
          BestSellingGridView()
        ],
      ),
    );
  }
}
