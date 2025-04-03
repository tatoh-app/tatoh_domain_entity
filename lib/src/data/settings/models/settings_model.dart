import '../../../domain/settings/entities/settings_entity.dart';

/// Converte String para AppTheme.
AppTheme _appThemeFromString(String? theme) {
  switch (theme?.toLowerCase()) {
    case 'light':
      return AppTheme.light;
    case 'dark':
      return AppTheme.dark;
    case 'system':
    default:
      return AppTheme.system;
  }
}

/// Converte AppTheme para String.
String _appThemeToString(AppTheme theme) {
  return theme.toString().split('.').last;
}

/// Converte String para AppLanguage.
AppLanguage _appLanguageFromString(String? lang) {
  switch (lang?.toLowerCase()) {
    case 'en': // Assumindo códigos ISO 639-1
    case 'english':
      return AppLanguage.english;
    case 'pt':
    case 'portuguese':
      return AppLanguage.portuguese;
    case 'es':
    case 'spanish':
      return AppLanguage.spanish;
    case 'fr':
    case 'french':
      return AppLanguage.french;
    case 'de':
    case 'german':
      return AppLanguage.german;
    case 'system':
    case 'systemdefault': 
      return AppLanguage.systemDefault;
    default: // Ensure a value is always returned
      return AppLanguage.systemDefault;
  }
}

/// Converte AppLanguage para String (código ISO 639-1 ou 'system').
String _appLanguageToString(AppLanguage lang) {
  switch (lang) {
    case AppLanguage.english:
      return 'en';
    case AppLanguage.portuguese:
      return 'pt';
    case AppLanguage.spanish:
      return 'es';
    case AppLanguage.french:
      return 'fr';
    case AppLanguage.german:
      return 'de';
    case AppLanguage.systemDefault:
    default:
      return 'system';
  }
}


/// Modelo (DTO) para serialização/deserialização e transferência de dados de SettingsEntity.
/// Reside na camada de Dados.
class SettingsModel {
  /// ID do usuário
  final String userId;

  /// Tema selecionado (como String)
  final String theme;

  /// Idioma selecionado (como String)
  final String language;

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

  /// Data do último backup (pode ser nulo)
  final DateTime? lastBackupDate;

  /// Configurações de privacidade (Map<String, bool>)
  final Map<String, bool>? privacySettings;

  /// Configurações adicionais específicas do aplicativo (Map<String, dynamic>)
  final Map<String, dynamic>? additionalSettings;

  /// Construtor
  SettingsModel({
    required this.userId,
    required this.theme,
    required this.language,
    required this.pushNotificationsEnabled,
    required this.messageNotificationsEnabled,
    required this.contactNotificationsEnabled,
    required this.notificationSoundsEnabled,
    required this.notificationVibrationEnabled,
    required this.showMessagePreviewInNotifications,
    required this.autoBackupEnabled,
    required this.autoBackupFrequencyDays,
    this.lastBackupDate,
    this.privacySettings,
    this.additionalSettings,
  });

  /// Cria um modelo a partir de um Map (JSON)
  factory SettingsModel.fromJson(Map<String, dynamic> json) {
    // Adapte as chaves JSON conforme necessário
    return SettingsModel(
      userId: json['user_id'] as String, // Exemplo
      theme: json['theme'] as String? ?? _appThemeToString(AppTheme.system),
      language: json['language'] as String? ?? _appLanguageToString(AppLanguage.systemDefault),
      pushNotificationsEnabled: json['push_notifications_enabled'] as bool? ?? true, // Exemplo
      messageNotificationsEnabled: json['message_notifications_enabled'] as bool? ?? true, // Exemplo
      contactNotificationsEnabled: json['contact_notifications_enabled'] as bool? ?? true, // Exemplo
      notificationSoundsEnabled: json['notification_sounds_enabled'] as bool? ?? true, // Exemplo
      notificationVibrationEnabled: json['notification_vibration_enabled'] as bool? ?? true, // Exemplo
      showMessagePreviewInNotifications: json['show_message_preview'] as bool? ?? true, // Exemplo
      autoBackupEnabled: json['auto_backup_enabled'] as bool? ?? false, // Exemplo
      autoBackupFrequencyDays: json['auto_backup_frequency_days'] as int? ?? 7, // Exemplo
      lastBackupDate: json['last_backup_date'] != null
          ? DateTime.tryParse(json['last_backup_date'] as String) // Exemplo
          : null,
      privacySettings: (json['privacy_settings'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as bool), // Garante que o valor é bool
      ), // Exemplo
      additionalSettings: json['additional_settings'] as Map<String, dynamic>?, // Exemplo
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    // Adapte as chaves JSON conforme necessário
    return {
      'user_id': userId, // Exemplo
      'theme': theme,
      'language': language,
      'push_notifications_enabled': pushNotificationsEnabled, // Exemplo
      'message_notifications_enabled': messageNotificationsEnabled, // Exemplo
      'contact_notifications_enabled': contactNotificationsEnabled, // Exemplo
      'notification_sounds_enabled': notificationSoundsEnabled, // Exemplo
      'notification_vibration_enabled': notificationVibrationEnabled, // Exemplo
      'show_message_preview': showMessagePreviewInNotifications, // Exemplo
      'auto_backup_enabled': autoBackupEnabled, // Exemplo
      'auto_backup_frequency_days': autoBackupFrequencyDays, // Exemplo
      'last_backup_date': lastBackupDate?.toIso8601String(), // Exemplo
      'privacy_settings': privacySettings, // Exemplo
      'additional_settings': additionalSettings, // Exemplo
    };
  }

  /// Cria um modelo a partir de uma entidade do domínio
  factory SettingsModel.fromEntity(SettingsEntity entity) {
    return SettingsModel(
      userId: entity.userId,
      theme: _appThemeToString(entity.theme), // Converte enum para String
      language: _appLanguageToString(entity.language), // Converte enum para String
      pushNotificationsEnabled: entity.pushNotificationsEnabled,
      messageNotificationsEnabled: entity.messageNotificationsEnabled,
      contactNotificationsEnabled: entity.contactNotificationsEnabled,
      notificationSoundsEnabled: entity.notificationSoundsEnabled,
      notificationVibrationEnabled: entity.notificationVibrationEnabled,
      showMessagePreviewInNotifications: entity.showMessagePreviewInNotifications,
      autoBackupEnabled: entity.autoBackupEnabled,
      autoBackupFrequencyDays: entity.autoBackupFrequencyDays,
      lastBackupDate: entity.lastBackupDate,
      privacySettings: entity.privacySettings,
      additionalSettings: entity.additionalSettings,
    );
  }

  /// Converte o modelo (DTO) para uma entidade do domínio
  SettingsEntity toEntity() {
    return SettingsEntity(
      userId: userId,
      theme: _appThemeFromString(theme), // Converte String para enum
      language: _appLanguageFromString(language), // Converte String para enum
      pushNotificationsEnabled: pushNotificationsEnabled,
      messageNotificationsEnabled: messageNotificationsEnabled,
      contactNotificationsEnabled: contactNotificationsEnabled,
      notificationSoundsEnabled: notificationSoundsEnabled,
      notificationVibrationEnabled: notificationVibrationEnabled,
      showMessagePreviewInNotifications: showMessagePreviewInNotifications,
      autoBackupEnabled: autoBackupEnabled,
      autoBackupFrequencyDays: autoBackupFrequencyDays,
      lastBackupDate: lastBackupDate,
      privacySettings: privacySettings,
      additionalSettings: additionalSettings,
    );
  }
}
