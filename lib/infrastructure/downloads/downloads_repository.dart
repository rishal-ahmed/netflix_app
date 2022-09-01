import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/api_end_points.dart';
import 'package:netflix_app/domain/core/failures/main_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_app/domain/downloads/downloads_service.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';

@LazySingleton(as: DownloadsService)
class DownloadsRepository implements DownloadsService {
  @override
  Future<Either<MainFailures, List<Downloads>>> getDownloadsImages() async {
    try {
      final Response response = await Dio(BaseOptions()).get(ApiEndPoints.trending);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<Downloads> downloadsList = (response.data['results'] as List).map((e) {
          return Downloads.fromJson(e);
        }).toList();
        return Right(downloadsList);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailures.clientFailure());
    }
  }
}
