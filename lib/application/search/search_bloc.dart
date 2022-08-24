import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
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
  SearchBloc(this._downloadsService, this._searchService) : super(SearchState.initial()) {
/*
idle state
*/
    on<Initialize>((event, emit) async {
      // get trending
      if (state.idleList.isNotEmpty) {
        emit(SearchState.initial().copyWith(idleList: state.idleList, isSearching: false));
        return;
      }

      log('Fetching Trending from the server..', name: 'SearchBloc');
      emit(SearchState.initial().copyWith(isLoading: true));

      final _result = await _downloadsService.getDownloadsImages();

      final _state = _result.fold(
        (MainFailures failures) {
          return SearchState.initial().copyWith(
            isError: true,
            isSearching: false,
          );
        },
        (List<Downloads> list) {
          return SearchState.initial().copyWith(idleList: list, isSearching: false);
        },
      );

      // show to ui
      emit(_state);
    });

/*
search result state
*/
    on<SearchMovie>((event, emit) async {
      // call search movie api
      log('searching for Movie: ${event.movieQuery}', name: 'SearchBloc');

      emit(SearchState.initial().copyWith(isLoading: true, idleList: state.idleList, isSearching: true));

      final Either<MainFailures, SearchResponse> _result = await _searchService.searchMovies(movieQuery: event.movieQuery);
      final _state = _result.fold(
        (MainFailures failures) => SearchState.initial().copyWith(isError: true, isSearching: true),
        (SearchResponse response) => SearchState.initial().copyWith(searchResultList: response.results, idleList: state.idleList, isSearching: true),
      );

      // show to ui
      emit(_state);
    });
  }
}
