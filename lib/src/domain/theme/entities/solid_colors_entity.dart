/// Entidade que representa uma cor sólida
class SolidColorsEntity {
  /// ID da cor
  final int id;
  
  /// Valor da cor
  final int color;

  /// Construtor
  const SolidColorsEntity({
    required this.id,
    required this.color,
  });
  
  /// Cria uma cópia da entidade com alguns campos alterados
  SolidColorsEntity copyWith({
    int? id,
    int? color,
  }) {
    return SolidColorsEntity(
      id: id ?? this.id,
      color: color ?? this.color,
    );
  }
}
