import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../models/character.dart';

part 'characters_response.g.dart';

@JsonSerializable()
class CharactersResponse extends Equatable {
  @JsonKey(name: 'RelatedTopics')
  final List<Character> relatedTopics;

  const CharactersResponse({required this.relatedTopics});

  factory CharactersResponse.fromJson(Map<String, dynamic> json) =>
      _$CharactersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersResponseToJson(this);

  @override
  List<Object?> get props => [relatedTopics];
}
