import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/downloads/downloads_service.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

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
      emit(FastLaughState.initial().copyWith(isLoading: true));

      // get trending movies
      final _result = await _downloadService.getDownloadsImages();
      final _state = _result.fold(
        (l) {
          return FastLaughState.initial().copyWith(isError: true);
        },
        (r) {
          return FastLaughState.initial().copyWith(
            isLoading: false,
            videosList: r,
          );
        },
      );

      // send to ui
      emit(_state);
    });
  }
}
