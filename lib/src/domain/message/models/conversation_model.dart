import '../entities/conversation_entity.dart';

/// Modelo para serialização/deserialização de ConversationEntity
class ConversationModel extends ConversationEntity {
  /// Construtor
  ConversationModel({
    required String id,
    required ConversationType type,
    String? name,
    String? photoUrl,
    required List<String> participantIds,
    String? lastMessageId,
    String? lastMessageContent,
    DateTime? lastMessageTimestamp,
    String? lastMessageSenderId,
    Map<String, int>? unreadCount,
    required DateTime createdAt,
    required DateTime updatedAt,
    bool isArchived = false,
    bool isMuted = false,
    bool isPinned = false,
  }) : super(
          id: id,
          type: type,
          name: name,
          photoUrl: photoUrl,
          participantIds: participantIds,
          lastMessageId: lastMessageId,
          lastMessageContent: lastMessageContent,
          lastMessageTimestamp: lastMessageTimestamp,
          lastMessageSenderId: lastMessageSenderId,
          unreadCount: unreadCount,
          createdAt: createdAt,
          updatedAt: updatedAt,
          isArchived: isArchived,
          isMuted: isMuted,
          isPinned: isPinned,
        );

  /// Cria um modelo a partir de um Map (JSON)
  factory ConversationModel.fromJson(Map<String, dynamic> json) {
    return ConversationModel(
      id: json['id'] as String,
      type: _conversationTypeFromJson(json['type']),
      name: json['name'] as String?,
      photoUrl: json['photoUrl'] as String?,
      participantIds: (json['participantIds'] as List<dynamic>).cast<String>(),
      lastMessageId: json['lastMessageId'] as String?,
      lastMessageContent: json['lastMessageContent'] as String?,
      lastMessageTimestamp: json['lastMessageTimestamp'] != null
          ? DateTime.parse(json['lastMessageTimestamp'] as String)
          : null,
      lastMessageSenderId: json['lastMessageSenderId'] as String?,
      unreadCount: json['unreadCount'] != null
          ? (json['unreadCount'] as Map<String, dynamic>).map(
              (k, v) => MapEntry(k, v as int),
            )
          : null,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      isArchived: json['isArchived'] as bool? ?? false,
      isMuted: json['isMuted'] as bool? ?? false,
      isPinned: json['isPinned'] as bool? ?? false,
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.index,
      'name': name,
      'photoUrl': photoUrl,
      'participantIds': participantIds,
      'lastMessageId': lastMessageId,
      'lastMessageContent': lastMessageContent,
      'lastMessageTimestamp': lastMessageTimestamp?.toIso8601String(),
      'lastMessageSenderId': lastMessageSenderId,
      'unreadCount': unreadCount,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'isArchived': isArchived,
      'isMuted': isMuted,
      'isPinned': isPinned,
    };
  }

  /// Cria um modelo a partir de uma entidade
  factory ConversationModel.fromEntity(ConversationEntity entity) {
    return ConversationModel(
      id: entity.id,
      type: entity.type,
      name: entity.name,
      photoUrl: entity.photoUrl,
      participantIds: entity.participantIds,
      lastMessageId: entity.lastMessageId,
      lastMessageContent: entity.lastMessageContent,
      lastMessageTimestamp: entity.lastMessageTimestamp,
      lastMessageSenderId: entity.lastMessageSenderId,
      unreadCount: entity.unreadCount,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      isArchived: entity.isArchived,
      isMuted: entity.isMuted,
      isPinned: entity.isPinned,
    );
  }

  /// Converte um inteiro para ConversationType
  static ConversationType _conversationTypeFromJson(dynamic json) {
    if (json is int && json >= 0 && json < ConversationType.values.length) {
      return ConversationType.values[json];
    }
    return ConversationType.individual;
  }
}
