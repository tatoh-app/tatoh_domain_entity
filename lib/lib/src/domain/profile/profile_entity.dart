import '../link/link_entity.dart';
import '../qrcode/qrcode_entity.dart';

/// Represents a user profile in the application domain.
/// Merges concepts from legacy Profiles and CompleteProfile models.
class ProfileEntity {
  final int? id;
  final int? userId;
  final String? slug;
  final String? name;
  final String? bio;
  final String? photoUrl;
  final String? createdAt; // From CompleteProfile
  final String? updatedAt; // From CompleteProfile
  final List<LinkEntity>? links;
  final List<QrcodeEntity>? qrcodes;

  const ProfileEntity({
    this.id,
    this.userId,
    this.slug,
    this.name,
    this.bio,
    this.photoUrl,
    this.createdAt,
    this.updatedAt,
    this.links,
    this.qrcodes,
  });

  // Methods like copyWith, equality checks (== and hashCode) could be added here
  // if needed, potentially using packages like equatable later.
}