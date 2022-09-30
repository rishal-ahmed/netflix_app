import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix_app/core/constants/base_url.dart';
import 'package:netflix_app/presentation/fast_laughs/widgets/fast_laugh_video_player.dart';
import 'package:netflix_app/presentation/fast_laughs/widgets/video_actions_widget.dart';
import 'package:netflix_app/presentation/fast_laughs/widgets/video_list_item_inherited_widget.dart';
import 'package:share_plus/share_plus.dart';

class VideoListItem extends StatelessWidget {
  const VideoListItem({
    Key? key,
    required this.videoId,
  }) : super(key: key);

  final String videoId;

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final _posterImage = VideoListItemInheritedWidget.of(context)
        ?.movieDatas[math.Random().nextInt(
            VideoListItemInheritedWidget.of(context)!.movieDatas.length)]
        .posterImageUrl;

    final String _videoUrl = videoAppendUrl + videoId;
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
                    ValueListenableBuilder(
                      valueListenable: likedVideoIdNotifier,
                      builder: (context, Set<String> likedVideos, _) {
                        log('Like Builder!');
                        bool _liked = likedVideos.contains(videoId);
                        return InkWell(
                          onTap: () {
                            if (_liked) {
                              BlocProvider.of<FastLaughBloc>(context).add(
                                  FastLaughEvent.unlikeVideo(videoId: videoId));
                            } else {
                              BlocProvider.of<FastLaughBloc>(context).add(
                                  FastLaughEvent.likeVideo(videoId: videoId));
                            }
                          },
                          child: _liked
                              ? const VideoActionsWidget(
                                  title: 'Unlike',
                                  icon: Icons.favorite,
                                  color: Colors.red,
                                )
                              : const VideoActionsWidget(
                                  title: 'Like',
                                  icon: Icons.favorite_outline,
                                ),
                        );
                      },
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
