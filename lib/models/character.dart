import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'image.dart';

part 'character.g.dart';

@JsonSerializable()
class Character extends Equatable {
  @JsonKey(name: 'FirstUrl')
  final String name;
  @JsonKey(name: 'Icon')
  final Image iconUrl;
  @JsonKey(name: 'Text')
  final String description;

  const Character({
    required this.name,
    required this.iconUrl,
    required this.description,
  });

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);

  @override
  List<Object?> get props {
    return [name, iconUrl, description];
  }
}
