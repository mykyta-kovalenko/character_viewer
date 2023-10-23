import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class Image extends Equatable {
  @JsonKey(name: 'Height')
  final String height;
  @JsonKey(name: 'URL')
  final String iconUrl;
  @JsonKey(name: 'Width')
  final String width;

  const Image({
    required this.height,
    required this.iconUrl,
    required this.width,
  });

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);

  @override
  List<Object?> get props {
    return [height, iconUrl, width];
  }
}
