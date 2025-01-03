import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/custom_buttom_navigation_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'home_view';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomButtomNavigationBar(),
      body: SafeArea(child: HomeViewBody()),
    );
  }
}
