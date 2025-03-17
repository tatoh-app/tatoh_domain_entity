

import 'simple_contact_entity.dart';



/// Entidade que representa uma lista de contatos
class ListContactsEntity {
  /// Lista de contatos
  final List<SimpleContactEntity>? contacts;

  /// Construtor
  const ListContactsEntity({
    this.contacts,
  });
  
  /// Cria uma cópia da entidade com alguns campos alterados
  ListContactsEntity copyWith({
    List<SimpleContactEntity>? contacts,
  }) {
    return ListContactsEntity(
      contacts: contacts ?? this.contacts,
    );
  }
  

}
