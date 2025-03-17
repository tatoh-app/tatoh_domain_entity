/// Modelo de contato para ser usado no widget ContactsRow
class ContactModel {
  /// Nome do contato
  final String name;
  
  /// URL da foto do contato
  final String photoUrl;
  
  /// Identificador único do contato (slug)
  final String slug;
  
  /// Dados adicionais que podem ser usados pelo aplicativo
  final Map<String, dynamic>? extraData;

  /// Construtor
  ContactModel({
    required this.name,
    required this.photoUrl,
    required this.slug,
    this.extraData,
  });

  /// Cria um modelo a partir de um Map (JSON)
  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      name: json['name'] ?? '',
      photoUrl: json['photoUrl'] ?? '',
      slug: json['slug'] ?? '',
      extraData: json['extraData'],
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'photoUrl': photoUrl,
      'slug': slug,
      if (extraData != null) 'extraData': extraData,
    };
  }
}
