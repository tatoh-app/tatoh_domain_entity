import '../../../domain/settings/entities/settings_entity.dart'; // Importa SettingsEntity e os Enums

/// Modelo (DTO) para serialização/deserialização e transferência de dados de SettingsEntity.
/// Reside na camada de Dados.
class SettingsModel {
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
  SettingsModel({
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

  /// Cria um modelo a partir de um Map (JSON)
  factory SettingsModel.fromJson(Map<String, dynamic> json) {
    // TODO: Considerar adicionar validações ou tratamento de nulos mais robusto
    return SettingsModel(
      userId: json['userId'] as String,
      theme: _themeFromJson(json['theme']), // Usa a função auxiliar
      language: _languageFromJson(json['language']), // Usa a função auxiliar
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
        (k, e) => MapEntry(k, e as bool), // Garante que o valor é bool
      ),
      additionalSettings: json['additionalSettings'] as Map<String, dynamic>?,
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'theme': theme.index, // Converte enum para int (índice)
      'language': language.index, // Converte enum para int (índice)
      'pushNotificationsEnabled': pushNotificationsEnabled,
      'messageNotificationsEnabled': messageNotificationsEnabled,
      'contactNotificationsEnabled': contactNotificationsEnabled,
      'notificationSoundsEnabled': notificationSoundsEnabled,
      'notificationVibrationEnabled': notificationVibrationEnabled,
      'showMessagePreviewInNotifications': showMessagePreviewInNotifications,
      'autoBackupEnabled': autoBackupEnabled,
      'autoBackupFrequencyDays': autoBackupFrequencyDays,
      'lastBackupDate': lastBackupDate?.toIso8601String(), // Converte DateTime? para String?
      'privacySettings': privacySettings,
      'additionalSettings': additionalSettings,
    };
  }

  /// Cria um modelo a partir de uma entidade do domínio
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

  /// Converte o modelo (DTO) para uma entidade do domínio
  SettingsEntity toEntity() {
    return SettingsEntity(
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
  }

  /// Função auxiliar estática para converter JSON para AppTheme
  static AppTheme _themeFromJson(dynamic json) {
    if (json is int && json >= 0 && json < AppTheme.values.length) {
      return AppTheme.values[json];
    }
    // Retorna um valor padrão ou lança um erro se a conversão falhar
    return AppTheme.system; // Valor padrão
  }

  /// Função auxiliar estática para converter JSON para AppLanguage
  static AppLanguage _languageFromJson(dynamic json) {
    if (json is int && json >= 0 && json < AppLanguage.values.length) {
      return AppLanguage.values[json];
    }
    // Retorna um valor padrão ou lança um erro se a conversão falhar
    return AppLanguage.systemDefault; // Valor padrão
  }
}