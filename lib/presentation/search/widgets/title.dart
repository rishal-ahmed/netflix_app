import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchTitle extends StatelessWidget {
  const SearchTitle({
    required this.title,
    Key? key,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.montserrat(
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
  }
}
