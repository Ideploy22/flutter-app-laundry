import 'package:flutter/material.dart';
import 'package:ideploy_package/domain/entities/language/language.dart';

class ButtonChangeLangueWidget extends StatelessWidget {
  final Language languageSelected;
  final Language language;
  final Future<void> Function(Language value) changeLanguage;

  const ButtonChangeLangueWidget({
    required this.languageSelected,
    required this.language,
    required this.changeLanguage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Text(
        language.locale.languageCode,
        style: TextStyle(fontSize: getFontSize),
      ),
      onPressed: () async => await changeLanguage(language),
    );
  }

  double get getFontSize => languageSelected == language ? 25 : 18;
}
