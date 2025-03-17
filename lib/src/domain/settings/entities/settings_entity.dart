

/// Temas disponíveis no aplicativo
enum AppTheme {
  system,
  light,
  dark
}

/// Idiomas suportados pelo aplicativo
enum AppLanguage {
  systemDefault,
  english,
  portuguese,
  spanish,
  french,
  german
}

/// Entidade que representa as configurações do usuário
class SettingsEntity {
  /// ID do usuário
  final String userId;
  
  /// Tema selecionado
  final AppTheme theme;
  
  /// Idioma selecionado
  final AppLanguage language;
  
  /// Notificações push habilitadas
  final bool pushNotificationsEnabled;
  
  /// Notificações de mensagens habilitadas
  final bool messageNotificationsEnabled;
  
  /// Notificações de contatos habilitadas
  final bool contactNotificationsEnabled;
  
  /// Sons de notificação habilitados
  final bool notificationSoundsEnabled;
  
  /// Vibração de notificação habilitada
  final bool notificationVibrationEnabled;
  
  /// Mostrar prévia de mensagens nas notificações
  final bool showMessagePreviewInNotifications;
  
  /// Backup automático habilitado
  final bool autoBackupEnabled;
  
  /// Frequência de backup automático (em dias)
  final int autoBackupFrequencyDays;
  
  /// Data do último backup
  final DateTime? lastBackupDate;
  
  /// Configurações de privacidade
  final Map<String, bool>? privacySettings;
  
  /// Configurações adicionais específicas do aplicativo
  final Map<String, dynamic>? additionalSettings;
  
  /// Construtor
  const SettingsEntity({
    required this.userId,
    this.theme = AppTheme.system,
    this.language = AppLanguage.systemDefault,
    this.pushNotificationsEnabled = true,
    this.messageNotificationsEnabled = true,
    this.contactNotificationsEnabled = true,
    this.notificationSoundsEnabled = true,
    this.notificationVibrationEnabled = true,
    this.showMessagePreviewInNotifications = true,
    this.autoBackupEnabled = false,
    this.autoBackupFrequencyDays = 7,
    this.lastBackupDate,
    this.privacySettings,
    this.additionalSettings,
  });
  
  /// Cria uma cópia da entidade com alguns campos alterados
  SettingsEntity copyWith({
    String? userId,
    AppTheme? theme,
    AppLanguage? language,
    bool? pushNotificationsEnabled,
    bool? messageNotificationsEnabled,
    bool? contactNotificationsEnabled,
    bool? notificationSoundsEnabled,
    bool? notificationVibrationEnabled,
    bool? showMessagePreviewInNotifications,
    bool? autoBackupEnabled,
    int? autoBackupFrequencyDays,
    DateTime? lastBackupDate,
    Map<String, bool>? privacySettings,
    Map<String, dynamic>? additionalSettings,
  }) {
    return SettingsEntity(
      userId: userId ?? this.userId,
      theme: theme ?? this.theme,
      language: language ?? this.language,
      pushNotificationsEnabled: pushNotificationsEnabled ?? this.pushNotificationsEnabled,
      messageNotificationsEnabled: messageNotificationsEnabled ?? this.messageNotificationsEnabled,
      contactNotificationsEnabled: contactNotificationsEnabled ?? this.contactNotificationsEnabled,
      notificationSoundsEnabled: notificationSoundsEnabled ?? this.notificationSoundsEnabled,
      notificationVibrationEnabled: notificationVibrationEnabled ?? this.notificationVibrationEnabled,
      showMessagePreviewInNotifications: showMessagePreviewInNotifications ?? this.showMessagePreviewInNotifications,
      autoBackupEnabled: autoBackupEnabled ?? this.autoBackupEnabled,
      autoBackupFrequencyDays: autoBackupFrequencyDays ?? this.autoBackupFrequencyDays,
      lastBackupDate: lastBackupDate ?? this.lastBackupDate,
      privacySettings: privacySettings ?? this.privacySettings,
      additionalSettings: additionalSettings ?? this.additionalSettings,
    );
  }
  

}
