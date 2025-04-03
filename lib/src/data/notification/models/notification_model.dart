<<<<<<< HEAD
import '../../../domain/notification/entities/notification_entity.dart'; // Importa NotificationEntity e NotificationType
=======
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
>>>>>>> develop

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

<<<<<<< HEAD
  /// Tipo da notificação
  final NotificationType type;

  /// Dados adicionais específicos do tipo de notificação
=======
  /// Tipo da notificação (como String para JSON)
  final String type;

  /// Dados adicionais específicos do tipo de notificação (Map<String, dynamic>)
>>>>>>> develop
  final Map<String, dynamic>? data;

  /// Data e hora em que a notificação foi criada
  final DateTime timestamp;

  /// Indica se a notificação foi lida
  final bool isRead;

  /// Indica se a notificação foi excluída
  final bool isDeleted;

<<<<<<< HEAD
  /// URL da imagem associada à notificação (opcional)
  final String? imageUrl;

  /// Ação a ser executada ao tocar na notificação (ex: deeplink)
=======
  /// URL da imagem associada à notificação (pode ser nulo)
  final String? imageUrl;

  /// Ação a ser executada ao tocar na notificação (pode ser nulo)
>>>>>>> develop
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
<<<<<<< HEAD
    // TODO: Considerar adicionar validações ou tratamento de nulos mais robusto
    return NotificationModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      type: _notificationTypeFromJson(json['type']), // Usa a função auxiliar
      data: json['data'] as Map<String, dynamic>?,
      timestamp: DateTime.parse(json['timestamp'] as String),
      isRead: json['isRead'] as bool? ?? false,
      isDeleted: json['isDeleted'] as bool? ?? false,
      imageUrl: json['imageUrl'] as String?,
=======
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
>>>>>>> develop
      action: json['action'] as String?,
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
<<<<<<< HEAD
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'body': body,
      'type': type.index, // Converte enum para int (índice)
      'data': data,
      'timestamp': timestamp.toIso8601String(), // Converte DateTime para String ISO8601
      'isRead': isRead,
      'isDeleted': isDeleted,
      'imageUrl': imageUrl,
=======
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
>>>>>>> develop
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
<<<<<<< HEAD
      type: entity.type,
=======
      type: _notificationTypeToString(entity.type), // Converte enum para String
>>>>>>> develop
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
<<<<<<< HEAD
      type: type,
=======
      type: _notificationTypeFromString(type), // Converte String para enum
>>>>>>> develop
      data: data,
      timestamp: timestamp,
      isRead: isRead,
      isDeleted: isDeleted,
      imageUrl: imageUrl,
      action: action,
    );
  }
<<<<<<< HEAD

  /// Função auxiliar estática para converter JSON para NotificationType
  static NotificationType _notificationTypeFromJson(dynamic json) {
    if (json is int && json >= 0 && json < NotificationType.values.length) {
      return NotificationType.values[json];
    }
    // Retorna um valor padrão ou lança um erro se a conversão falhar
    return NotificationType.other; // Valor padrão
  }
}
=======
}
>>>>>>> develop
