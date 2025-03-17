import '../entities/check_entity.dart';

/// Modelo para serialização/deserialização de CheckEntity
class CheckModel extends CheckEntity {
  /// Construtor
  CheckModel({
    required bool checked,
  }) : super(
          checked: checked,
        );

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

  /// Cria um modelo a partir de uma entidade
  factory CheckModel.fromEntity(CheckEntity entity) {
    return CheckModel(
      checked: entity.checked,
    );
  }
}
