import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants/sizes.dart';

class VideoActionsWidget extends StatelessWidget {
  const VideoActionsWidget(
      {Key? key, required this.title, required this.icon, this.color})
      : super(key: key);
  final String title;
  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Icon(
            icon,
            color: color ?? Colors.white,
            size: 35,
          ),
          kHeight5,
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
