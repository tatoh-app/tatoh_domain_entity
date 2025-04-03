import 'feed_item_model.dart'; // Importa o modelo filho
import '../../../domain/feed/entities/feed_entity.dart'; // Importa as entidades

/// Modelo (DTO) para serialização/deserialização e transferência de dados de FeedEntity.
/// Reside na camada de Dados.
class FeedModel {
  /// Lista de itens do feed (como modelos)
  final List<FeedItemModel> feed;

  /// Construtor
  FeedModel({
    required this.feed,
  });

  /// Cria um modelo a partir de um Map (JSON)
  /// Assume que o JSON raiz é uma lista de itens do feed.
  factory FeedModel.fromJson(List<dynamic> jsonList) {
    return FeedModel(
      feed: jsonList
          .map((e) => FeedItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
  
  /// Cria um modelo a partir de um Map (JSON) que contém uma chave 'feed'.
  /// Use este se o JSON for como {'feed': [...]}
  factory FeedModel.fromJsonMap(Map<String, dynamic> jsonMap) {
     return FeedModel(
      feed: (jsonMap['feed'] as List<dynamic>)
          .map((e) => FeedItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// Converte o modelo para uma Lista JSON (adequado se a API espera uma lista)
  List<Map<String, dynamic>> toJsonList() {
    return feed.map((e) => e.toJson()).toList();
  }
  
  /// Converte o modelo para um Map JSON (adequado se a API espera um objeto com a chave 'feed')
  Map<String, dynamic> toJsonMap() {
    return {
      'feed': feed.map((e) => e.toJson()).toList(),
    };
  }


  /// Cria um modelo a partir de uma entidade do domínio
  factory FeedModel.fromEntity(FeedEntity entity) {
    return FeedModel(
      feed: entity.feed.map((e) => FeedItemModel.fromEntity(e)).toList(),
    );
  }

  /// Converte o modelo (DTO) para uma entidade do domínio
  FeedEntity toEntity() {
    return FeedEntity(
      feed: feed.map((e) => e.toEntity()).toList(),
    );
  }
}
