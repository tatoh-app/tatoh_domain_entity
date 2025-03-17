

/// Entidade que representa uma resposta contendo uma URL de download
class ResponseGetDownloadUrlEntity {
  /// URL de download
  final String? downloadUrl;

  /// Construtor
  const ResponseGetDownloadUrlEntity({
    this.downloadUrl,
  });
  
  /// Cria uma cópia da entidade com alguns campos alterados
  ResponseGetDownloadUrlEntity copyWith({
    String? downloadUrl,
  }) {
    return ResponseGetDownloadUrlEntity(
      downloadUrl: downloadUrl ?? this.downloadUrl,
    );
  }
  

}
