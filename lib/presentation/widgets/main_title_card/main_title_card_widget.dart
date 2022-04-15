import 'package:flutter/material.dart';
import '../../../core/constants/constants.dart';
import '../main_card/main_card_widget.dart';
import '../main_title/main_title.dart';

class MainTitleCardWidget extends StatelessWidget {
  const MainTitleCardWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight10,
        MainTitle(title: title),
        kHeight5,
        LimitedBox(
          maxHeight: MediaQuery.of(context).size.width / 2.25,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: List.generate(10, (index) => const MainCardWidget()),
          ),
        )
      ],
    );
  }
}
