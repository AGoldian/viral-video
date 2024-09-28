// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_clip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideoClipImpl _$$VideoClipImplFromJson(Map<String, dynamic> json) =>
    _$VideoClipImpl(
      from: json['from'] as String,
      to: json['to'] as String,
      reason: json['reason'] as String,
      fileLink: json['fileLink'] as String,
    );

Map<String, dynamic> _$$VideoClipImplToJson(_$VideoClipImpl instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'reason': instance.reason,
      'fileLink': instance.fileLink,
    };
