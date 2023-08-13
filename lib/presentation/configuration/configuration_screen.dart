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
            const SpacerVertical.double(),
            FilledActionButton(
              label: translate('syncPosOrTef'),
              onTap: () {},
              color: Theme.of(context).colorScheme.surface,
              fillColor: Theme.of(context).colorScheme.primary,
              icon: IDeployIcons.pos,
              fullWidth: false,
            ),
            const SpacerVertical.double(),
            FilledActionButton(
              label: translate('priceItems'),
              onTap: () {},
              color: Theme.of(context).colorScheme.surface,
              fillColor: Theme.of(context).colorScheme.primary,
              icon: IDeployIcons.dollar,
              fullWidth: false,
            ),
            const SpacerVertical.double(),
            FilledActionButton(
              label: translate('washingMachine'),
              onTap: () {},
              color: Theme.of(context).colorScheme.surface,
              fillColor: Theme.of(context).colorScheme.primary,
              icon: IDeployIcons.edit,
              fullWidth: false,
            ),
            const SpacerVertical.double(),
            FilledActionButton(
              label: translate('dryerMachine'),
              onTap: () {},
              color: Theme.of(context).colorScheme.surface,
              fillColor: Theme.of(context).colorScheme.primary,
              icon: IDeployIcons.edit,
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
}
