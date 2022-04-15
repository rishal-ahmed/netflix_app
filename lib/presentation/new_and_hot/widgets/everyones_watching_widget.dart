import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/home/widgets/custom_buttons/text_icon_button_widget.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/sizes.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: kHPadding5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 170,
                  child: Image.network(
                    'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/ewUqXnwiRLhgmGhuksOdLgh49Ch.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.5),
                    radius: 18,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.volume_off,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
            kHeight10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'The Adam Project',
                  style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 3,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    kWidth10,
                    CustomTextIconButton(
                      icon: Icons.send_outlined,
                      text: 'Share',
                      iconSize: 25,
                      fontSize: 10,
                    ),
                    kWidth10,
                    CustomTextIconButton(
                      icon: Icons.add,
                      text: 'My List',
                      iconSize: 25,
                      fontSize: 10,
                    ),
                    kWidth10,
                    CustomTextIconButton(
                      icon: Icons.play_arrow,
                      text: 'Play',
                      iconSize: 25,
                      fontSize: 10,
                    ),
                    kWidth10,
                  ],
                )
              ],
            ),
            kHeight10,
            const Text(
              'The Adam Project',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            kHeight5,
            const Text(
              'After accidentally crash-landing in 2022, time-traveling fighter pilot Adam Reed teams up with his 12-year-old self on a mission to save the future.',
              style: TextStyle(color: kColorGrey),
            ),
            kHeigh30,
          ],
        ),
      ),
    );
  }
}
