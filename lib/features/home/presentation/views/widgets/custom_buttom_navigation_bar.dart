import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/domain/entities/bottom_navication_bar_entity.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/navigation_bar_item.dart';

class CustomButtomNavigationBar extends StatelessWidget {
  const CustomButtomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 70,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        children: bottomNavigationBarList.map((e) {
          return NavigationBarItem(
              bottomNavigationBarEntity: e, isSelected: false);
        }).toList(),
      ),
    );
  }
}
