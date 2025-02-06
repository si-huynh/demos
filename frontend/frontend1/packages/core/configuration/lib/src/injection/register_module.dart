import 'package:common/common.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:network/network.dart';
import 'package:routing/routing.dart';

@module
abstract class RegisterModule {
  @singleton
  AppRouter get appRouter => AppRouter();

  @singleton
  SecureStorageService get storage => SecureStorageService();

  @singleton
  Environment get env => Environment.dev();

  @singleton
  Future<ApiClient> get apiClient async => ApiClient(
        baseUrl: env.apiBaseUrl,
      );

  @preResolve
  @singleton
  Future<UserRepository> get userRepository async => UserRepositoryImpl(
        apiClient: await apiClient,
      );
}
