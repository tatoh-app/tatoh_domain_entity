import '../entities/settings_entity.dart';

/// Modelo para serialização/deserialização de SettingsEntity
class SettingsModel extends SettingsEntity {
  /// Construtor
  SettingsModel({
    required String userId,
    AppTheme theme = AppTheme.system,
    AppLanguage language = AppLanguage.systemDefault,
    bool pushNotificationsEnabled = true,
    bool messageNotificationsEnabled = true,
    bool contactNotificationsEnabled = true,
    bool notificationSoundsEnabled = true,
    bool notificationVibrationEnabled = true,
    bool showMessagePreviewInNotifications = true,
    bool autoBackupEnabled = false,
    int autoBackupFrequencyDays = 7,
    DateTime? lastBackupDate,
    Map<String, bool>? privacySettings,
    Map<String, dynamic>? additionalSettings,
  }) : super(
          userId: userId,
          theme: theme,
          language: language,
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

  /// Cria um modelo a partir de um Map (JSON)
  factory SettingsModel.fromJson(Map<String, dynamic> json) {
    return SettingsModel(
      userId: json['userId'] as String,
      theme: _themeFromJson(json['theme']),
      language: _languageFromJson(json['language']),
      pushNotificationsEnabled: json['pushNotificationsEnabled'] as bool? ?? true,
      messageNotificationsEnabled: json['messageNotificationsEnabled'] as bool? ?? true,
      contactNotificationsEnabled: json['contactNotificationsEnabled'] as bool? ?? true,
      notificationSoundsEnabled: json['notificationSoundsEnabled'] as bool? ?? true,
      notificationVibrationEnabled: json['notificationVibrationEnabled'] as bool? ?? true,
      showMessagePreviewInNotifications: json['showMessagePreviewInNotifications'] as bool? ?? true,
      autoBackupEnabled: json['autoBackupEnabled'] as bool? ?? false,
      autoBackupFrequencyDays: json['autoBackupFrequencyDays'] as int? ?? 7,
      lastBackupDate: json['lastBackupDate'] != null
          ? DateTime.parse(json['lastBackupDate'] as String)
          : null,
      privacySettings: (json['privacySettings'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as bool),
      ),
      additionalSettings: json['additionalSettings'] as Map<String, dynamic>?,
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'theme': theme.index,
      'language': language.index,
      'pushNotificationsEnabled': pushNotificationsEnabled,
      'messageNotificationsEnabled': messageNotificationsEnabled,
      'contactNotificationsEnabled': contactNotificationsEnabled,
      'notificationSoundsEnabled': notificationSoundsEnabled,
      'notificationVibrationEnabled': notificationVibrationEnabled,
      'showMessagePreviewInNotifications': showMessagePreviewInNotifications,
      'autoBackupEnabled': autoBackupEnabled,
      'autoBackupFrequencyDays': autoBackupFrequencyDays,
      'lastBackupDate': lastBackupDate?.toIso8601String(),
      'privacySettings': privacySettings,
      'additionalSettings': additionalSettings,
    };
  }

  /// Cria um modelo a partir de uma entidade
  factory SettingsModel.fromEntity(SettingsEntity entity) {
    return SettingsModel(
      userId: entity.userId,
      theme: entity.theme,
      language: entity.language,
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

  /// Converte um inteiro para AppTheme
  static AppTheme _themeFromJson(dynamic json) {
    if (json is int && json >= 0 && json < AppTheme.values.length) {
      return AppTheme.values[json];
    }
    return AppTheme.system;
  }

  /// Converte um inteiro para AppLanguage
  static AppLanguage _languageFromJson(dynamic json) {
    if (json is int && json >= 0 && json < AppLanguage.values.length) {
      return AppLanguage.values[json];
    }
    return AppLanguage.systemDefault;
  }
}
