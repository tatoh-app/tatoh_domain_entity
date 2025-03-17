



/// Entidade que representa um item individual do feed
class FeedItemEntity {
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
  const FeedItemEntity({
    required this.description,
    required this.title,
    this.local,
    this.urlLink,
    this.urlImage,
  });
  
  /// Cria uma cópia da entidade com alguns campos alterados
  FeedItemEntity copyWith({
    String? description,
    String? title,
    String? local,
    String? urlLink,
    String? urlImage,
  }) {
    return FeedItemEntity(
      description: description ?? this.description,
      title: title ?? this.title,
      local: local ?? this.local,
      urlLink: urlLink ?? this.urlLink,
      urlImage: urlImage ?? this.urlImage,
    );
  }
  
  /// Factory para criar a entidade a partir de valores primitivos
  factory FeedItemEntity.fromPrimitives({
    required String description,
    required String title,
    String? local,
    String? urlLink,
    String? urlImage,
  }) {
    return FeedItemEntity(
      description: description,
      title: title,
      local: local,
      urlLink: urlLink,
      urlImage: urlImage,
    );
  }
  

}

/// Entidade que representa uma coleção de itens do feed
class FeedEntity {
  /// Lista de itens do feed
  final List<FeedItemEntity> feed;

  /// Construtor
  const FeedEntity({
    required this.feed,
  });
  
  /// Construtor para criar uma entidade vazia
  const FeedEntity.empty() : feed = const [];
  
  /// Verifica se o feed está vazio
  bool get isEmpty => feed.isEmpty;
  
  /// Verifica se o feed não está vazio
  bool get isNotEmpty => feed.isNotEmpty;
  
  /// Cria uma cópia da entidade com alguns campos alterados
  FeedEntity copyWith({
    List<FeedItemEntity>? feed,
  }) {
    return FeedEntity(
      feed: feed ?? this.feed,
    );
  }
  
  /// Adiciona um item ao feed
  FeedEntity addItem(FeedItemEntity item) {
    return FeedEntity(
      feed: [...feed, item],
    );
  }
  

}
