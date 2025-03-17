import '../entities/link_entity.dart';

/// Modelo para serialização/deserialização de links
class LinkModel extends LinkEntity {
  /// Construtor
  LinkModel({
    int? id,
    int? profileId,
    String? title,
    String? url,
    String? icon,
    int? order,
  }) : super(
          id: id,
          profileId: profileId,
          title: title,
          url: url,
          icon: icon,
          order: order,
        );
  
  /// Cria um modelo a partir de um Map (JSON)
  factory LinkModel.fromJson(Map<String, dynamic> json) {
    return LinkModel(
      id: json['id'] as int?,
      profileId: json['profile_id'] as int?,
      title: json['title'] as String?,
      url: json['url'] as String?,
      icon: json['icon'] as String?,
      order: json['order'] as int?,
    );
  }
  
  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'profile_id': profileId,
      'title': title,
      'url': url,
      'icon': icon,
      'order': order,
    };
  }
  
  /// Cria um modelo a partir de uma entidade
  factory LinkModel.fromEntity(LinkEntity entity) {
    return LinkModel(
      id: entity.id,
      profileId: entity.profileId,
      title: entity.title,
      url: entity.url,
      icon: entity.icon,
      order: entity.order,
    );
  }
}
