import 'package:common/common.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:network/src/api_response/api_response.dart';
import 'package:network/src/requests/sign_up_request.dart';
import 'package:network/src/responses/token_data_response.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@singleton
@RestApi()
abstract class ApiClient {
  /// Factory constructor for creating a new [MembershipOrgClient] instance.
  ///
  /// Injects a [SecureStorageService] for handling secure storage and an optional [baseUrl] for the API.
  /// Configures Dio with timeouts, interceptors for signature and logging.
  factory ApiClient({String? baseUrl}) {
    // displaying for API call log
    final prettyDioLogger = PrettyDioLogger(
      maxWidth: 200,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
    );
    // defining connectTimeout and receiveTimeout
    final baseOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      validateStatus: (status) => status! <= 500,
    );

    // adding dio instance
    final dio = Dio();
    dio.options = baseOptions;
    dio.interceptors.clear();
    if (kDebugMode) {
      dio.interceptors.add(prettyDioLogger);
    }
    // defining base url
    return _ApiClient(dio, baseUrl: baseUrl);
  }

  @POST('/api/users/register')
  Future<ApiResponse<TokenDataResponse>> signUp(
    @Body() SignUpRequest request,
  );

  @POST('/api/users/login')
  Future<ApiResponse<TokenDataResponse>> login(
    @Header('authorization') String authorization,
  );
}
