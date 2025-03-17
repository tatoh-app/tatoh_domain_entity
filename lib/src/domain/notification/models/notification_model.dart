import '../entities/notification_entity.dart';

/// Modelo para serialização/deserialização de NotificationEntity
class NotificationModel extends NotificationEntity {
  /// Construtor
  NotificationModel({
    required String id,
    required String userId,
    required String title,
    required String body,
    required NotificationType type,
    Map<String, dynamic>? data,
    required DateTime timestamp,
    bool isRead = false,
    bool isDeleted = false,
    String? imageUrl,
    String? action,
  }) : super(
          id: id,
          userId: userId,
          title: title,
          body: body,
          type: type,
          data: data,
          timestamp: timestamp,
          isRead: isRead,
          isDeleted: isDeleted,
          imageUrl: imageUrl,
          action: action,
        );

  /// Cria um modelo a partir de um Map (JSON)
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      type: _notificationTypeFromJson(json['type']),
      data: json['data'] as Map<String, dynamic>?,
      timestamp: DateTime.parse(json['timestamp'] as String),
      isRead: json['isRead'] as bool? ?? false,
      isDeleted: json['isDeleted'] as bool? ?? false,
      imageUrl: json['imageUrl'] as String?,
      action: json['action'] as String?,
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'body': body,
      'type': type.index,
      'data': data,
      'timestamp': timestamp.toIso8601String(),
      'isRead': isRead,
      'isDeleted': isDeleted,
      'imageUrl': imageUrl,
      'action': action,
    };
  }

  /// Cria um modelo a partir de uma entidade
  factory NotificationModel.fromEntity(NotificationEntity entity) {
    return NotificationModel(
      id: entity.id,
      userId: entity.userId,
      title: entity.title,
      body: entity.body,
      type: entity.type,
      data: entity.data,
      timestamp: entity.timestamp,
      isRead: entity.isRead,
      isDeleted: entity.isDeleted,
      imageUrl: entity.imageUrl,
      action: entity.action,
    );
  }

  /// Converte um inteiro para NotificationType
  static NotificationType _notificationTypeFromJson(dynamic json) {
    if (json is int && json >= 0 && json < NotificationType.values.length) {
      return NotificationType.values[json];
    }
    return NotificationType.other;
  }
}
