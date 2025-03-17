import '../entities/feed_entity.dart';
import 'feed_item_model.dart';

/// Modelo para serialização/deserialização de feeds
class FeedModel extends FeedEntity {
  /// Construtor
  FeedModel({
    required List<FeedItemEntity> feed,
  }) : super(feed: feed);
  
  /// Cria um modelo a partir de um Map (JSON)
  factory FeedModel.fromJson(Map<String, dynamic> json) {
    return FeedModel(
      feed: (json['feed'] as List)
          .map((e) => FeedItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
  
  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'feed': feed.map((e) {
        if (e is FeedItemModel) {
          return e.toJson();
        }
        return FeedItemModel.fromEntity(e).toJson();
      }).toList(),
    };
  }
  
  /// Cria um modelo a partir de uma entidade
  factory FeedModel.fromEntity(FeedEntity entity) {
    return FeedModel(
      feed: entity.feed,
    );
  }
}
