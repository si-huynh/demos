import 'package:json_annotation/json_annotation.dart';

part 'token_data_response.g.dart';

@JsonSerializable(createToJson: false)
class TokenDataResponse {
  TokenDataResponse({required this.token, required this.id});

  factory TokenDataResponse.fromJson(Map<String, dynamic> json) =>
      _$TokenDataResponseFromJson(json);

  @JsonKey(name: 'value')
  final String token;

  @JsonKey(name: 'id')
  final String id;
}
