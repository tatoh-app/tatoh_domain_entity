import 'simple_contact_model.dart'; // Importa o modelo filho
import '../../../domain/contact/entities/list_contacts_entity.dart';

/// Modelo (DTO) para serialização/deserialização e transferência de dados de ListContactsEntity.
/// Reside na camada de Dados.
class ListContactsModel {
  /// Lista de contatos (como modelos)
  final List<SimpleContactModel>? contacts;

  /// Construtor
  ListContactsModel({
    this.contacts,
  });

  /// Cria um modelo a partir de um Map (JSON)
  factory ListContactsModel.fromJson(Map<String, dynamic> json) {
    return ListContactsModel(
      contacts: json['contacts'] != null
          ? (json['contacts'] as List)
              .map((e) => SimpleContactModel.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'contacts': contacts?.map((e) => e.toJson()).toList(),
    };
  }

  /// Cria um modelo a partir de uma entidade do domínio
  factory ListContactsModel.fromEntity(ListContactsEntity entity) {
    return ListContactsModel(
      contacts: entity.contacts
          ?.map((e) => SimpleContactModel.fromEntity(e))
          .toList(),
    );
  }

  /// Converte o modelo (DTO) para uma entidade do domínio
  ListContactsEntity toEntity() {
    return ListContactsEntity(
      contacts: contacts?.map((e) => e.toEntity()).toList(),
    );
  }
}
