/// Represents a user's subscription data in the application domain.
class SubscriptionEntity {
  final int? id;
  final int? planId; // Consider if this relates to a PlanEntity in the future
  final int? userId;
  final String? createdAt;
  final String? updatedAt;

  const SubscriptionEntity({
    this.id,
    this.planId,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  // Methods like copyWith, equality checks (== and hashCode) could be added here
  // if needed, potentially using packages like equatable later.
}