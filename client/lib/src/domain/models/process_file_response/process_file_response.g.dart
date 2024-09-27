// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'process_file_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProcessFileResponseImpl _$$ProcessFileResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ProcessFileResponseImpl(
      clips: (json['clips'] as List<dynamic>)
          .map((e) => VideoClip.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProcessFileResponseImplToJson(
        _$ProcessFileResponseImpl instance) =>
    <String, dynamic>{
      'clips': instance.clips,
    };
