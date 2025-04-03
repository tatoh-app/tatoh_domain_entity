import '../../../domain/card/entities/response_get_download_url_entity.dart';

/// Modelo (DTO) para serialização/deserialização e transferência de dados de ResponseGetDownloadUrlEntity.
/// Reside na camada de Dados.
class ResponseGetDownloadUrlModel {
  /// URL de download
  final String? downloadUrl;

  /// Construtor
  ResponseGetDownloadUrlModel({
    this.downloadUrl,
  });

  /// Cria um modelo a partir de um Map (JSON)
  factory ResponseGetDownloadUrlModel.fromJson(Map<String, dynamic> json) {
    // Adapte a chave JSON conforme necessário (e.g., 'download_url')
    return ResponseGetDownloadUrlModel(
      downloadUrl: json['download_url'] as String?, // Exemplo de chave JSON
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    // Adapte a chave JSON conforme necessário
    return {
      'download_url': downloadUrl, // Exemplo de chave JSON
    };
  }

  /// Cria um modelo a partir de uma entidade do domínio
  factory ResponseGetDownloadUrlModel.fromEntity(ResponseGetDownloadUrlEntity entity) {
    return ResponseGetDownloadUrlModel(
      downloadUrl: entity.downloadUrl,
    );
  }

  /// Converte o modelo (DTO) para uma entidade do domínio
  ResponseGetDownloadUrlEntity toEntity() {
    return ResponseGetDownloadUrlEntity(
      downloadUrl: downloadUrl,
    );
  }
}
