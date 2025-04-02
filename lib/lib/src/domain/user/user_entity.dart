import 'package:flutter/foundation.dart'; // For DateTime parsing
// Note: Removed ProfileEntity import as 'profiles' field is removed for now.
// import '../profile/profile_entity.dart';

/// Represents a user in the application domain, aligned with backend structure.
@immutable // Consider making entities immutable
class UserEntity {
  final int id; // Changed to non-nullable int
  final String email; // Changed to non-nullable String
  final String? customerId; // Added
  final int? defaultProfileId; // Kept as nullable int
  final String? firebaseUid; // Added
  final String? provider; // Added
  final String? refreshToken; // Added
  // Removed token field as it's likely session-specific
  final DateTime createdAt; // Changed to DateTime
  final DateTime updatedAt; // Changed to DateTime
  // Removed profiles field for now

  const UserEntity({
    required this.id,
    required this.email,
    this.customerId,
    this.defaultProfileId,
    this.firebaseUid,
    this.provider,
    this.refreshToken,
    required this.createdAt,
    required this.updatedAt,
  });

  // Consider adding factory constructor for JSON parsing if needed within the package
  // factory UserEntity.fromJson(Map<String, dynamic> json) { ... }

  // Consider adding copyWith, equality (==, hashCode) using equatable later
}