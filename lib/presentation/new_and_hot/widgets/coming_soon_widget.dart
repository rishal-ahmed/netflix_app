import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/home/widgets/custom_buttons/text_icon_button_widget.dart';

import '../../../core/constants/colors/colors.dart';
import '../../../core/constants/constants.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: _screenSize.width * .10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                'FEB',
                style: TextStyle(color: kColorGrey, fontSize: 13),
              ),
              Text(
                '11',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: _screenSize.width * .90,
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 170,
                    child: Image.network(
                      'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/56v2KjBlU4XaOv9rVYEQypROD7P.jpg',
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
                    'Stranger Things 4',
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
                        icon: Icons.notifications_outlined,
                        text: 'Remind Me',
                        iconSize: 20,
                        fontSize: 10,
                      ),
                      kWidth10,
                      CustomTextIconButton(
                        icon: Icons.info_outline,
                        text: 'Info',
                        iconSize: 20,
                        fontSize: 10,
                      ),
                      kWidth10,
                    ],
                  )
                ],
              ),
              kHeight10,
              const Text('Coming on Friday'),
              kHeight10,
              const Text(
                'Stranger Things 4',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              kHeight5,
              const Text(
                'The upcoming fourth season of the american science fiction horror drama television serires Stranger Things, titled Stranger Things 4, is scheduled to be released worldwide exclusively via Netflix.',
                style: TextStyle(color: kColorGrey),
              )
            ],
          ),
        ),
      ],
    );
  }
}
