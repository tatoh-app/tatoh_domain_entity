import '../../../domain/contact/entities/contact_entity.dart'; // Importa a entidade do domínio

/// Modelo (DTO) para serialização/deserialização e transferência de dados de ContactEntity.
/// Reside na camada de Dados.
class ContactModel {
  final int id;
  final int ownerId;
  final int contactId;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// Construtor
  ContactModel({
    required this.id,
    required this.ownerId,
    required this.contactId,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Cria um modelo a partir de um Map (JSON)
  factory ContactModel.fromJson(Map<String, dynamic> json) {
    // TODO: Considerar adicionar validações ou tratamento de nulos mais robusto
    return ContactModel(
      id: json['id'] as int, // Assumindo que 'id' sempre existe e é int
      ownerId: json['owner_id'] as int, // Assumindo snake_case e int
      contactId: json['contact_id'] as int, // Assumindo snake_case e int
      createdAt: DateTime.parse(json['created_at'] as String), // Assumindo string ISO 8601
      updatedAt: DateTime.parse(json['updated_at'] as String), // Assumindo string ISO 8601
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'owner_id': ownerId,
      'contact_id': contactId,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  /// Cria um modelo a partir de uma entidade do domínio
  factory ContactModel.fromEntity(ContactEntity entity) {
    return ContactModel(
      id: entity.id,
      ownerId: entity.ownerId,
      contactId: entity.contactId,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  /// Converte o modelo (DTO) para uma entidade do domínio
  ContactEntity toEntity() {
    return ContactEntity(
      id: id,
      ownerId: ownerId,
      contactId: contactId,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
