import '../../../domain/contact/entities/check_entity.dart';

/// Modelo (DTO) para serialização/deserialização e transferência de dados de CheckEntity.
/// Reside na camada de Dados.
class CheckModel {
  /// Indica se a verificação foi bem-sucedida
  final bool checked;

  /// Construtor
  CheckModel({
    required this.checked,
  });

  /// Cria um modelo a partir de um Map (JSON)
  factory CheckModel.fromJson(Map<String, dynamic> json) {
    return CheckModel(
      checked: json['checked'] as bool,
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'checked': checked,
    };
  }

  /// Cria um modelo a partir de uma entidade do domínio
  factory CheckModel.fromEntity(CheckEntity entity) {
    return CheckModel(
      checked: entity.checked,
    );
  }

  /// Converte o modelo (DTO) para uma entidade do domínio
  CheckEntity toEntity() {
    return CheckEntity(
      checked: checked,
    );
  }
}
