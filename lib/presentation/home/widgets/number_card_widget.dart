import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants/colors.dart';
import 'package:netflix_app/core/constants/sizes.dart';

class NumberCardWidget extends StatelessWidget {
  const NumberCardWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    Size _screensize = MediaQuery.of(context).size;

    return Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            kWidth20,
            Container(
              margin: kHPadding5,
              width: _screensize.width / 3.25,
              height: _screensize.width / 2.25,
              decoration: BoxDecoration(
                  borderRadius: kRadius5,
                  image: const DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage('https://www.themoviedb.org/t/p/w600_and_h900_bestv2/sqLowacltbZLoCa4KYye64RvvdQ.jpg'))),
            ),
          ],
        ),
        Positioned(
          bottom: -20,
          left: -5,
          child: BorderedText(
            strokeWidth: 5.0,
            strokeColor: kWhite,
            child: Text(
              '${index + 1}',
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 85,
                decoration: TextDecoration.none,
                decorationColor: kBlack,
                fontWeight: FontWeight.bold,
                color: kBlack,
              ),
            ),
          ),
        )
      ],
    );
  }
}
