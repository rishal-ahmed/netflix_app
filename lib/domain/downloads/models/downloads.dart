import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netflix_app/core/constants/base_url.dart';
part 'downloads.freezed.dart';
part 'downloads.g.dart';

@freezed
class Downloads with _$Downloads {
  const Downloads._();

  const factory Downloads({
    @JsonKey(name: 'poster_path') required String? posterPath,
    @JsonKey(name: 'backdrop_path') required String? backdropPath,
    @JsonKey(name: 'title') required String? title,
  }) = _Downloads;

  String? get posterImageUrl =>
      posterPath == null ? null : '$imageAppendUrl$posterPath';

  factory Downloads.fromJson(Map<String, dynamic> json) =>
      _$DownloadsFromJson(json);
}
