import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/active_item.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/in_active_item.dart';
import 'package:fruit_hub/features/home/domain/entities/bottom_navigation_bar_entity.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem(
      {super.key,
      required this.isSelected,
      required this.bottomNavigationBarEntity});
  final bool isSelected;
  final BottomNavicationBarEntity bottomNavigationBarEntity;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(
            image: bottomNavigationBarEntity.activeImage,
            title: bottomNavigationBarEntity.name,
          )
        : InActiveItem(image: bottomNavigationBarEntity.inActiveImage);
  }
}
