import 'dart:async';

import 'package:ideploy_package/di/injectable.dart';
import 'package:ideploy_package/domain/entities/language/language.dart';
import 'package:ideploy_package/ideploy_package.dart';
import 'package:ideploy_package/presentation/translate/translate.dart';

import 'injectable.config.dart';

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> init() async {
  await Firebase.initializeApp();
  await Hive.initFlutter();

  await I18nTranslate.create(
    loader: TranslateLoader(
      basePath: 'assets/i18n',
      locale: Language.portuguese.locale,
    ),
  );

  $initGetIt(getIt);
}
