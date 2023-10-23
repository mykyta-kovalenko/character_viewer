// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      name: json['FirstUrl'] as String,
      iconUrl: Image.fromJson(json['Icon'] as Map<String, dynamic>),
      description: json['Text'] as String,
    );

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'FirstUrl': instance.name,
      'Icon': instance.iconUrl,
      'Text': instance.description,
    };
