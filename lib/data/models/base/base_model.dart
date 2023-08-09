import 'package:app_laundry/domain/entities/base/base_entity.dart';
import 'package:ideploy_package/ideploy_package.dart';

part 'base_model.g.dart';
part 'base_model.mapper.dart';

@JsonSerializable(anyMap: true)
class BaseModel extends BaseEntity {
  BaseModel({
    super.id,
    super.createdAt,
    super.updatedAt,
  });

  factory BaseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseModelFromJson(json);
  Map<String, dynamic> toJson() => _$BaseModelToJson(this);

  factory BaseModel.fromEntity(BaseEntity entity) =>
      _$BaseModelFromEntity(entity);
  BaseEntity toEntity() => _$BaseModelToEntity(this);
}
