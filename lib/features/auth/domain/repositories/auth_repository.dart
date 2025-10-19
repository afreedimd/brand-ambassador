import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../shared/models/user_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResponse>> login(String email, String password);
  Future<Either<Failure, AuthResponse>> register(Map<String, dynamic> registerData);
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, UserModel>> getCurrentUser();
  Future<Either<Failure, AuthResponse>> refreshToken(String refreshToken);
}
