import 'package:app_laundry/domain/constants/routes.dart';
import 'package:app_laundry/domain/theme/custom_font/i_deploy_icons.dart';
import 'package:app_laundry/domain/theme/theme_constants.dart';
import 'package:app_laundry/presentation/common/buttons/filled_button.dart';
import 'package:app_laundry/presentation/common/headers/closable_header.dart';
import 'package:flutter/material.dart';
import 'package:ideploy_package/ideploy_package.dart';
import 'package:ideploy_package/presentation/translate/translate.dart';

class PasswordDialog extends StatefulWidget {
  final BuildContext parentContext;

  const PasswordDialog({required this.parentContext, super.key});

  @override
  State<PasswordDialog> createState() => _PasswordDialogState();

  Future<String?> _showDialog() {
    return showDialog<String>(
      context: parentContext,
      builder: (BuildContext context) => this,
    );
  }

  Future<String?> show() => Future<String?>.microtask(() => _showDialog());
}

class _PasswordDialogState extends State<PasswordDialog>
    with I18nTranslateMixin {
  final TextEditingController pinputController = TextEditingController();
  static const String password = '121645';
  bool hasError = true;

  @override
  void initState() {
    super.initState();
    setBaseTranslate(base: 'passwordDialog');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Container(
              width: constraints.biggest.width,
              height: constraints.biggest.height,
              padding: const EdgeInsets.all(ThemeConstants.doublePadding),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    ClosableHeader(onClose: _close),
                    const SpacerVertical.double(),
                    const SpacerVertical.double(),
                    Text(
                      translate('title'),
                      style: Theme.of(context).textTheme.displaySmall,
                      textAlign: TextAlign.center,
                    ),
                    const SpacerVertical.normal(),
                    Pinput(
                      length: 6,
                      errorText: translate('wrongPassword'),
                      controller: pinputController,
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      validator: _validatePin,
                    ),
                    const SpacerVertical.double(),
                    const SpacerVertical.double(),
                    FilledActionButton(
                      label: translate('button'),
                      onTap: hasError ? null : () => _handleAction(),
                      color: Theme.of(context).colorScheme.surface,
                      fillColor: hasError
                          ? Theme.of(context).colorScheme.shadow
                          : Theme.of(context).colorScheme.primary,
                      icon: IDeployIcons.check,
                      fullWidth: false,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _handleAction() {
    if (!hasError) {
      Navigator.of(context).pop();
      Navigator.of(context).pushNamed(NamedRoutes.configurationScreen.route);
    }
  }

  void _close() {
    Navigator.of(context).pop();
  }

  String? _validatePin(String? pin) {
    setState(() {
      hasError = pin != password;
    });
    return pin == password ? null : 'wrong';
  }
}
