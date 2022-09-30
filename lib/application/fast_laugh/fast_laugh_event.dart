part of 'fast_laugh_bloc.dart';

@freezed
class FastLaughEvent with _$FastLaughEvent {
  const factory FastLaughEvent.initialize() = _Initialize;
  const factory FastLaughEvent.likeVideo({required String videoId}) =
      _LikeVideo;
  const factory FastLaughEvent.unlikeVideo({required String videoId}) =
      _UnlikeVideo;
}
