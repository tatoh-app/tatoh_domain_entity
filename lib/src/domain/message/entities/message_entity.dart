

/// Tipos de mensagem suportados
enum MessageType {
  text,
  image,
  video,
  audio,
  file,
  location,
  contact,
  system
}

/// Status de entrega da mensagem
enum MessageStatus {
  sending,
  sent,
  delivered,
  read,
  failed
}

/// Entidade que representa uma mensagem no sistema
class MessageEntity {
  /// ID único da mensagem
  final String id;
  
  /// ID da conversa a que esta mensagem pertence
  final String conversationId;
  
  /// ID do remetente da mensagem
  final String senderId;
  
  /// Tipo da mensagem
  final MessageType type;
  
  /// Conteúdo da mensagem (texto, URL de mídia, etc.)
  final String content;
  
  /// Dados adicionais específicos do tipo de mensagem
  final Map<String, dynamic>? metadata;
  
  /// Data e hora em que a mensagem foi enviada
  final DateTime timestamp;
  
  /// Status de entrega da mensagem
  final MessageStatus status;
  
  /// Indica se a mensagem foi excluída
  final bool isDeleted;
  
  /// Reações à mensagem (emoji e ID do usuário)
  final Map<String, List<String>>? reactions;
  
  /// Construtor
  const MessageEntity({
    required this.id,
    required this.conversationId,
    required this.senderId,
    required this.type,
    required this.content,
    this.metadata,
    required this.timestamp,
    required this.status,
    this.isDeleted = false,
    this.reactions,
  });
  
  /// Cria uma cópia da entidade com alguns campos alterados
  MessageEntity copyWith({
    String? id,
    String? conversationId,
    String? senderId,
    MessageType? type,
    String? content,
    Map<String, dynamic>? metadata,
    DateTime? timestamp,
    MessageStatus? status,
    bool? isDeleted,
    Map<String, List<String>>? reactions,
  }) {
    return MessageEntity(
      id: id ?? this.id,
      conversationId: conversationId ?? this.conversationId,
      senderId: senderId ?? this.senderId,
      type: type ?? this.type,
      content: content ?? this.content,
      metadata: metadata ?? this.metadata,
      timestamp: timestamp ?? this.timestamp,
      status: status ?? this.status,
      isDeleted: isDeleted ?? this.isDeleted,
      reactions: reactions ?? this.reactions,
    );
  }
  

}
