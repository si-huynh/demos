import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_failure.freezed.dart';

@freezed
class ApiFailure with _$ApiFailure {
  const factory ApiFailure.connectivityError(String errorMessage) =
      _ConnectivityError;

  const factory ApiFailure.serverError(String errorMessage) = _ServerError;
}
