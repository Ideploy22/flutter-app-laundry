import 'package:app_laundry/presentation/app/controller/app_controller.dart';
import 'package:app_laundry/presentation/common/appbar/appbar_default_widget.dart';
import 'package:app_laundry/presentation/home/widgets/change_language_widget.dart';
import 'package:flutter/material.dart';
import 'package:ideploy_package/di/injectable.dart';
import 'package:ideploy_package/ideploy_package.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AppController appController = getIt<AppController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefaultWidget(
        leading: Observer(
          builder: (BuildContext context) {
            return ChangeLanguageWidget(appController: appController);
          },
        ),
        actions: const Icon(Icons.ac_unit),
      ),
    );
  }

  void changeLangue() {
    return;
  }
}
