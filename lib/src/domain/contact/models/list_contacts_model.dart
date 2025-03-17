import '../entities/list_contacts_entity.dart';
import '../entities/simple_contact_entity.dart';
import 'simple_contact_model.dart';

/// Modelo para serialização/deserialização de ListContactsEntity
class ListContactsModel extends ListContactsEntity {
  /// Construtor
  ListContactsModel({
    List<SimpleContactEntity>? contacts,
  }) : super(
          contacts: contacts,
        );

  /// Cria um modelo a partir de um Map (JSON)
  factory ListContactsModel.fromJson(Map<String, dynamic> json) {
    return ListContactsModel(
      contacts: json['contacts'] == null
          ? null
          : (json['contacts'] as List<dynamic>)
              .map((e) => SimpleContactModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'contacts': contacts?.map((e) {
        if (e is SimpleContactModel) {
          return e.toJson();
        } else {
          return SimpleContactModel.fromEntity(e).toJson();
        }
      }).toList(),
    };
  }

  /// Cria um modelo a partir de uma entidade
  factory ListContactsModel.fromEntity(ListContactsEntity entity) {
    return ListContactsModel(
      contacts: entity.contacts,
    );
  }
}
