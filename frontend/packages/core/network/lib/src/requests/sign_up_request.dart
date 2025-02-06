import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request.g.dart';

@JsonSerializable()
class SignUpRequest {
  SignUpRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    this.userType = 'standard',
  });

  factory SignUpRequest.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestFromJson(json);
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String? userType;

  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}
