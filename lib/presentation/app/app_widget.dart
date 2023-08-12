import 'dart:async';

import 'package:app_laundry/domain/constants/routes.dart';
import 'package:app_laundry/domain/theme/theme_mapping.dart';
import 'package:app_laundry/domain/theme/themes.dart';
import 'package:app_laundry/presentation/app/app_routes.dart';
import 'package:app_laundry/presentation/app/controller/app_controller.dart';
import 'package:app_laundry/presentation/app/widgets/app_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ideploy_package/app_global.dart';
import 'package:ideploy_package/di/injectable.dart';
import 'package:ideploy_package/domain/entities/app_message/app_message.dart';
import 'package:ideploy_package/domain/entities/failure/failure.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerState =
      GlobalKey<ScaffoldMessengerState>();
  final AppController _appController = getIt<AppController>();
  final StreamController<Failure?> streamError =
      StreamController<Failure?>.broadcast();
  final StreamController<AppMessage> streamMessage =
      StreamController<AppMessage>.broadcast();

  void _onDispose() {
    streamError.close();
    streamMessage.close();
  }

  void _initializeAppGlobal(BoxConstraints constraints) {
    AppGlobal(
      flavor: Flavor.des,
      baseUrl: 'http://164.92.85.60:3000/api',
      // baseUrl: 'http://localhost:3000/api',
      xApiKey: '',
      streamError: streamError,
      onDispose: () => _onDispose(),
      streamMessage: streamMessage,
      size: constraints.biggest,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (BuildContext context) {
      final ThemeData _theme = Themes().availableThemes[
          _appController.user?.theme ?? AvailableThemesEnum.defaultTheme]!;

      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          _initializeAppGlobal(constraints);

          return Stack(
            textDirection: TextDirection.ltr,
            alignment: Alignment.topLeft,
            children: <Widget>[
              MaterialApp(
                title: 'iDeploy - Honest PDV',
                scaffoldMessengerKey: _scaffoldMessengerState,
                debugShowCheckedModeBanner: false,
                theme: _theme,
                initialRoute: NamedRoutes.splashScreen.route,
                routes: appRoutes,
              ),
              // Positioned(
              //   bottom: 0,
              //   child: VirtualKeyboardScaffold(
              //     scaffoldMessengerKey: _scaffoldMessengerState,
              //   ),
              // ),
              Positioned(
                top: 0,
                child: AppAlert(
                  secondsDuration: 10,
                  scaffoldMessengerKey: _scaffoldMessengerState,
                ),
              ),
            ],
          );
        },
      );
    });
  }
}
