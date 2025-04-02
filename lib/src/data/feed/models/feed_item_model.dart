import '../../../domain/feed/entities/feed_entity.dart'; // Importa FeedItemEntity

/// Modelo (DTO) para serialização/deserialização de itens individuais do feed.
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
    // TODO: Considerar adicionar validações ou tratamento de nulos mais robusto
    return FeedItemModel(
      description: json['description'] as String,
      title: json['title'] as String,
      local: json['local'] as String?,
      urlLink: json['url_link'] as String?, // Mantém a chave JSON original
      urlImage: json['url_image'] as String?, // Mantém a chave JSON original
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'title': title,
      'local': local,
      'url_link': urlLink, // Mantém a chave JSON original
      'url_image': urlImage, // Mantém a chave JSON original
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