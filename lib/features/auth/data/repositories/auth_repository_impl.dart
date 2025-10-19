import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/simple_api_client.dart';
import '../../../../shared/models/user_model.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final SimpleApiClient apiClient;

  AuthRepositoryImpl({required this.apiClient});

  @override
  Future<Either<Failure, AuthResponse>> login(String email, String password) async {
    try {
      final authResponse = await apiClient.login({
        'email': email,
        'password': password,
      });

      return Right(authResponse);
    } catch (e) {
      return Left(NetworkFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> register(Map<String, dynamic> registerData) async {
    try {
      final authResponse = await apiClient.register(registerData);

      return Right(authResponse);
    } catch (e) {
      return Left(NetworkFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await apiClient.logout();
      return const Right(null);
    } catch (e) {
      return Left(NetworkFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> getCurrentUser() async {
    try {
      final user = await apiClient.getUserProfile();
      return Right(user);
    } catch (e) {
      return Left(NetworkFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> refreshToken(String refreshToken) async {
    try {
      final authResponse = await apiClient.refreshToken({
        'refresh_token': refreshToken,
      });

      return Right(authResponse);
    } catch (e) {
      return Left(NetworkFailure(e.toString()));
    }
  }
}
