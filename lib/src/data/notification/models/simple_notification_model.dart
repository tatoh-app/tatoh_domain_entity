import '../../../domain/notification/entities/simple_notification_entity.dart';

/// Modelo (DTO) para serialização/deserialização e transferência de dados de SimpleNotificationEntity.
/// Reside na camada de Dados.
class SimpleNotificationModel {
  /// ID único da notificação
  final String id;

  /// Título da notificação
  final String title;

  /// Corpo ou conteúdo da notificação
  final String body;

  /// Tipo da notificação (pode ser nulo)
  final String? type;

  /// Dados adicionais específicos do tipo de notificação (Map<String, dynamic>)
  final Map<String, dynamic>? data;

  /// Data e hora em que a notificação foi criada
  final DateTime time;

  /// Indica se a notificação foi lida
  final bool read;

  /// Indica se a notificação foi excluída
  final bool deleted;

  /// Construtor
  SimpleNotificationModel({
    required this.id,
    required this.title,
    required this.body,
    this.type,
    this.data,
    required this.time,
    this.read = false,
    this.deleted = false,
  });

  /// Cria um modelo a partir de um Map (JSON)
  factory SimpleNotificationModel.fromJson(Map<String, dynamic> json) {
    return SimpleNotificationModel(
      id: json['id'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      type: json['type'] as String?,
      data: json['data'] as Map<String, dynamic>?,
      time: DateTime.parse(json['time'] as String),
      read: json['read'] as bool? ?? false,
      deleted: json['deleted'] as bool? ?? false,
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'type': type,
      'data': data,
      'time': time.toIso8601String(),
      'read': read,
      'deleted': deleted,
    };
  }

  /// Cria um modelo a partir de uma entidade do domínio
  factory SimpleNotificationModel.fromEntity(SimpleNotificationEntity entity) {
    return SimpleNotificationModel(
      id: entity.id,
      title: entity.title,
      body: entity.body,
      type: entity.type,
      data: entity.data,
      time: entity.time,
      read: entity.read,
      deleted: entity.deleted,
    );
  }

  /// Converte o modelo (DTO) para uma entidade do domínio
  SimpleNotificationEntity toEntity() {
    return SimpleNotificationEntity(
      id: id,
      title: title,
      body: body,
      type: type,
      data: data,
      time: time,
      read: read,
      deleted: deleted,
    );
  }
}
