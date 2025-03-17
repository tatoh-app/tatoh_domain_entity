/// Entidade que representa um link associado a um perfil
class LinkEntity {
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
  const LinkEntity({
    this.id,
    this.profileId,
    this.title,
    this.url,
    this.icon,
    this.order,
  });
  
  /// Cria uma cópia da entidade com alguns campos alterados
  LinkEntity copyWith({
    int? id,
    int? profileId,
    String? title,
    String? url,
    String? icon,
    int? order,
  }) {
    return LinkEntity(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      title: title ?? this.title,
      url: url ?? this.url,
      icon: icon ?? this.icon,
      order: order ?? this.order,
    );
  }
}
