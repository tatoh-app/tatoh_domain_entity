import '../../../domain/media/entities/media_entity.dart';

/// Converte uma String para MediaType, com fallback para other.
MediaType _mediaTypeFromString(String? type) {
  switch (type?.toLowerCase()) {
    case 'image':
      return MediaType.image;
    case 'video':
      return MediaType.video;
    case 'audio':
      return MediaType.audio;
    case 'document':
      return MediaType.document;
    default:
      return MediaType.other;
  }
}

/// Converte MediaType para String.
String _mediaTypeToString(MediaType type) {
  return type.toString().split('.').last;
}

/// Modelo (DTO) para serialização/deserialização e transferência de dados de MediaEntity.
/// Reside na camada de Dados.
class MediaModel {
  /// ID único da mídia
  final String id;

  /// Nome do arquivo
  final String fileName;

  /// Tipo de mídia (como String para JSON)
  final String type;

  /// URL para acessar a mídia
  final String url;

  /// URL para acessar a miniatura da mídia (pode ser nulo)
  final String? thumbnailUrl;

  /// Tamanho do arquivo em bytes
  final int size;

  /// Tipo MIME do arquivo
  final String mimeType;

  /// Duração em segundos (pode ser nulo)
  final double? duration;

  /// Largura em pixels (pode ser nulo)
  final int? width;

  /// Altura em pixels (pode ser nulo)
  final int? height;

  /// ID do usuário que fez o upload da mídia
  final String uploadedBy;

  /// Data e hora do upload (como DateTime)
  final DateTime uploadedAt;

  /// Metadados adicionais (Map<String, dynamic>)
  final Map<String, dynamic>? metadata;

  /// Construtor
  MediaModel({
    required this.id,
    required this.fileName,
    required this.type,
    required this.url,
    this.thumbnailUrl,
    required this.size,
    required this.mimeType,
    this.duration,
    this.width,
    this.height,
    required this.uploadedBy,
    required this.uploadedAt,
    this.metadata,
  });

  /// Cria um modelo a partir de um Map (JSON)
  factory MediaModel.fromJson(Map<String, dynamic> json) {
    // Adapte as chaves JSON conforme necessário
    return MediaModel(
      id: json['id'] as String,
      fileName: json['file_name'] as String, // Exemplo
      type: json['type'] as String, // Assume que o tipo vem como String
      url: json['url'] as String,
      thumbnailUrl: json['thumbnail_url'] as String?, // Exemplo
      size: json['size'] as int,
      mimeType: json['mime_type'] as String, // Exemplo
      duration: (json['duration'] as num?)?.toDouble(),
      width: json['width'] as int?,
      height: json['height'] as int?,
      uploadedBy: json['uploaded_by'] as String, // Exemplo
      uploadedAt: DateTime.parse(json['uploaded_at'] as String), // Exemplo
      metadata: json['metadata'] as Map<String, dynamic>?,
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    // Adapte as chaves JSON conforme necessário
    return {
      'id': id,
      'file_name': fileName, // Exemplo
      'type': type,
      'url': url,
      'thumbnail_url': thumbnailUrl, // Exemplo
      'size': size,
      'mime_type': mimeType, // Exemplo
      'duration': duration,
      'width': width,
      'height': height,
      'uploaded_by': uploadedBy, // Exemplo
      'uploaded_at': uploadedAt.toIso8601String(), // Exemplo
      'metadata': metadata,
    };
  }

  /// Cria um modelo a partir de uma entidade do domínio
  factory MediaModel.fromEntity(MediaEntity entity) {
    return MediaModel(
      id: entity.id,
      fileName: entity.fileName,
      type: _mediaTypeToString(entity.type), // Converte enum para String
      url: entity.url,
      thumbnailUrl: entity.thumbnailUrl,
      size: entity.size,
      mimeType: entity.mimeType,
      duration: entity.duration,
      width: entity.width,
      height: entity.height,
      uploadedBy: entity.uploadedBy,
      uploadedAt: entity.uploadedAt,
      metadata: entity.metadata,
    );
  }

  /// Converte o modelo (DTO) para uma entidade do domínio
  MediaEntity toEntity() {
    return MediaEntity(
      id: id,
      fileName: fileName,
      type: _mediaTypeFromString(type), // Converte String para enum
      url: url,
      thumbnailUrl: thumbnailUrl,
      size: size,
      mimeType: mimeType,
      duration: duration,
      width: width,
      height: height,
      uploadedBy: uploadedBy,
      uploadedAt: uploadedAt,
      metadata: metadata,
    );
  }
}
