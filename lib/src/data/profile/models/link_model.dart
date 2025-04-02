import '../../../domain/profile/entities/link_entity.dart'; // Importa LinkEntity

/// Modelo (DTO) para serialização/deserialização e transferência de dados de LinkEntity.
/// Reside na camada de Dados.
class LinkModel {
  /// ID do link
  final int? id;

  /// ID do perfil associado ao link
  final int? profileId;

  /// Título do link
  final String? title;

  /// URL do link
  final String? url;

  /// Ícone do link
  final String? icon;

  /// Ordem de exibição do link
  final int? order;

  /// Construtor
  LinkModel({
    this.id,
    this.profileId,
    this.title,
    this.url,
    this.icon,
    this.order,
  });

  /// Cria um modelo a partir de um Map (JSON)
  factory LinkModel.fromJson(Map<String, dynamic> json) {
    // TODO: Considerar adicionar validações ou tratamento de nulos mais robusto
    return LinkModel(
      id: json['id'] as int?,
      profileId: json['profile_id'] as int?, // Chave JSON específica
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
      'profile_id': profileId, // Chave JSON específica
      'title': title,
      'url': url,
      'icon': icon,
      'order': order,
    };
  }

  /// Cria um modelo a partir de uma entidade do domínio
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

  /// Converte o modelo (DTO) para uma entidade do domínio
  LinkEntity toEntity() {
    return LinkEntity(
      id: id,
      profileId: profileId,
      title: title,
      url: url,
      icon: icon,
      order: order,
    );
  }
}