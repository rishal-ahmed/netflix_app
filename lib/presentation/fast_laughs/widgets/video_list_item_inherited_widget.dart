import 'package:flutter/material.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';

class VideoListItemInheritedWidget extends InheritedWidget {
  const VideoListItemInheritedWidget({
    Key? key,
    required this.widget,
    required this.movieDatas,
  }) : super(key: key, child: widget);

  final Widget widget;
  final List<Downloads> movieDatas;

  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.movieDatas != movieDatas;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}
