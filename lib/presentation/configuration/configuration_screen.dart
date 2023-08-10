import 'package:app_laundry/domain/constants/routes.dart';
import 'package:app_laundry/domain/theme/custom_font/i_deploy_icons.dart';
import 'package:app_laundry/domain/theme/theme_constants.dart';
import 'package:app_laundry/presentation/common/buttons/filled_button.dart';
import 'package:app_laundry/presentation/common/headers/closable_header.dart';
import 'package:app_laundry/presentation/configuration/controller/configuration_controller.dart';
import 'package:flutter/material.dart';
import 'package:ideploy_package/di/injectable.dart';
import 'package:ideploy_package/presentation/spacer/space_vertical.dart';
import 'package:ideploy_package/presentation/translate/translate.dart';

class ConfigurationScreen extends StatelessWidget with I18nTranslateMixin {
  ConfigurationScreen({super.key}) {
    setBaseTranslate(base: 'configuration');
  }

  final ConfigurationController _controller = getIt<ConfigurationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(ThemeConstants.doublePadding),
        child: Column(
          children: <Widget>[
            ClosableHeader(onClose: () => _close(context)),
            const SpacerVertical.double(),
            Text(
              translate('title'),
              style: Theme.of(context).textTheme.displaySmall,
              textAlign: TextAlign.center,
            ),
            const SpacerVertical.double(),
            FilledActionButton(
              label: translate('syncProducts'),
              onTap: () => _teste(),
              color: Theme.of(context).colorScheme.surface,
              fillColor: Theme.of(context).colorScheme.primary,
              icon: IDeployIcons.syncProduct,
              fullWidth: false,
            ),
            const SpacerVertical.double(),
            FilledActionButton(
              label: translate('syncPos'),
              onTap: () => _teste(),
              color: Theme.of(context).colorScheme.surface,
              fillColor: Theme.of(context).colorScheme.primary,
              icon: IDeployIcons.pos,
              fullWidth: false,
            ),
          ],
        ),
      ),
    );
  }

  void _close(BuildContext context) {
    Navigator.of(context).popUntil((Route<dynamic> route) =>
        route.settings.name == NamedRoutes.homeScreen.route);
  }

  void _teste() {
    print('teste');
  }
}
