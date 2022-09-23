import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix_app/domain/core/fast_laught/reels.dart';
import 'package:netflix_app/presentation/fast_laughs/widgets/video_list_item.dart';
import 'package:netflix_app/presentation/fast_laughs/widgets/video_list_item_inherited_widget.dart';

class ScreenFastLaughs extends StatelessWidget {
  const ScreenFastLaughs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughBloc>(context)
          .add(const FastLaughEvent.initialize());
    });
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<FastLaughBloc, FastLaughState>(
          builder: (context, state) {
            if (state.isLoading || state.videosList == null) {
              return const Center(
                  child: CircularProgressIndicator(strokeWidth: 2)); // loading
            } else if (state.isError) {
              return const Center(child: Text('Something went wrong')); // error
            } else if (state.videosList != null && state.videosList!.isEmpty) {
              return const Center(child: Text('No recent videos')); // empty
            } else {
              return PageView(
                scrollDirection: Axis.vertical,
                children: List.generate(
                  reels.length,
                  (index) => VideoListItemInheritedWidget(
                    widget: const VideoListItem(),
                    movieData: state.videosList![
                        Random().nextInt(state.videosList!.length)],
                    key: Key('$index'),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
