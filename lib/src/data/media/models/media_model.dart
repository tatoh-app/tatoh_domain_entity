import '../../../domain/media/entities/media_entity.dart'; // Importa MediaEntity e MediaType

/// Modelo (DTO) para serialização/deserialização e transferência de dados de MediaEntity.
/// Reside na camada de Dados.
class MediaModel {
  /// ID único da mídia
  final String id;

  /// Nome do arquivo
  final String fileName;

  /// Tipo de mídia
  final MediaType type;

  /// URL para acessar a mídia
  final String url;

  /// URL para acessar a miniatura da mídia (para imagens e vídeos)
  final String? thumbnailUrl;

  /// Tamanho do arquivo em bytes
  final int size;

  /// Tipo MIME do arquivo
  final String mimeType;

  /// Duração em segundos (para áudio e vídeo)
  final double? duration;

  /// Largura em pixels (para imagens e vídeos)
  final int? width;

  /// Altura em pixels (para imagens e vídeos)
  final int? height;

  /// ID do usuário que fez o upload da mídia
  final String uploadedBy;

  /// Data e hora do upload
  final DateTime uploadedAt;

  /// Metadados adicionais específicos do tipo de mídia
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
    // TODO: Considerar adicionar validações ou tratamento de nulos mais robusto
    return MediaModel(
      id: json['id'] as String,
      fileName: json['fileName'] as String,
      type: _mediaTypeFromJson(json['type']), // Usa a função auxiliar
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      size: json['size'] as int,
      mimeType: json['mimeType'] as String,
      duration: (json['duration'] as num?)?.toDouble(), // Converte num? para double?
      width: json['width'] as int?,
      height: json['height'] as int?,
      uploadedBy: json['uploadedBy'] as String,
      uploadedAt: DateTime.parse(json['uploadedAt'] as String),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fileName': fileName,
      'type': type.index, // Converte enum para int (índice)
      'url': url,
      'thumbnailUrl': thumbnailUrl,
      'size': size,
      'mimeType': mimeType,
      'duration': duration,
      'width': width,
      'height': height,
      'uploadedBy': uploadedBy,
      'uploadedAt': uploadedAt.toIso8601String(), // Converte DateTime para String ISO8601
      'metadata': metadata,
    };
  }

  /// Cria um modelo a partir de uma entidade do domínio
  factory MediaModel.fromEntity(MediaEntity entity) {
    return MediaModel(
      id: entity.id,
      fileName: entity.fileName,
      type: entity.type,
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
      type: type,
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

  /// Função auxiliar estática para converter JSON para MediaType
  static MediaType _mediaTypeFromJson(dynamic json) {
    if (json is int && json >= 0 && json < MediaType.values.length) {
      return MediaType.values[json];
    }
    // Retorna um valor padrão ou lança um erro se a conversão falhar
    return MediaType.other;
  }
}