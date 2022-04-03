import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';

class MainCardWidget extends StatelessWidget {
  const MainCardWidget({
    Key? key,
    this.image,
  }) : super(key: key);

  final String? image;

  @override
  Widget build(BuildContext context) {
    Size _screensize = MediaQuery.of(context).size;

    return Container(
      margin: kHPadding5,
      width: _screensize.width / 3.25,
      height: _screensize.width / 2.5,
      decoration: BoxDecoration(
          borderRadius: kRadius5,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(image ??
                  'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg'))),
    );
  }
}
