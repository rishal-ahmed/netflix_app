import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants/colors.dart';
import 'package:netflix_app/presentation/home/widgets/custom_buttons/text_icon_button_widget.dart';

import '../../../core/constants/sizes.dart';

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
              const CustomTextIconButton(
                icon: Icons.add,
                text: 'My List',
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
              const CustomTextIconButton(
                icon: Icons.info_outline,
                text: 'Info',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
