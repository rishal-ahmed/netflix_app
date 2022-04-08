import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants/colors/colors.dart';

import '../../../core/constants/constants.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
            width: double.infinity,
            height: _screenSize.height / 1.4,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(kMainImage),
                fit: BoxFit.cover,
              ),
            )),
        Positioned(
          bottom: 5,
          right: 0,
          left: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: const [
                  Icon(
                    Icons.add,
                    color: kColorWhite,
                    size: 25,
                  ),
                  Text(
                    'My List',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              MaterialButton(
                  onPressed: () {},
                  color: kColorWhite,
                  height: 30,
                  child: Row(
                    children: const [
                      Icon(
                        Icons.play_arrow,
                        size: 25,
                      ),
                      kWidth5,
                      Text('Play')
                    ],
                  )),
              // _playButton(),
              Column(
                children: const [
                  Icon(
                    Icons.info_outline,
                    color: kColorWhite,
                    size: 25,
                  ),
                  Text(
                    'Info',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
