import 'package:app_laundry/domain/constants/routes.dart';
import 'package:app_laundry/domain/entities/user/user_entity.dart';
import 'package:app_laundry/presentation/app/controller/app_controller.dart';
import 'package:app_laundry/presentation/spash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:ideploy_package/di/injectable.dart';
import 'package:ideploy_package/presentation/translate/translate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with I18nTranslateMixin {
  final SplashController _splashController = getIt<SplashController>();
  final AppController _appController = getIt<AppController>();

  bool loading = true;

  @override
  void initState() {
    super.initState();
    setBaseTranslate(base: 'splash');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initialize();
    });
  }

  Future<void> _initialize() async {
    await _splashController.initializeUser(
      onUserLogged: (UserEntity user) async {
        await _appController.initializeApp(user: user);
        setState(() {
          loading = false;
        });
        Navigator.of(context)
            .pushReplacementNamed(NamedRoutes.homeScreen.route)
            .ignore();
      },
      onUserNotLogged: () {
        if (mounted) {
          Navigator.of(context).pushNamed(NamedRoutes.loginScreen.route);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
