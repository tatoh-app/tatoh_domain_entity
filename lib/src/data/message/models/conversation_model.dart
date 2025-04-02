import '../../../domain/message/entities/conversation_entity.dart'; // Importa ConversationEntity e ConversationType

/// Modelo (DTO) para serialização/deserialização e transferência de dados de ConversationEntity.
/// Reside na camada de Dados.
class ConversationModel {
  /// ID único da conversa
  final String id;

  /// Tipo da conversa (individual ou grupo)
  final ConversationType type;

  /// Nome da conversa (relevante para grupos)
  final String? name;

  /// URL da foto da conversa (avatar de grupo ou do contato)
  final String? photoUrl;

  /// IDs dos participantes da conversa
  final List<String> participantIds;

  /// ID da última mensagem na conversa
  final String? lastMessageId;

  /// Conteúdo da última mensagem (preview)
  final String? lastMessageContent;

  /// Timestamp da última mensagem
  final DateTime? lastMessageTimestamp;

  /// ID do remetente da última mensagem
  final String? lastMessageSenderId;

  /// Contagem de mensagens não lidas por participante
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
    // TODO: Considerar adicionar validações ou tratamento de nulos mais robusto
    return ConversationModel(
      id: json['id'] as String,
      type: _conversationTypeFromJson(json['type']), // Usa a função auxiliar
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
              (k, v) => MapEntry(k, v as int), // Garante que o valor é int
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
      'type': type.index, // Converte enum para int (índice)
      'name': name,
      'photoUrl': photoUrl,
      'participantIds': participantIds,
      'lastMessageId': lastMessageId,
      'lastMessageContent': lastMessageContent,
      'lastMessageTimestamp': lastMessageTimestamp?.toIso8601String(), // Converte DateTime? para String?
      'lastMessageSenderId': lastMessageSenderId,
      'unreadCount': unreadCount,
      'createdAt': createdAt.toIso8601String(), // Converte DateTime para String ISO8601
      'updatedAt': updatedAt.toIso8601String(), // Converte DateTime para String ISO8601
      'isArchived': isArchived,
      'isMuted': isMuted,
      'isPinned': isPinned,
    };
  }

  /// Cria um modelo a partir de uma entidade do domínio
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

  /// Converte o modelo (DTO) para uma entidade do domínio
  ConversationEntity toEntity() {
    return ConversationEntity(
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
  }

  /// Função auxiliar estática para converter JSON para ConversationType
  static ConversationType _conversationTypeFromJson(dynamic json) {
    if (json is int && json >= 0 && json < ConversationType.values.length) {
      return ConversationType.values[json];
    }
    // Retorna um valor padrão ou lança um erro se a conversão falhar
    return ConversationType.individual; // Valor padrão
  }
}