import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/sizes.dart';

class DownloadsButtons extends StatelessWidget {
  const DownloadsButtons({Key? key}) : super(key: key);

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
              color: kWhite,
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
              color: kBlack,
            ),
          ),
          color: kWhite,
        ),
      ],
    );
  }
}
