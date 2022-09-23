import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants/base_url.dart';
import 'package:netflix_app/domain/core/fast_laught/reels.dart';
import 'package:netflix_app/presentation/fast_laughs/widgets/fast_laugh_video_player.dart';
import 'package:netflix_app/presentation/fast_laughs/widgets/video_actions_widget.dart';
import 'package:netflix_app/presentation/fast_laughs/widgets/video_list_item_inherited_widget.dart';
import 'package:share_plus/share_plus.dart';

class VideoListItem extends StatelessWidget {
  const VideoListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final _posterImage =
        VideoListItemInheritedWidget.of(context)?.movieData.posterImageUrl;
    final String _videoUrl =
        videoAppendUrl + reels[math.Random().nextInt(reels.length)];
    return Stack(
      children: [
        FastLaughVideoPlayer(
          videoUrl: _videoUrl,
          onStateChanged: (_) {},
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
                        backgroundImage: _posterImage == null
                            ? null
                            : NetworkImage(_posterImage),
                      ),
                    ),

                    // ========== LOL ==========
                    const VideoActionsWidget(
                      title: 'LOL',
                      icon: Icons.emoji_emotions_outlined,
                    ),

                    // ========== My List ==========
                    const VideoActionsWidget(
                      title: 'My List',
                      icon: Icons.add_outlined,
                    ),

                    // ========== Share ==========
                    InkWell(
                      onTap: () {
                        log('usl $_videoUrl');
                        final String _title = _videoUrl
                            .replaceAll(videoAppendUrl, '')
                            .replaceAll('.', '')
                            .replaceAll('-', '')
                            .replaceAll('mp4', '')
                            .replaceAll('mkv', '');
                        log(_title, name: 'title');
                        Share.share(
                            'Movie: $_title \nUrl: ${_videoUrl.replaceAll(' ', '%20')}');
                      },
                      child: const VideoActionsWidget(
                        title: 'Share',
                        icon: Icons.near_me,
                      ),
                    ),

                    // ========== Play ==========
                    const VideoActionsWidget(
                      title: 'Play',
                      icon: Icons.play_arrow,
                    )
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
