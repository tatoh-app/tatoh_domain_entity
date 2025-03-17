

/// Tipos de conversa
enum ConversationType {
  individual,
  group
}

/// Entidade que representa uma conversa no sistema
class ConversationEntity {
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
  
  /// Contagem de mensagens não lidas
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
  const ConversationEntity({
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
  
  /// Cria uma cópia da entidade com alguns campos alterados
  ConversationEntity copyWith({
    String? id,
    ConversationType? type,
    String? name,
    String? photoUrl,
    List<String>? participantIds,
    String? lastMessageId,
    String? lastMessageContent,
    DateTime? lastMessageTimestamp,
    String? lastMessageSenderId,
    Map<String, int>? unreadCount,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isArchived,
    bool? isMuted,
    bool? isPinned,
  }) {
    return ConversationEntity(
      id: id ?? this.id,
      type: type ?? this.type,
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
      participantIds: participantIds ?? this.participantIds,
      lastMessageId: lastMessageId ?? this.lastMessageId,
      lastMessageContent: lastMessageContent ?? this.lastMessageContent,
      lastMessageTimestamp: lastMessageTimestamp ?? this.lastMessageTimestamp,
      lastMessageSenderId: lastMessageSenderId ?? this.lastMessageSenderId,
      unreadCount: unreadCount ?? this.unreadCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isArchived: isArchived ?? this.isArchived,
      isMuted: isMuted ?? this.isMuted,
      isPinned: isPinned ?? this.isPinned,
    );
  }
  

}
