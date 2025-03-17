import '../entities/simple_notification_entity.dart';

/// Modelo para serialização/deserialização de SimpleNotificationEntity
class SimpleNotificationModel extends SimpleNotificationEntity {
  /// Construtor
  SimpleNotificationModel({
    required String id,
    required String title,
    required String body,
    String? type,
    Map<String, dynamic>? data,
    required DateTime time,
    bool read = false,
    bool deleted = false,
  }) : super(
          id: id,
          title: title,
          body: body,
          type: type,
          data: data,
          time: time,
          read: read,
          deleted: deleted,
        );

  /// Cria um modelo a partir de um Map (JSON)
  factory SimpleNotificationModel.fromJson(Map<String, dynamic> json) {
    return SimpleNotificationModel(
      id: json.containsKey('id') ? json['id'] ?? '' : '',
      title: json.containsKey('title') ? json['title'] ?? '' : '',
      body: json.containsKey('body') ? json['body'] ?? '' : '',
      type: json.containsKey('type') ? json['type'] : 'NOTIFICATION',
      data: json.containsKey('data') ? json['data'] : {},
      time: DateTime.parse(json.containsKey('time') ? json['time'] : DateTime.now().toIso8601String()),
      read: json.containsKey('read') ? json['read'] : false,
      deleted: json.containsKey('deleted') ? json['deleted'] : false,
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'type': type ?? 'NOTIFICATION',
      'data': data ?? {},
      'time': time.toIso8601String(),
      'read': read,
      'deleted': deleted,
    };
  }

  /// Cria um modelo a partir de uma entidade
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
}
