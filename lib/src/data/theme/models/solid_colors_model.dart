import '../../../domain/theme/entities/solid_colors_entity.dart';

/// Modelo (DTO) para serialização/deserialização e transferência de dados de SolidColorsEntity.
/// Reside na camada de Dados.
class SolidColorsModel {
  /// ID da cor
  final int id;

  /// Valor da cor (geralmente um valor ARGB int)
  final int color;

  /// Construtor
  SolidColorsModel({
    required this.id,
    required this.color,
  });

  /// Cria um modelo a partir de um Map (JSON)
  factory SolidColorsModel.fromJson(Map<String, dynamic> json) {
    return SolidColorsModel(
      id: json['id'] as int,
      color: json['color'] as int,
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'color': color,
    };
  }

  /// Cria um modelo a partir de uma entidade do domínio
  factory SolidColorsModel.fromEntity(SolidColorsEntity entity) {
    return SolidColorsModel(
      id: entity.id,
      color: entity.color,
    );
  }

  /// Converte o modelo (DTO) para uma entidade do domínio
  SolidColorsEntity toEntity() {
    return SolidColorsEntity(
      id: id,
      color: color,
    );
  }
}
