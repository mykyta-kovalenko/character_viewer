import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'icon.g.dart';

@JsonSerializable()
class Icon extends Equatable {
  @JsonKey(name: 'Height')
  final String height;
  @JsonKey(name: 'URL')
  final String url;
  @JsonKey(name: 'Width')
  final String width;

  const Icon({
    required this.height,
    required this.url,
    required this.width,
  });

  factory Icon.fromJson(Map<String, dynamic> json) => _$IconFromJson(json);

  Map<String, dynamic> toJson() => _$IconToJson(this);

  @override
  List<Object?> get props {
    return [height, url, width];
  }
}
