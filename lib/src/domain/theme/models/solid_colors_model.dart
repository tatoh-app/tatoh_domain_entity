import '../entities/solid_colors_entity.dart';

/// Modelo para serialização/deserialização de cores sólidas
class SolidColorsModel extends SolidColorsEntity {
  /// Construtor
  SolidColorsModel({
    required int id,
    required int color,
  }) : super(id: id, color: color);
  
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
  
  /// Cria um modelo a partir de uma entidade
  factory SolidColorsModel.fromEntity(SolidColorsEntity entity) {
    return SolidColorsModel(
      id: entity.id,
      color: entity.color,
    );
  }
}
