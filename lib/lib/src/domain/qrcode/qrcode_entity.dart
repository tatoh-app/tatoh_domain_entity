/// Represents a QR code associated with a profile in the application domain.
class QrcodeEntity {
  final int? id;
  final int? typeId; // Consider replacing with an Enum in the future if applicable
  final int? profileId;
  final String? code;
  final int? allotment; // Consider if this has a more specific domain meaning
  final String? allotmentDescription;
  final String? createdAt;
  final String? updatedAt;

  const QrcodeEntity({
    this.id,
    this.typeId,
    this.profileId,
    this.code,
    this.allotment,
    this.allotmentDescription,
    this.createdAt,
    this.updatedAt,
  });

  // Methods like copyWith, equality checks (== and hashCode) could be added here
  // if needed, potentially using packages like equatable later.
}