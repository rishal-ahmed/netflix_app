import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_app/core/constants/constants.dart';
import 'package:netflix_app/core/constants/text.dart';
import 'package:netflix_app/presentation/home/widgets/background_card_widget.dart';
import 'package:netflix_app/presentation/home/widgets/number_title_card_widget.dart';
import 'package:netflix_app/presentation/widgets/main_title_card/main_title_card_widget.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(false);

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ValueListenableBuilder(
              valueListenable: scrollNotifier,
              builder: (ctx, index, _) {
                return NotificationListener<UserScrollNotification>(
                  onNotification: (notification) {
                    final ScrollDirection scrollDirection =
                        notification.direction;
                    log('$scrollDirection');
                    switch (scrollDirection) {
                      case ScrollDirection.reverse:
                        scrollNotifier.value = false;
                        break;
                      case ScrollDirection.forward:
                        scrollNotifier.value = true;
                        break;
                      default:
                    }
                    return true;
                  },
                  child: Stack(
                    children: [
                      ListView(
                        children: const [
                          BackgroundCard(),

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
                      scrollNotifier.value
                          ? AnimatedContainer(
                              color: Colors.black.withOpacity(0.2),
                              width: double.infinity,
                              height: 70,
                              duration: const Duration(microseconds: 1000),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          'assets/images/netflix.png',
                                          fit: BoxFit.cover,
                                          height: 30,
                                        ),
                                        const Spacer(),
                                        const Icon(
                                          Icons.cast,
                                          color: Colors.white,
                                          size: 25,
                                        ),
                                        kWidth,
                                        Container(
                                          color: Colors.blue,
                                          height: 21,
                                          width: 21,
                                        ),
                                        kWidth,
                                      ],
                                    ),
                                  ),
                                  kHeight5,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: const [
                                      Text(
                                        'TV Shows',
                                        style: kBoldText,
                                      ),
                                      Text(
                                        'Movies',
                                        style: kBoldText,
                                      ),
                                      Text(
                                        'Categories',
                                        style: kBoldText,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          : kHeight,
                    ],
                  ),
                );
              })),
    );
  }
}
