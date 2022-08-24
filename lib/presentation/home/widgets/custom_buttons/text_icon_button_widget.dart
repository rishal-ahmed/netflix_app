import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants/colors.dart';
import 'package:netflix_app/core/constants/sizes.dart';

class CustomTextIconButton extends StatelessWidget {
  const CustomTextIconButton({
    Key? key,
    required this.icon,
    required this.text,
    this.fontSize,
    this.iconSize,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final double? iconSize;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhite,
          size: iconSize ?? 25,
        ),
        kHeight5,
        Text(
          text,
          style: TextStyle(fontSize: fontSize ?? 12),
        ),
      ],
    );
  }
}
