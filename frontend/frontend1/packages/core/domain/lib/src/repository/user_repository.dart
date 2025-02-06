import 'package:dartz/dartz.dart';
import 'package:models/models.dart';

abstract class UserRepository {
  Future<Either<TokenData, String>> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });

  Future<Either<TokenData, String>> login({
    required String email,
    required String password,
  });
}
