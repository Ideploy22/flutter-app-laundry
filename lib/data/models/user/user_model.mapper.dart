part of 'user_model.dart';

UserModel _$UserModelFromEntity(UserEntity entity) => UserModel(
      name: entity.name,
      email: entity.email,
      id: entity.id,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      themeModel: entity.theme,
    );

UserEntity _$UserModelToEntity(UserModel model) => UserEntity(
      name: model.name,
      email: model.email,
      id: model.id,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      theme: model.themeModel,
    );

AvailableThemesEnum _$ThemeFromJson(String? value) {
  return AvailableThemesEnum.values.firstWhere(
    (AvailableThemesEnum element) => element.value == value,
    orElse: () => AvailableThemesEnum.defaultTheme,
  );
}

String _$ThemeToJson(AvailableThemesEnum theme) {
  return theme.value;
}
