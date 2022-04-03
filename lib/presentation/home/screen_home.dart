import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/home/widgets/number_card_widget.dart';
import 'package:netflix_app/presentation/home/widgets/number_title_card_widget.dart';
import 'package:netflix_app/presentation/widgets/main_title_card/main_title_card_widget.dart';

import '../widgets/main_card/main_card_widget.dart';
import '../widgets/main_title/main_title.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: kPadding10,
        child: SingleChildScrollView(
          child: Column(
            children: const [
              //========== Main Title Card Widget ==========
              MainTitleCardWidget(
                title: 'Released in the past year',
              ),
              kHeight5,

              //========== Main Title Card Widget ==========
              MainTitleCardWidget(
                title: 'Trending Now',
              ),
              kHeight5,

              //========== Number Title Card Widget ==========
              NumberTitleCardWidget(),
              kHeight5,

              //========== Main Title Card Widget ==========
              MainTitleCardWidget(
                title: 'Tense Dramas',
              ),
              kHeight5,

              //========== Main Title Card Widget ==========
              MainTitleCardWidget(
                title: 'South Indian Cinema',
              ),
            ],
          ),
        ),
      )),
    );
  }
}
