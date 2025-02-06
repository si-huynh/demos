import 'package:json_annotation/json_annotation.dart';

part 'token_data.g.dart';

@JsonSerializable(createToJson: false)
class TokenData {
  final String id;
  final String value;

  TokenData({required this.id, required this.value});

  factory TokenData.fromJson(Map<String, dynamic> json) =>
      _$TokenDataFromJson(json);
}
