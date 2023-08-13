import 'package:app_laundry/domain/constants/globals.dart';
import 'package:app_laundry/domain/theme/theme_constants.dart';
import 'package:app_laundry/presentation/common/buttons/filled_button.dart';
import 'package:flutter/material.dart';
import 'package:ideploy_package/presentation/spacer/space_vertical.dart';
import 'package:ideploy_package/presentation/translate/translate.dart';

class IdleHomeWidget extends StatefulWidget {
  const IdleHomeWidget({super.key});

  @override
  State<IdleHomeWidget> createState() => _IdleHomeWidgetState();
}

class _IdleHomeWidgetState extends State<IdleHomeWidget>
    with I18nTranslateMixin {
  @override
  void initState() {
    super.initState();
    setBaseTranslate(base: 'home');
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        final bool isLandscape = orientation == Orientation.landscape;

        return Flex(
          direction: isLandscape ? Axis.horizontal : Axis.vertical,
          children: <Widget>[
            Expanded(
              child: SizedBox.expand(
                child: Image.asset(
                  GlobalsConstants.washingMachine,
                  fit: isLandscape ? BoxFit.cover : BoxFit.fitWidth,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: ThemeConstants.doublePadding,
                  horizontal: ThemeConstants.doublePadding,
                ),
                child: Column(
                  mainAxisAlignment:
                      _getmainAxisAlignmentByLandscape(isLandscape),
                  crossAxisAlignment:
                      _getCrossAxisAlignmentByLandscape(isLandscape),
                  children: <Widget>[
                    Text(
                      translate('title'),
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: _getTextAlignByLandscape(isLandscape),
                    ),
                    const SpacerVertical.normal(),
                    Text(
                      translate('sub_title'),
                      style: Theme.of(context).textTheme.headlineLarge,
                      textAlign: _getTextAlignByLandscape(isLandscape),
                    ),
                    const SpacerVertical.double(),
                    FilledActionButton(
                      label: translate('start'),
                      color: Theme.of(context).colorScheme.surface,
                      fillColor: Theme.of(context).colorScheme.primary,
                      centerContent: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  TextAlign _getTextAlignByLandscape(bool isLandscape) {
    return isLandscape ? TextAlign.start : TextAlign.center;
  }

  CrossAxisAlignment _getCrossAxisAlignmentByLandscape(bool isLandscape) {
    return isLandscape ? CrossAxisAlignment.start : CrossAxisAlignment.center;
  }

  MainAxisAlignment _getmainAxisAlignmentByLandscape(bool isLandscape) {
    return isLandscape ? MainAxisAlignment.center : MainAxisAlignment.start;
  }
}
