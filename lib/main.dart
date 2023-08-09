import 'dart:async';

import 'package:app_laundry/di/injectable.dart' as di;
import 'package:app_laundry/presentation/app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ideploy_package/di/injectable.dart' as di_pack;
import 'package:kiosk_mode/kiosk_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await startKioskMode();
  await di_pack.init();
  await di.init();

  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersive,
  );

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    statusBarColor: Colors.transparent,
  ));

  await SystemChrome.setSystemUIChangeCallback((
    bool systemOverlaysAreVisible,
  ) async {
    if (systemOverlaysAreVisible) {
      await SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.immersive,
      );
    }
  });

  await SystemChrome.setPreferredOrientations(
    <DeviceOrientation>[DeviceOrientation.landscapeLeft],
  ).then((_) {
    runZoned(
      () {
        runApp(const AppWidget());
      },
    );
  });
}
