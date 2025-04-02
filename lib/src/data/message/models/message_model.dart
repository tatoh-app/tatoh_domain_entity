import '../../../domain/message/entities/message_entity.dart'; // Importa MessageEntity e os Enums

/// Modelo (DTO) para serialização/deserialização e transferência de dados de MessageEntity.
/// Reside na camada de Dados.
class MessageModel {
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
  MessageModel({
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

  /// Cria um modelo a partir de um Map (JSON)
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    // TODO: Considerar adicionar validações ou tratamento de nulos mais robusto
    return MessageModel(
      id: json['id'] as String,
      conversationId: json['conversationId'] as String,
      senderId: json['senderId'] as String,
      type: _messageTypeFromJson(json['type']), // Usa a função auxiliar
      content: json['content'] as String,
      metadata: json['metadata'] as Map<String, dynamic>?,
      timestamp: DateTime.parse(json['timestamp'] as String),
      status: _messageStatusFromJson(json['status']), // Usa a função auxiliar
      isDeleted: json['isDeleted'] as bool? ?? false,
      reactions: json['reactions'] != null
          ? (json['reactions'] as Map<String, dynamic>).map(
              (k, v) => MapEntry(
                k,
                (v as List<dynamic>).cast<String>(), // Garante que a lista é de Strings
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
      'type': type.index, // Converte enum para int (índice)
      'content': content,
      'metadata': metadata,
      'timestamp': timestamp.toIso8601String(), // Converte DateTime para String ISO8601
      'status': status.index, // Converte enum para int (índice)
      'isDeleted': isDeleted,
      'reactions': reactions,
    };
  }

  /// Cria um modelo a partir de uma entidade do domínio
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

  /// Converte o modelo (DTO) para uma entidade do domínio
  MessageEntity toEntity() {
    return MessageEntity(
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
  }

  /// Função auxiliar estática para converter JSON para MessageType
  static MessageType _messageTypeFromJson(dynamic json) {
    if (json is int && json >= 0 && json < MessageType.values.length) {
      return MessageType.values[json];
    }
    // Retorna um valor padrão ou lança um erro se a conversão falhar
    return MessageType.text; // Valor padrão
  }

  /// Função auxiliar estática para converter JSON para MessageStatus
  static MessageStatus _messageStatusFromJson(dynamic json) {
    if (json is int && json >= 0 && json < MessageStatus.values.length) {
      return MessageStatus.values[json];
    }
    // Retorna um valor padrão ou lança um erro se a conversão falhar
    return MessageStatus.sent; // Valor padrão
  }
}