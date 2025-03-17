import '../entities/feed_entity.dart';

/// Modelo para serialização/deserialização de itens do feed
class FeedItemModel extends FeedItemEntity {
  /// Construtor
  FeedItemModel({
    required String description,
    required String title,
    String? local,
    String? urlLink,
    String? urlImage,
  }) : super(
          description: description,
          title: title,
          local: local,
          urlLink: urlLink,
          urlImage: urlImage,
        );
  
  /// Cria um modelo a partir de um Map (JSON)
  factory FeedItemModel.fromJson(Map<String, dynamic> json) {
    return FeedItemModel(
      description: json['description'] as String,
      title: json['title'] as String,
      local: json['local'] as String?,
      urlLink: json['url_link'] as String?,
      urlImage: json['url_image'] as String?,
    );
  }
  
  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'title': title,
      'local': local,
      'url_link': urlLink,
      'url_image': urlImage,
    };
  }
  
  /// Cria um modelo a partir de uma entidade
  factory FeedItemModel.fromEntity(FeedItemEntity entity) {
    return FeedItemModel(
      description: entity.description,
      title: entity.title,
      local: entity.local,
      urlLink: entity.urlLink,
      urlImage: entity.urlImage,
    );
  }
}
