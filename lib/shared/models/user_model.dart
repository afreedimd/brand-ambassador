import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: false, includeIfNull: false)
class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;
  final String? avatar;
  final String role;
  final String? tier;
  final bool isVerified;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Map<String, dynamic>? metadata;

  const UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.avatar,
    required this.role,
    this.tier,
    required this.isVerified,
    required this.createdAt,
    required this.updatedAt,
    this.metadata,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserModel copyWith({
    String? id,
    String? email,
    String? name,
    String? avatar,
    String? role,
    String? tier,
    bool? isVerified,
    DateTime? createdAt,
    DateTime? updatedAt,
    Map<String, dynamic>? metadata,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      role: role ?? this.role,
      tier: tier ?? this.tier,
      isVerified: isVerified ?? this.isVerified,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      metadata: metadata ?? this.metadata,
    );
  }

  @override
  List<Object?> get props => [
        id,
        email,
        name,
        avatar,
        role,
        tier,
        isVerified,
        createdAt,
        updatedAt,
        metadata,
      ];
}

@JsonSerializable(explicitToJson: false, includeIfNull: false)
class AuthResponse extends Equatable {
  final String token;
  final String refreshToken;
  final UserModel user;
  final DateTime expiresAt;

  const AuthResponse({
    required this.token,
    required this.refreshToken,
    required this.user,
    required this.expiresAt,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);

  @override
  List<Object?> get props => [token, refreshToken, user, expiresAt];
}
