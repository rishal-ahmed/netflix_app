import 'dart:math';
import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants/constants.dart';
import 'package:netflix_app/presentation/widgets/app_bar_widget.dart';

import '../../core/constants/colors/colors.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);

  final pageSections = [
    const _SmartDownloads(),
    Section2(),
    const Section3(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        child: AppBarWidget(title: 'Downloads'),
        preferredSize: Size.fromHeight(40.0),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemBuilder: (ctx, index) => pageSections[index],
        separatorBuilder: (ctx, index) => const SizedBox(height: 20),
        itemCount: pageSections.length,
      ),
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.settings,
          color: kColorWhite,
        ),
        kWidth10,
        Text('Smart Downloads')
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({Key? key}) : super(key: key);

  final List imageList = [
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/aq4Pwv5Xeuvj6HZKtxyd23e6bE9.jpg",
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/wRnbWt44nKjsFPrqSmwYki5vZtF.jpg",
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          'Indroducing Downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kColorWhite,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight10,
        const Text(
          "We'll download a personalised selection of\n movies and shows for you, So there's\n always something to watch on your\n device.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        kHeight10,
        SizedBox(
          width: screenSize.width,
          height: screenSize.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: screenSize.width * .27,
                backgroundColor: Colors.grey.withOpacity(0.3),
              ),
              DownloadsImageWidget(
                image: imageList[0],
                margin: const EdgeInsets.only(
                  right: 140,
                ),
                angle: -17,
                size: Size(screenSize.width * 0.3, screenSize.width * 0.38),
              ),
              DownloadsImageWidget(
                image: imageList[2],
                margin: const EdgeInsets.only(
                  left: 140,
                ),
                angle: 17,
                size: Size(screenSize.width * 0.3, screenSize.width * 0.38),
              ),
              DownloadsImageWidget(
                image: imageList[1],
                margin: const EdgeInsets.only(top: 20),
                size: Size(screenSize.width * 0.3, screenSize.width * 0.42),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          minWidth: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          onPressed: () {},
          child: const Text(
            'Set Up',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: kColorWhite,
            ),
          ),
          color: kButtonBlueAccent,
        ),
        kHeight10,
        MaterialButton(
          onPressed: () {},
          padding: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: const Text(
            'See what you can download',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: kColorBlack,
            ),
          ),
          color: kColorWhite,
        ),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    Key? key,
    required this.image,
    required this.margin,
    this.angle = 0,
    required this.size,
  }) : super(key: key);

  final String image;
  final double angle;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          color: kColorBlack,
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(image),
          ),
        ),
      ),
    );
  }
}
