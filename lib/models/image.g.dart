// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      height: json['Height'] as String,
      iconUrl: json['URL'] as String,
      width: json['Width'] as String,
    );

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'Height': instance.height,
      'URL': instance.iconUrl,
      'Width': instance.width,
    };
