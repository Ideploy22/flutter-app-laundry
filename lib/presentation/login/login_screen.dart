import 'package:app_laundry/domain/constants/routes.dart';
import 'package:app_laundry/domain/entities/user/user_entity.dart';
import 'package:app_laundry/domain/theme/custom_font/i_deploy_icons.dart';
import 'package:app_laundry/presentation/app/controller/app_controller.dart';
import 'package:app_laundry/presentation/common/buttons/filled_button.dart';
import 'package:app_laundry/presentation/common/loading/loading_screen.dart';
import 'package:app_laundry/presentation/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:ideploy_package/di/injectable.dart';
import 'package:ideploy_package/ideploy_package.dart';
import 'package:ideploy_package/presentation/input/ideploy_input.dart';
import 'package:ideploy_package/presentation/translate/translate.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with I18nTranslateMixin {
  final TextEditingController _emailController =
      TextEditingController(text: 'honest_terminal001@gmail.com');
  final TextEditingController _pwdController =
      TextEditingController(text: '123456');
  final AppController _appController = getIt<AppController>();
  final LoginController _controller = getIt<LoginController>();

  bool _obscure = true;

  @override
  void initState() {
    super.initState();
    setBaseTranslate(base: 'login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (BuildContext context) {
          return LoadingIndicator(
            loading: _controller.loading,
            message: translate('loading'),
            onTimeOut: () => _controller.cancelLogin(),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: constraints.biggest.width * 0.2,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IdeployInput(
                        label: translate('email'),
                        controller: _emailController,
                      ),
                      const SpacerVertical.normal(),
                      IdeployInput(
                        label: translate('password'),
                        controller: _pwdController,
                        obscure: _obscure,
                        suffix: _obscure
                            ? IDeployIcons.eye
                            : IDeployIcons.close_eye,
                        onSuffix: () => _toggleObscure(),
                      ),
                      const SpacerVertical.normal(),
                      FilledActionButton(
                        label: translate('button'),
                        onTap: () => _signIn(),
                        color: Theme.of(context).colorScheme.surface,
                        fillColor: Theme.of(context).colorScheme.primary,
                        icon: IDeployIcons.check,
                        fullWidth: true,
                        centerContent: true,
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _signIn() {
    _controller.signIn(
      email: _emailController.text,
      password: _pwdController.text,
      onSuccess: (UserEntity user) async {
        _appController.setUser(user);
        //final FlutterPluginPosIntegration _posPlugin = getIt<FlutterPluginPosIntegration>();
        //await _posPlugin.initialize();
        Navigator.of(context)
            .pushReplacementNamed(NamedRoutes.homeScreen.route)
            .ignore();
      },
    );
  }

  void _toggleObscure() {
    setState(() {
      _obscure = !_obscure;
    });
  }
}
