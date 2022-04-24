import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/failures/main_failures.dart';
import 'package:netflix_app/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';
import 'package:netflix_app/domain/search/models/search_response/search_response.dart';
import 'package:netflix_app/domain/search/search_service.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsService;
  final SearchService _searchService;
  SearchBloc(this._downloadsService, this._searchService)
      : super(SearchState.initial()) {
/*
idle state
*/
    on<Initialize>((event, emit) async {
      // get trending
      if (state.idleList.isNotEmpty) {
        emit(SearchState.initial().copyWith(idleList: state.idleList));
        return;
      }

      emit(SearchState.initial().copyWith(isLoading: true));

      final _result = await _downloadsService.getDownloadsImages();

      final _state = _result.fold(
        (MainFailures failures) {
          return SearchState.initial().copyWith(isError: true);
        },
        (List<Downloads> list) {
          return SearchState.initial().copyWith(idleList: list);
        },
      );
      emit(_state);

      // show to ui
    });

/*
search result state
*/
    on<SearchMovie>((event, emit) {
      // call search movie api
      _searchService.searchMovies(movieQuery: event.movieQuery);

      // show to ui
    });
  }
}
