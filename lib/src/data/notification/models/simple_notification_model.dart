import '../../../domain/notification/entities/simple_notification_entity.dart'; // Importa SimpleNotificationEntity

/// Modelo (DTO) para serialização/deserialização e transferência de dados de SimpleNotificationEntity.
/// Reside na camada de Dados.
class SimpleNotificationModel {
  /// ID único da notificação
  final String id;

  /// Título da notificação
  final String title;

  /// Corpo ou conteúdo da notificação
  final String body;

  /// Tipo da notificação
  final String? type;

  /// Dados adicionais específicos do tipo de notificação
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
    // TODO: Considerar adicionar validações ou tratamento de nulos mais robusto
    // Mantém a lógica original de tratamento de ausência de chaves
    return SimpleNotificationModel(
      id: json.containsKey('id') ? json['id'] as String? ?? '' : '',
      title: json.containsKey('title') ? json['title'] as String? ?? '' : '',
      body: json.containsKey('body') ? json['body'] as String? ?? '' : '',
      type: json.containsKey('type') ? json['type'] as String? : 'NOTIFICATION', // Valor padrão se ausente
      data: json.containsKey('data') ? json['data'] as Map<String, dynamic>? : {}, // Valor padrão se ausente
      time: DateTime.parse(json.containsKey('time')
          ? json['time'] as String? ?? DateTime.now().toIso8601String()
          : DateTime.now().toIso8601String()), // Valor padrão se ausente
      read: json.containsKey('read') ? json['read'] as bool? ?? false : false, // Valor padrão se ausente
      deleted: json.containsKey('deleted') ? json['deleted'] as bool? ?? false : false, // Valor padrão se ausente
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'type': type ?? 'NOTIFICATION', // Usa valor padrão se nulo
      'data': data ?? {}, // Usa valor padrão se nulo
      'time': time.toIso8601String(), // Converte DateTime para String ISO8601
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