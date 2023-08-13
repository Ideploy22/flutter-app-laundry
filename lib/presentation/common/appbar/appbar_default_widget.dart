import 'package:app_laundry/domain/theme/theme_constants.dart';
import 'package:app_laundry/presentation/common/appbar/widget/logo_widget.dart';
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
            Expanded(child: leading ?? const SizedBox.shrink()),
            Expanded(child: LogoWidget(isHome: isHome)),
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

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
