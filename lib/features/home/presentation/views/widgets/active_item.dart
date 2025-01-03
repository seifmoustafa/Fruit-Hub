import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(image);
  }
}
