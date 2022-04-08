import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants/constants.dart';
import 'package:netflix_app/presentation/search/widgets/search_idle.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                prefixInsets: const EdgeInsets.symmetric(horizontal: 5),
                suffixInsets: const EdgeInsets.symmetric(horizontal: 5),
                backgroundColor: Colors.grey.withOpacity(0.5),
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey,
                ),
                style: const TextStyle(color: Colors.white),
              ),
              kHeight,
              const Expanded(
                // child: SearchResultWidget(),
                child: SearchIdleWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
