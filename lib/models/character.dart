import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'icon.dart';

part 'character.g.dart';

@JsonSerializable()
class Character extends Equatable {
  @JsonKey(name: 'FirstURL')
  final String firstUrl;
  @JsonKey(name: 'Icon')
  final Icon icon;
  @JsonKey(name: 'Text')
  final String text;

  const Character({
    required this.firstUrl,
    required this.icon,
    required this.text,
  });

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);

  @override
  List<Object?> get props {
    return [firstUrl, icon, text];
  }
}
