import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants/colors.dart';
import 'package:netflix_app/core/constants/sizes.dart';
import 'package:netflix_app/presentation/new_and_hot/views/coming_soon.dart';
import 'package:netflix_app/presentation/new_and_hot/views/everyones_watching.dart';
import 'package:netflix_app/presentation/widgets/app_bar_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          child: AppBarWidget(
            title: "New & Hot",
            //==================== Tabs ====================
            bottom: TabBar(
              indicatorWeight: 0,
              isScrollable: true,
              unselectedLabelColor: kColorWhite,
              labelColor: kColorBlack,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              indicator: BoxDecoration(
                color: kColorWhite,
                borderRadius: kRadius30,
              ),
              tabs: const [
                Tab(text: '🍿 Coming Soon'),
                Tab(text: '👀 Everyones Watching'),
              ],
            ),
          ),
          preferredSize: const Size.fromHeight(90.0),
        ),
        body: const SafeArea(
            child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: TabBarView(
            children: [
              ComingSoon(),
              EveryonesWatching(),
            ],
          ),
        )),
      ),
    );
  }
}
