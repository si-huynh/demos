import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:domain/src/repository/user_repository.dart';
import 'package:models/models.dart';
import 'package:network/network.dart';

class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl({
    required this.apiClient,
  });

  final ApiClient apiClient;

  @override
  Future<Either<TokenData, String>> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    final request = SignUpRequest(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    );

    final response = await apiClient.signUp(request);

    if (response.error == true || response.data == null) {
      return right(response.reason ?? 'Unknown error');
    }

    final data = response.data;

    return left(TokenData(id: data!.id, value: data.token));
  }

  @override
  Future<Either<TokenData, String>> login({
    required String email,
    required String password,
  }) async {
    final request = 'Basic ${base64Encode(utf8.encode('$email:$password'))}';
    final response = await apiClient.login(request);

    if (response.error == true || response.data == null) {
      return right(response.reason ?? 'Unknown error');
    }

    final data = response.data;

    return left(TokenData(id: data!.id, value: data.token));
  }
}
