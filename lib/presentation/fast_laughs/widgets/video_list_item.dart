import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/fast_laughs/widgets/video_actions_widget.dart';

const listPage = [
  'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/sqLowacltbZLoCa4KYye64RvvdQ.jpg',
  'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/74xTEgt7R36Fpooo50r9T25onhq.jpg',
  'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/wFjboE0aFZNbVOF05fzrka9Fqyx.jpg',
  'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/1KHoDh6NW8SWOJu8JnFe6wWaMD3.jpg',
  'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/ko1JVbGj4bT8IhCWqjBQ6ZtF2t.jpg',
  'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/odVv1sqVs0KxBXiA8bhIBlPgalx.jpg',
  'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/zHQy4h36WwuCetKS7C3wcT1hkgA.jpg',
  'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/kZNHR1upJKF3eTzdgl5V8s8a4C3.jpg',
  'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg',
  'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/5cnLoWq9o5tuLe1Zq4BTX4LwZ2B.jpg',
];

class VideoListItem extends StatelessWidget {
  const VideoListItem({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(listPage[index]),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: _screenSize.width * 0.04,
                vertical: _screenSize.width * 0.03),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Left Side Widgets
                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  radius: _screenSize.width * 0.07,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.volume_off,
                      size: _screenSize.width * 0.065,
                      color: Colors.white,
                    ),
                  ),
                ),

                //Right side Widgets
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: _screenSize.width * 0.03),
                      child: CircleAvatar(
                        radius: _screenSize.width * 0.07,
                        backgroundColor: Colors.black,
                        backgroundImage: NetworkImage(listPage[index]),
                      ),
                    ),
                    const VideoActionsWidget(
                        title: 'LOL', icon: Icons.emoji_emotions_outlined),
                    const VideoActionsWidget(
                        title: 'My List', icon: Icons.add_outlined),
                    const VideoActionsWidget(title: 'Share', icon: Icons.share),
                    const VideoActionsWidget(
                        title: 'Play', icon: Icons.play_arrow)
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
