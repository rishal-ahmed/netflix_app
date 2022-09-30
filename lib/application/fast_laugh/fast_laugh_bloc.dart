import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/downloads/downloads_service.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

ValueNotifier<Set<String>> likedVideoIdNotifier = ValueNotifier({});

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(
    DownloadsService _downloadService,
  ) : super(FastLaughState.initial()) {
    //=-=-=-=-=- Intitialize -=-=-=-=-=
    on<_Initialize>((event, emit) async {
      // if videos are already loaded
      if (state.videosList != null && state.videosList!.isNotEmpty) {
        return emit(state);
      }

      // show loading in ui
      emit(FastLaughState.initial().copyWith(
        isLoading: true,
      ));

      // get trending movies
      final _result = await _downloadService.getDownloadsImages();
      final _state = _result.fold(
        (l) {
          return FastLaughState.initial().copyWith(
            isError: true,
          );
        },
        (r) {
          return FastLaughState.initial().copyWith(
            isLoading: false,
            videosList: r,
          );
        },
      );

      // notify ui
      emit(_state);
    });

    //=-=-=-=-=- Like Video -=-=-=-=-=
    on<_LikeVideo>((event, emit) {
      likedVideoIdNotifier.value.add(event.videoId);
      likedVideoIdNotifier.value = {...likedVideoIdNotifier.value};
      log('Liked!');
    });

    //=-=-=-=-=- Unike Video -=-=-=-=-=
    on<_UnlikeVideo>((event, emit) {
      likedVideoIdNotifier.value.remove(event.videoId);
      likedVideoIdNotifier.value = {...likedVideoIdNotifier.value};
      log('Unliked!');
    });
  }
}
