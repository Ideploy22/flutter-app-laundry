import 'package:app_laundry/domain/entities/user/user_entity.dart';
import 'package:app_laundry/domain/theme/theme_mapping.dart';
import 'package:ideploy_package/ideploy_package.dart';

part 'user_model.g.dart';
part 'user_model.mapper.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class UserModel extends UserEntity {
  @JsonKey(
    name: 'theme',
    defaultValue: AvailableThemesEnum.defaultTheme,
    fromJson: _$ThemeFromJson,
    toJson: _$ThemeToJson,
  )
  final AvailableThemesEnum themeModel;

  UserModel({
    required super.name,
    required super.email,
    required this.themeModel,
    super.id,
    super.createdAt,
    super.updatedAt,
  }) : super(theme: themeModel);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.fromEntity(UserEntity entity) =>
      _$UserModelFromEntity(entity);

  UserEntity toEntity() => _$UserModelToEntity(this);
}
