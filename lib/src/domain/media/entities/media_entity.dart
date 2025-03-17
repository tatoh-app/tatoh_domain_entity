


/// Tipos de mídia
enum MediaType {
  image,
  video,
  audio,
  document,
  other
}

/// Entidade que representa um arquivo de mídia no sistema
class MediaEntity {
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
  const MediaEntity({
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
  
  /// Cria uma cópia da entidade com alguns campos alterados
  MediaEntity copyWith({
    String? id,
    String? fileName,
    MediaType? type,
    String? url,
    String? thumbnailUrl,
    int? size,
    String? mimeType,
    double? duration,
    int? width,
    int? height,
    String? uploadedBy,
    DateTime? uploadedAt,
    Map<String, dynamic>? metadata,
  }) {
    return MediaEntity(
      id: id ?? this.id,
      fileName: fileName ?? this.fileName,
      type: type ?? this.type,
      url: url ?? this.url,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      size: size ?? this.size,
      mimeType: mimeType ?? this.mimeType,
      duration: duration ?? this.duration,
      width: width ?? this.width,
      height: height ?? this.height,
      uploadedBy: uploadedBy ?? this.uploadedBy,
      uploadedAt: uploadedAt ?? this.uploadedAt,
      metadata: metadata ?? this.metadata,
    );
  }
  

}
