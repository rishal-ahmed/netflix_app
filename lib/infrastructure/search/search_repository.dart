import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/api_end_points.dart';
import 'package:netflix_app/domain/core/failures/main_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_app/domain/search/models/search_response/search_response.dart';
import 'package:netflix_app/domain/search/search_service.dart';

@LazySingleton(as: SearchService)
class SearchRepository implements SearchService {
  @override
  Future<Either<MainFailures, SearchResponse>> searchMovies(
      {required String movieQuery}) async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.search, queryParameters: {
        'query': movieQuery,
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SearchResponse.fromJson(response.data);

        return Right(result);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailures.clientFailure());
    }
  }
}
