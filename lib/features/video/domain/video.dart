import 'package:freezed_annotation/freezed_annotation.dart';

part 'video.freezed.dart';
part 'video.g.dart';

/// The response of the `GET /api/activity` endpoint.
///
/// It is defined using `freezed` and `json_serializable`.
@freezed
class Video with _$Video {
  factory Video({
    required String name,
    required String channelName,
    required String channelImage,
    required String views,
    required String videoUrl,
  }) = _Video;

  /// Convert a JSON object into an [Activity] instance.
  /// This enables type-safe reading of the API response.
  factory Video.fromJson(Map<String, dynamic> json) =>
      _$VideoFromJson(json);
}
