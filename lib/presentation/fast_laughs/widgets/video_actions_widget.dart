import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants/sizes.dart';

class VideoActionsWidget extends StatelessWidget {
  const VideoActionsWidget({Key? key, required this.title, required this.icon})
      : super(key: key);
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: _screenSize.width * 0.01,
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: _screenSize.width * 0.09,
          ),
          kHeight5,
          Text(
            title,
            style: TextStyle(
                color: Colors.white, fontSize: _screenSize.width * 0.035),
          ),
        ],
      ),
    );
  }
}
