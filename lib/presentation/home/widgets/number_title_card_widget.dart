import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';

import '../../widgets/main_title/main_title.dart';
import 'number_card_widget.dart';

class NumberTitleCardWidget extends StatelessWidget {
  const NumberTitleCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        const MainTitle(title: 'Top 10 Tv Shows In India Today'),
        kHeight5,
        LimitedBox(
          maxHeight: MediaQuery.of(context).size.width / 2.5,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children:
                List.generate(10, (index) => NumberCardWidget(index: index)),
          ),
        )
      ],
    );
  }
}
