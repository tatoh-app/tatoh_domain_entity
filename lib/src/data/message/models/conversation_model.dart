import '../../../domain/message/entities/conversation_entity.dart';

/// Converte uma String para ConversationType, com fallback para individual.
ConversationType _conversationTypeFromString(String? type) {
  switch (type?.toLowerCase()) {
    case 'group':
      return ConversationType.group;
    case 'individual':
    default:
      return ConversationType.individual;
  }
}

/// Converte ConversationType para String.
String _conversationTypeToString(ConversationType type) {
  return type.toString().split('.').last;
}

/// Modelo (DTO) para serialização/deserialização e transferência de dados de ConversationEntity.
/// Reside na camada de Dados.
class ConversationModel {
  /// ID único da conversa
  final String id;

  /// Tipo da conversa (como String para JSON)
  final String type;

  /// Nome da conversa (pode ser nulo)
  final String? name;

  /// URL da foto da conversa (pode ser nulo)
  final String? photoUrl;

  /// IDs dos participantes da conversa
  final List<String> participantIds;

  /// ID da última mensagem na conversa (pode ser nulo)
  final String? lastMessageId;

  /// Conteúdo da última mensagem (pode ser nulo)
  final String? lastMessageContent;

  /// Timestamp da última mensagem (pode ser nulo)
  final DateTime? lastMessageTimestamp;

  /// ID do remetente da última mensagem (pode ser nulo)
  final String? lastMessageSenderId;

  /// Contagem de mensagens não lidas (Map<String, int>, pode ser nulo)
  final Map<String, int>? unreadCount;

  /// Data de criação da conversa
  final DateTime createdAt;

  /// Data da última atualização da conversa
  final DateTime updatedAt;

  /// Indica se a conversa está arquivada
  final bool isArchived;

  /// Indica se a conversa está silenciada
  final bool isMuted;

  /// Indica se a conversa está fixada
  final bool isPinned;

  /// Construtor
  ConversationModel({
    required this.id,
    required this.type,
    this.name,
    this.photoUrl,
    required this.participantIds,
    this.lastMessageId,
    this.lastMessageContent,
    this.lastMessageTimestamp,
    this.lastMessageSenderId,
    this.unreadCount,
    required this.createdAt,
    required this.updatedAt,
    this.isArchived = false,
    this.isMuted = false,
    this.isPinned = false,
  });

  /// Cria um modelo a partir de um Map (JSON)
  factory ConversationModel.fromJson(Map<String, dynamic> json) {
    // Adapte as chaves JSON conforme necessário
    return ConversationModel(
      id: json['id'] as String,
      type: json['type'] as String, // Assume que o tipo vem como String
      name: json['name'] as String?,
      photoUrl: json['photo_url'] as String?, // Exemplo
      participantIds:
          List<String>.from(json['participant_ids'] as List), // Exemplo
      lastMessageId: json['last_message_id'] as String?, // Exemplo
      lastMessageContent: json['last_message_content'] as String?, // Exemplo
      lastMessageTimestamp: json['last_message_timestamp'] != null
          ? DateTime.tryParse(
              json['last_message_timestamp'] as String) // Exemplo
          : null,
      lastMessageSenderId: json['last_message_sender_id'] as String?, // Exemplo
      unreadCount: (json['unread_count'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as int), // Garante que o valor é int
      ), // Exemplo
      createdAt: DateTime.parse(json['created_at'] as String), // Exemplo
      updatedAt: DateTime.parse(json['updated_at'] as String), // Exemplo
      isArchived: json['is_archived'] as bool? ?? false, // Exemplo
      isMuted: json['is_muted'] as bool? ?? false, // Exemplo
      isPinned: json['is_pinned'] as bool? ?? false, // Exemplo
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    // Adapte as chaves JSON conforme necessário
    return {
      'id': id,
      'type': type,
      'name': name,
      'photo_url': photoUrl, // Exemplo
      'participant_ids': participantIds, // Exemplo
      'last_message_id': lastMessageId, // Exemplo
      'last_message_content': lastMessageContent, // Exemplo
      'last_message_timestamp':
          lastMessageTimestamp?.toIso8601String(), // Exemplo
      'last_message_sender_id': lastMessageSenderId, // Exemplo
      'unread_count': unreadCount, // Exemplo
      'created_at': createdAt.toIso8601String(), // Exemplo
      'updated_at': updatedAt.toIso8601String(), // Exemplo
      'is_archived': isArchived, // Exemplo
      'is_muted': isMuted, // Exemplo
      'is_pinned': isPinned, // Exemplo
    };
  }

  /// Cria um modelo a partir de uma entidade do domínio
  factory ConversationModel.fromEntity(ConversationEntity entity) {
    return ConversationModel(
      id: entity.id,
      type: _conversationTypeToString(entity.type), // Converte enum para String
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

  /// Converte o modelo (DTO) para uma entidade do domínio
  ConversationEntity toEntity() {
    return ConversationEntity(
      id: id,
      type: _conversationTypeFromString(type),
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
  }
}
