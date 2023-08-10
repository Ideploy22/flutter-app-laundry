import 'package:app_laundry/presentation/app/controller/app_controller.dart';
import 'package:app_laundry/presentation/home/widgets/button_change_langue_widget.dart';
import 'package:flutter/material.dart';
import 'package:ideploy_package/domain/entities/language/language.dart';

class ChangeLanguageWidget extends StatelessWidget {
  final AppController appController;
  const ChangeLanguageWidget({required this.appController, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ButtonChangeLangueWidget(
          languageSelected: appController.language,
          language: Language.english,
          changeLanguage: appController.changeLanguage,
        ),
        ButtonChangeLangueWidget(
          languageSelected: appController.language,
          language: Language.spanish,
          changeLanguage: appController.changeLanguage,
        ),
        ButtonChangeLangueWidget(
          languageSelected: appController.language,
          language: Language.portuguese,
          changeLanguage: appController.changeLanguage,
        ),
      ],
    );
  }
}
