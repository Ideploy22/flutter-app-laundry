part of 'base_model.dart';

BaseModel _$BaseModelFromEntity(BaseEntity entity) => BaseModel(
      id: entity.id,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );

BaseEntity _$BaseModelToEntity(BaseModel model) => BaseEntity(
      id: model.id,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
