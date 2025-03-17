

/// Entidade que representa uma notificação simplificada no sistema
class SimpleNotificationEntity {
  /// ID único da notificação
  final String id;
  
  /// Título da notificação
  final String title;
  
  /// Corpo ou conteúdo da notificação
  final String body;
  
  /// Tipo da notificação
  final String? type;
  
  /// Dados adicionais específicos do tipo de notificação
  final Map<String, dynamic>? data;
  
  /// Data e hora em que a notificação foi criada
  final DateTime time;
  
  /// Indica se a notificação foi lida
  final bool read;
  
  /// Indica se a notificação foi excluída
  final bool deleted;

  /// Construtor
  const SimpleNotificationEntity({
    required this.id,
    required this.title,
    required this.body,
    this.type,
    this.data,
    required this.time,
    this.read = false,
    this.deleted = false,
  });
  
  /// Cria uma cópia da entidade com alguns campos alterados
  SimpleNotificationEntity copyWith({
    String? id,
    String? title,
    String? body,
    String? type,
    Map<String, dynamic>? data,
    DateTime? time,
    bool? read,
    bool? deleted,
  }) {
    return SimpleNotificationEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      type: type ?? this.type,
      data: data ?? this.data,
      time: time ?? this.time,
      read: read ?? this.read,
      deleted: deleted ?? this.deleted,
    );
  }
  

}
