// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_clip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideoClipImpl _$$VideoClipImplFromJson(Map<String, dynamic> json) =>
    _$VideoClipImpl(
      from: json['from'] as String,
      to: json['to'] as String,
      reasons:
          (json['reasons'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$VideoClipImplToJson(_$VideoClipImpl instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'reasons': instance.reasons,
    };
