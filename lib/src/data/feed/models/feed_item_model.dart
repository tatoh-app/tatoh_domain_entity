import '../../../domain/feed/entities/feed_entity.dart'; // Importa a entidade

/// Modelo (DTO) para serialização/deserialização e transferência de dados de FeedItemEntity.
/// Reside na camada de Dados.
class FeedItemModel {
  /// Descrição do item
  final String description;

  /// Título do item
  final String title;

  /// Localização associada ao item
  final String? local;

  /// URL do link para mais informações
  final String? urlLink;

  /// URL da imagem do item
  final String? urlImage;

  /// Construtor
  FeedItemModel({
    required this.description,
    required this.title,
    this.local,
    this.urlLink,
    this.urlImage,
  });

  /// Cria um modelo a partir de um Map (JSON)
  factory FeedItemModel.fromJson(Map<String, dynamic> json) {
    // Adapte as chaves JSON conforme necessário (e.g., 'url_link', 'url_image')
    return FeedItemModel(
      description: json['description'] as String,
      title: json['title'] as String,
      local: json['local'] as String?,
      urlLink: json['url_link'] as String?, // Exemplo de chave JSON
      urlImage: json['url_image'] as String?, // Exemplo de chave JSON
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    // Adapte as chaves JSON conforme necessário
    return {
      'description': description,
      'title': title,
      'local': local,
      'url_link': urlLink, // Exemplo de chave JSON
      'url_image': urlImage, // Exemplo de chave JSON
    };
  }

  /// Cria um modelo a partir de uma entidade do domínio
  factory FeedItemModel.fromEntity(FeedItemEntity entity) {
    return FeedItemModel(
      description: entity.description,
      title: entity.title,
      local: entity.local,
      urlLink: entity.urlLink,
      urlImage: entity.urlImage,
    );
  }

  /// Converte o modelo (DTO) para uma entidade do domínio
  FeedItemEntity toEntity() {
    return FeedItemEntity(
      description: description,
      title: title,
      local: local,
      urlLink: urlLink,
      urlImage: urlImage,
    );
  }
}
