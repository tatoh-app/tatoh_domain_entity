import '../entities/message_entity.dart';

/// Modelo para serialização/deserialização de MessageEntity
class MessageModel extends MessageEntity {
  /// Construtor
  MessageModel({
    required String id,
    required String conversationId,
    required String senderId,
    required MessageType type,
    required String content,
    Map<String, dynamic>? metadata,
    required DateTime timestamp,
    required MessageStatus status,
    bool isDeleted = false,
    Map<String, List<String>>? reactions,
  }) : super(
          id: id,
          conversationId: conversationId,
          senderId: senderId,
          type: type,
          content: content,
          metadata: metadata,
          timestamp: timestamp,
          status: status,
          isDeleted: isDeleted,
          reactions: reactions,
        );

  /// Cria um modelo a partir de um Map (JSON)
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'] as String,
      conversationId: json['conversationId'] as String,
      senderId: json['senderId'] as String,
      type: _messageTypeFromJson(json['type']),
      content: json['content'] as String,
      metadata: json['metadata'] as Map<String, dynamic>?,
      timestamp: DateTime.parse(json['timestamp'] as String),
      status: _messageStatusFromJson(json['status']),
      isDeleted: json['isDeleted'] as bool? ?? false,
      reactions: json['reactions'] != null
          ? (json['reactions'] as Map<String, dynamic>).map(
              (k, v) => MapEntry(
                k,
                (v as List<dynamic>).cast<String>(),
              ),
            )
          : null,
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'conversationId': conversationId,
      'senderId': senderId,
      'type': type.index,
      'content': content,
      'metadata': metadata,
      'timestamp': timestamp.toIso8601String(),
      'status': status.index,
      'isDeleted': isDeleted,
      'reactions': reactions,
    };
  }

  /// Cria um modelo a partir de uma entidade
  factory MessageModel.fromEntity(MessageEntity entity) {
    return MessageModel(
      id: entity.id,
      conversationId: entity.conversationId,
      senderId: entity.senderId,
      type: entity.type,
      content: entity.content,
      metadata: entity.metadata,
      timestamp: entity.timestamp,
      status: entity.status,
      isDeleted: entity.isDeleted,
      reactions: entity.reactions,
    );
  }

  /// Converte um inteiro para MessageType
  static MessageType _messageTypeFromJson(dynamic json) {
    if (json is int && json >= 0 && json < MessageType.values.length) {
      return MessageType.values[json];
    }
    return MessageType.text;
  }

  /// Converte um inteiro para MessageStatus
  static MessageStatus _messageStatusFromJson(dynamic json) {
    if (json is int && json >= 0 && json < MessageStatus.values.length) {
      return MessageStatus.values[json];
    }
    return MessageStatus.sent;
  }
}
