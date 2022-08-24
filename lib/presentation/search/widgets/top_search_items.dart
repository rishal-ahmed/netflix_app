import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants/base_url.dart';
import 'package:netflix_app/core/constants/colors.dart';
import 'package:netflix_app/core/constants/sizes.dart';

class TopSearchItemTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  const TopSearchItemTile({required this.title, required this.imageUrl, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: _screenWidth * 0.35,
          height: _screenWidth * 0.20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageAppendUrl + imageUrl),
            ),
          ),
        ),
        kWidth10,
        Expanded(
          child: Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const Icon(
          Icons.play_circle_outline,
          size: 32,
          color: kWhite,
        )
      ],
    );
  }
}
