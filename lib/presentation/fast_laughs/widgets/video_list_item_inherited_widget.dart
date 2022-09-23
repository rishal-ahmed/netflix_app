import 'package:flutter/material.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';

class VideoListItemInheritedWidget extends InheritedWidget {
  const VideoListItemInheritedWidget({
    Key? key,
    required this.widget,
    required this.movieData,
  }) : super(key: key, child: widget);

  final Widget widget;
  final Downloads movieData;

  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}
