import 'package:app_laundry/domain/entities/base/base_entity.dart';
import 'package:app_laundry/domain/theme/theme_mapping.dart';

class UserEntity extends BaseEntity {
  final String name;
  final String email;
  final AvailableThemesEnum theme;

  UserEntity({
    required this.name,
    required this.email,
    required this.theme,
    super.id,
    super.createdAt,
    super.updatedAt,
  });
}
