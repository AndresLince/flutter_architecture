// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideoImpl _$$VideoImplFromJson(Map<String, dynamic> json) => _$VideoImpl(
      name: json['name'] as String,
      channelName: json['channelName'] as String,
      channelImage: json['channelImage'] as String,
      views: json['views'] as String,
      videoUrl: json['videoUrl'] as String,
    );

Map<String, dynamic> _$$VideoImplToJson(_$VideoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'channelName': instance.channelName,
      'channelImage': instance.channelImage,
      'views': instance.views,
      'videoUrl': instance.videoUrl,
    };
