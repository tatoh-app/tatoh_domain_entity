import '../../../domain/notification/entities/notification_entity.dart';

/// Converte uma String para NotificationType, com fallback para other.
NotificationType _notificationTypeFromString(String? type) {
  switch (type?.toLowerCase()) {
    case 'system':
      return NotificationType.system;
    case 'message':
      return NotificationType.message;
    case 'contact':
      return NotificationType.contact;
    case 'card':
      return NotificationType.card;
    case 'event':
      return NotificationType.event;
    case 'reminder':
      return NotificationType.reminder;
    case 'other':
    default:
      return NotificationType.other;
  }
}

/// Converte NotificationType para String.
String _notificationTypeToString(NotificationType type) {
  return type.toString().split('.').last;
}

/// Modelo (DTO) para serialização/deserialização e transferência de dados de NotificationEntity.
/// Reside na camada de Dados.
class NotificationModel {
  /// ID único da notificação
  final String id;

  /// ID do usuário destinatário da notificação
  final String userId;

  /// Título da notificação
  final String title;

  /// Corpo ou conteúdo da notificação
  final String body;

  /// Tipo da notificação (como String para JSON)
  final String type;

  /// Dados adicionais específicos do tipo de notificação (Map<String, dynamic>)
  final Map<String, dynamic>? data;

  /// Data e hora em que a notificação foi criada
  final DateTime timestamp;

  /// Indica se a notificação foi lida
  final bool isRead;

  /// Indica se a notificação foi excluída
  final bool isDeleted;

  /// URL da imagem associada à notificação (pode ser nulo)
  final String? imageUrl;

  /// Ação a ser executada ao tocar na notificação (pode ser nulo)
  final String? action;

  /// Construtor
  NotificationModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
    required this.type,
    this.data,
    required this.timestamp,
    this.isRead = false,
    this.isDeleted = false,
    this.imageUrl,
    this.action,
  });

  /// Cria um modelo a partir de um Map (JSON)
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    // Adapte as chaves JSON conforme necessário
    return NotificationModel(
      id: json['id'] as String,
      userId: json['user_id'] as String, // Exemplo
      title: json['title'] as String,
      body: json['body'] as String,
      type: json['type'] as String, // Assume que o tipo vem como String
      data: json['data'] as Map<String, dynamic>?,
      timestamp: DateTime.parse(json['timestamp'] as String),
      isRead: json['is_read'] as bool? ?? false, // Exemplo
      isDeleted: json['is_deleted'] as bool? ?? false, // Exemplo
      imageUrl: json['image_url'] as String?, // Exemplo
      action: json['action'] as String?,
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    // Adapte as chaves JSON conforme necessário
    return {
      'id': id,
      'user_id': userId, // Exemplo
      'title': title,
      'body': body,
      'type': type,
      'data': data,
      'timestamp': timestamp.toIso8601String(),
      'is_read': isRead, // Exemplo
      'is_deleted': isDeleted, // Exemplo
      'image_url': imageUrl, // Exemplo
      'action': action,
    };
  }

  /// Cria um modelo a partir de uma entidade do domínio
  factory NotificationModel.fromEntity(NotificationEntity entity) {
    return NotificationModel(
      id: entity.id,
      userId: entity.userId,
      title: entity.title,
      body: entity.body,
      type: _notificationTypeToString(entity.type), // Converte enum para String
      data: entity.data,
      timestamp: entity.timestamp,
      isRead: entity.isRead,
      isDeleted: entity.isDeleted,
      imageUrl: entity.imageUrl,
      action: entity.action,
    );
  }

  /// Converte o modelo (DTO) para uma entidade do domínio
  NotificationEntity toEntity() {
    return NotificationEntity(
      id: id,
      userId: userId,
      title: title,
      body: body,
      type: _notificationTypeFromString(type), // Converte String para enum
      data: data,
      timestamp: timestamp,
      isRead: isRead,
      isDeleted: isDeleted,
      imageUrl: imageUrl,
      action: action,
    );
  }
}
