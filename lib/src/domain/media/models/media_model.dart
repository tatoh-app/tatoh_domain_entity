import '../entities/media_entity.dart';

/// Modelo para serialização/deserialização de MediaEntity
class MediaModel extends MediaEntity {
  /// Construtor
  MediaModel({
    required String id,
    required String fileName,
    required MediaType type,
    required String url,
    String? thumbnailUrl,
    required int size,
    required String mimeType,
    double? duration,
    int? width,
    int? height,
    required String uploadedBy,
    required DateTime uploadedAt,
    Map<String, dynamic>? metadata,
  }) : super(
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

  /// Cria um modelo a partir de um Map (JSON)
  factory MediaModel.fromJson(Map<String, dynamic> json) {
    return MediaModel(
      id: json['id'] as String,
      fileName: json['fileName'] as String,
      type: _mediaTypeFromJson(json['type']),
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      size: json['size'] as int,
      mimeType: json['mimeType'] as String,
      duration: json['duration'] as double?,
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
      'type': type.index,
      'url': url,
      'thumbnailUrl': thumbnailUrl,
      'size': size,
      'mimeType': mimeType,
      'duration': duration,
      'width': width,
      'height': height,
      'uploadedBy': uploadedBy,
      'uploadedAt': uploadedAt.toIso8601String(),
      'metadata': metadata,
    };
  }

  /// Cria um modelo a partir de uma entidade
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

  /// Converte um inteiro para MediaType
  static MediaType _mediaTypeFromJson(dynamic json) {
    if (json is int && json >= 0 && json < MediaType.values.length) {
      return MediaType.values[json];
    }
    return MediaType.other;
  }
}
