import 'package:app_laundry/domain/constants/globals.dart';
import 'package:app_laundry/domain/constants/routes.dart';
import 'package:app_laundry/domain/theme/theme_constants.dart';
import 'package:flutter/material.dart';

class AppBarDefaultWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? actions;
  final bool isHome;

  const AppBarDefaultWidget({
    this.actions,
    this.leading,
    this.isHome = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: ThemeConstants.padding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: leading ?? const SizedBox.shrink(),
            ),
            Expanded(
              child: GestureDetector(
                onLongPress: () => _goToConfiguration(context),
                child: Image.asset(GlobalsConstants.assetsLogo),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: actions ?? const SizedBox.shrink(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _goToConfiguration(BuildContext context) {
    Navigator.pushNamed(context, NamedRoutes.configurationScreen.route);
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
