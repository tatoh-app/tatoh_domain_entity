import '../entities/response_get_download_url_entity.dart';

/// Modelo para serialização/deserialização de ResponseGetDownloadUrlEntity
class ResponseGetDownloadUrlModel extends ResponseGetDownloadUrlEntity {
  /// Construtor
  ResponseGetDownloadUrlModel({
    String? downloadUrl,
  }) : super(
          downloadUrl: downloadUrl,
        );

  /// Cria um modelo a partir de um Map (JSON)
  factory ResponseGetDownloadUrlModel.fromJson(Map<String, dynamic> json) {
    return ResponseGetDownloadUrlModel(
      downloadUrl: json['downloadUrl'] as String?,
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'downloadUrl': downloadUrl,
    };
  }

  /// Cria um modelo a partir de uma entidade
  factory ResponseGetDownloadUrlModel.fromEntity(ResponseGetDownloadUrlEntity entity) {
    return ResponseGetDownloadUrlModel(
      downloadUrl: entity.downloadUrl,
    );
  }
}
