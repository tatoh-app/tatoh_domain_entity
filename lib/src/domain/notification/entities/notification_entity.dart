

/// Tipos de notificação
enum NotificationType {
  system,
  message,
  contact,
  card,
  event,
  reminder,
  other
}

/// Entidade que representa uma notificação no sistema
class NotificationEntity {
  /// ID único da notificação
  final String id;
  
  /// ID do usuário destinatário da notificação
  final String userId;
  
  /// Título da notificação
  final String title;
  
  /// Corpo ou conteúdo da notificação
  final String body;
  
  /// Tipo da notificação
  final NotificationType type;
  
  /// Dados adicionais específicos do tipo de notificação
  final Map<String, dynamic>? data;
  
  /// Data e hora em que a notificação foi criada
  final DateTime timestamp;
  
  /// Indica se a notificação foi lida
  final bool isRead;
  
  /// Indica se a notificação foi excluída
  final bool isDeleted;
  
  /// URL da imagem associada à notificação (opcional)
  final String? imageUrl;
  
  /// Ação a ser executada ao tocar na notificação (ex: deeplink)
  final String? action;
  
  /// Construtor
  const NotificationEntity({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
    required this.type,
    this.data,
    required this.timestamp,
    this.isRead = false,
    this.isDeleted = false,
    this.imageUrl,
    this.action,
  });
  
  /// Cria uma cópia da entidade com alguns campos alterados
  NotificationEntity copyWith({
    String? id,
    String? userId,
    String? title,
    String? body,
    NotificationType? type,
    Map<String, dynamic>? data,
    DateTime? timestamp,
    bool? isRead,
    bool? isDeleted,
    String? imageUrl,
    String? action,
  }) {
    return NotificationEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      body: body ?? this.body,
      type: type ?? this.type,
      data: data ?? this.data,
      timestamp: timestamp ?? this.timestamp,
      isRead: isRead ?? this.isRead,
      isDeleted: isDeleted ?? this.isDeleted,
      imageUrl: imageUrl ?? this.imageUrl,
      action: action ?? this.action,
    );
  }
  

}
