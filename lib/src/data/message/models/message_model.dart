<<<<<<< HEAD
import '../../../domain/message/entities/message_entity.dart'; // Importa MessageEntity e os Enums
=======
import '../../../domain/message/entities/message_entity.dart';

/// Converte uma String para MessageType, com fallback para text.
MessageType _messageTypeFromString(String? type) {
  switch (type?.toLowerCase()) {
    case 'image':
      return MessageType.image;
    case 'video':
      return MessageType.video;
    case 'audio':
      return MessageType.audio;
    case 'file':
      return MessageType.file;
    case 'location':
      return MessageType.location;
    case 'contact':
      return MessageType.contact;
    case 'system':
      return MessageType.system;
    case 'text':
    default:
      return MessageType.text;
  }
}

/// Converte MessageType para String.
String _messageTypeToString(MessageType type) {
  return type.toString().split('.').last;
}

/// Converte uma String para MessageStatus, com fallback para failed.
MessageStatus _messageStatusFromString(String? status) {
  switch (status?.toLowerCase()) {
    case 'sending':
      return MessageStatus.sending;
    case 'sent':
      return MessageStatus.sent;
    case 'delivered':
      return MessageStatus.delivered;
    case 'read':
      return MessageStatus.read;
    case 'failed':
    default:
      return MessageStatus.failed;
  }
}

/// Converte MessageStatus para String.
String _messageStatusToString(MessageStatus status) {
  return status.toString().split('.').last;
}

>>>>>>> develop

/// Modelo (DTO) para serialização/deserialização e transferência de dados de MessageEntity.
/// Reside na camada de Dados.
class MessageModel {
  /// ID único da mensagem
  final String id;

  /// ID da conversa a que esta mensagem pertence
  final String conversationId;

  /// ID do remetente da mensagem
  final String senderId;

<<<<<<< HEAD
  /// Tipo da mensagem
  final MessageType type;
=======
  /// Tipo da mensagem (como String para JSON)
  final String type;
>>>>>>> develop

  /// Conteúdo da mensagem (texto, URL de mídia, etc.)
  final String content;

<<<<<<< HEAD
  /// Dados adicionais específicos do tipo de mensagem
=======
  /// Dados adicionais específicos do tipo de mensagem (Map<String, dynamic>)
>>>>>>> develop
  final Map<String, dynamic>? metadata;

  /// Data e hora em que a mensagem foi enviada
  final DateTime timestamp;

<<<<<<< HEAD
  /// Status de entrega da mensagem
  final MessageStatus status;
=======
  /// Status de entrega da mensagem (como String para JSON)
  final String status;
>>>>>>> develop

  /// Indica se a mensagem foi excluída
  final bool isDeleted;

<<<<<<< HEAD
  /// Reações à mensagem (emoji e ID do usuário)
=======
  /// Reações à mensagem (Map<String, List<String>>, pode ser nulo)
>>>>>>> develop
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
<<<<<<< HEAD
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
=======
    // Adapte as chaves JSON conforme necessário
    return MessageModel(
      id: json['id'] as String,
      conversationId: json['conversation_id'] as String, // Exemplo
      senderId: json['sender_id'] as String, // Exemplo
      type: json['type'] as String, // Assume que o tipo vem como String
      content: json['content'] as String,
      metadata: json['metadata'] as Map<String, dynamic>?,
      timestamp: DateTime.parse(json['timestamp'] as String),
      status: json['status'] as String, // Assume que o status vem como String
      isDeleted: json['is_deleted'] as bool? ?? false, // Exemplo
      reactions: (json['reactions'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, List<String>.from(e as List)), // Converte lista interna
      ), // Exemplo
>>>>>>> develop
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
<<<<<<< HEAD
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
=======
    // Adapte as chaves JSON conforme necessário
    return {
      'id': id,
      'conversation_id': conversationId, // Exemplo
      'sender_id': senderId, // Exemplo
      'type': type,
      'content': content,
      'metadata': metadata,
      'timestamp': timestamp.toIso8601String(),
      'status': status,
      'is_deleted': isDeleted, // Exemplo
      'reactions': reactions, // Exemplo
>>>>>>> develop
    };
  }

  /// Cria um modelo a partir de uma entidade do domínio
  factory MessageModel.fromEntity(MessageEntity entity) {
    return MessageModel(
      id: entity.id,
      conversationId: entity.conversationId,
      senderId: entity.senderId,
<<<<<<< HEAD
      type: entity.type,
      content: entity.content,
      metadata: entity.metadata,
      timestamp: entity.timestamp,
      status: entity.status,
=======
      type: _messageTypeToString(entity.type), // Converte enum para String
      content: entity.content,
      metadata: entity.metadata,
      timestamp: entity.timestamp,
      status: _messageStatusToString(entity.status), // Converte enum para String
>>>>>>> develop
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
<<<<<<< HEAD
      type: type,
      content: content,
      metadata: metadata,
      timestamp: timestamp,
      status: status,
=======
      type: _messageTypeFromString(type), // Converte String para enum
      content: content,
      metadata: metadata,
      timestamp: timestamp,
      status: _messageStatusFromString(status), // Converte String para enum
>>>>>>> develop
      isDeleted: isDeleted,
      reactions: reactions,
    );
  }
<<<<<<< HEAD

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
=======
}
>>>>>>> develop
