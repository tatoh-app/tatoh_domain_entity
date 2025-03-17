

/// Entidade que representa um resultado de verificação
class CheckEntity {
  /// Indica se a verificação foi bem-sucedida
  final bool checked;

  /// Construtor
  const CheckEntity({
    required this.checked,
  });
  
  /// Cria uma cópia da entidade com alguns campos alterados
  CheckEntity copyWith({
    bool? checked,
  }) {
    return CheckEntity(
      checked: checked ?? this.checked,
    );
  }
  

}
