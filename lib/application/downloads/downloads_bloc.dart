import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/failures/main_failures.dart';
import 'package:netflix_app/domain/downloads/downloads_service.dart';

import '../../domain/downloads/models/downloads.dart';

part 'downloads_bloc.freezed.dart';
part 'downloads_event.dart';
part 'downloads_state.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final DownloadsService _downloadsRepo;
  DownloadsBloc(this._downloadsRepo) : super(DownloadsState.initial()) {
    on<_GetDownloadsImages>((event, emit) async {
      // get downloads
      if (state.downloads.isNotEmpty) {
        state.copyWith(isLoading: false, downloads: state.downloads);
        return;
      }

      log('Fetching Downloads from the server..', name: 'DownloadsBloc');

      emit(
        state.copyWith(
          isLoading: true,
          downloadsFailureOrSuccess: none(),
        ),
      );

      final Either<MainFailures, List<Downloads>> downloadsOption = await _downloadsRepo.getDownloadsImages();

      emit(downloadsOption.fold((failure) {
        return state.copyWith(isLoading: false, downloadsFailureOrSuccess: Some(Left(failure)));
      }, (success) {
        return state.copyWith(
          isLoading: false,
          downloads: success,
          downloadsFailureOrSuccess: Some(Right(success)),
        );
      }));
    });
  }
}
