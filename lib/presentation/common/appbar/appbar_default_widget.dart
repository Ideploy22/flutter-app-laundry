import 'package:app_laundry/domain/constants/globals.dart';
import 'package:flutter/material.dart';

class AppBarDefaultWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? actions;

  const AppBarDefaultWidget({
    this.actions,
    this.leading,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).primaryColor,
      child: Row(
        children: <Widget>[
          Expanded(
            child: leading ?? const SizedBox.shrink(),
          ),
          Expanded(
            child: Image.asset(GlobalsConstants.assetsLogo),
          ),
          Expanded(
            child: actions ?? const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  void changeLangue() {
    return;
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
