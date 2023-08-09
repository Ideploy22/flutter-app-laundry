class BaseEntity {
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  BaseEntity({
    this.id,
    this.updatedAt,
    this.createdAt,
  });

  String? get createdAtStr => createdAt?.toIso8601String();
}
