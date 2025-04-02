import 'feed_item_model.dart'; // Importa o FeedItemModel refatorado
import '../../../domain/feed/entities/feed_entity.dart'; // Importa FeedEntity e FeedItemEntity

/// Modelo (DTO) para serialização/deserialização de uma coleção de itens do feed.
/// Reside na camada de Dados.
class FeedModel {
  /// Lista de itens do feed (como modelos)
  final List<FeedItemModel> feed;

  /// Construtor
  FeedModel({
    required this.feed,
  });

  /// Cria um modelo a partir de um Map (JSON)
  factory FeedModel.fromJson(Map<String, dynamic> json) {
    // TODO: Considerar adicionar validações ou tratamento de nulos mais robusto
    var feedList = <FeedItemModel>[];
    if (json['feed'] != null && json['feed'] is List) {
      feedList = (json['feed'] as List)
          .map((itemJson) => FeedItemModel.fromJson(itemJson as Map<String, dynamic>))
          .toList();
    }
    return FeedModel(
      feed: feedList,
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      // Mapeia cada FeedItemModel para seu JSON correspondente
      'feed': feed.map((itemModel) => itemModel.toJson()).toList(),
    };
  }

  /// Cria um modelo a partir de uma entidade do domínio
  factory FeedModel.fromEntity(FeedEntity entity) {
    return FeedModel(
      // Mapeia cada FeedItemEntity para um FeedItemModel
      feed: entity.feed.map((itemEntity) => FeedItemModel.fromEntity(itemEntity)).toList(),
    );
  }

  /// Converte o modelo (DTO) para uma entidade do domínio
  FeedEntity toEntity() {
    return FeedEntity(
      // Mapeia cada FeedItemModel para uma FeedItemEntity
      feed: feed.map((itemModel) => itemModel.toEntity()).toList(),
    );
  }
}