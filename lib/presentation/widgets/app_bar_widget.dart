import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_app/core/constants/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
    required this.title,
    this.bottom,
  }) : super(key: key);
  final String title;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: bottom,
      title: Text(
        title,
        style: GoogleFonts.montserrat(
          fontSize: 23,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        const Icon(
          Icons.cast,
          color: Colors.white,
          size: 25,
        ),
        kWidth10,
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Container(
            color: Colors.blue,
            height: 22,
            width: 22,
          ),
        ),
        kWidth10,
      ],
    );
  }
}
