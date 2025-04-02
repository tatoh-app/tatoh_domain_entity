/// Represents a link associated with a profile in the application domain.
class LinkEntity {
  final int? id;
  final int? typeId; // Consider replacing with an Enum in the future if applicable
  final int? profileId;
  final String? description;
  final String? url;
  final bool? public; // Changed from int? to bool? for clarity
  final String? createdAt;
  final String? updatedAt;

  const LinkEntity({
    this.id,
    this.typeId,
    this.profileId,
    this.description,
    this.url,
    this.public,
    this.createdAt,
    this.updatedAt,
  });

  // Note: The original model used int? for public. Changed to bool?
  // as it likely represents a boolean state (0 or 1).
  // This might require adjustments in the mapping layer (Data).

  // Methods like copyWith, equality checks (== and hashCode) could be added here
  // if needed, potentially using packages like equatable later.
}