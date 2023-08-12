import 'package:app_laundry/domain/constants/globals.dart';
import 'package:app_laundry/presentation/common/dialog/password_dialog.dart';
import 'package:flutter/material.dart';

enum LogoSize {
  small(0.15),
  medium(0.3),
  large(0.5);

  final double screenFraction;

  const LogoSize(this.screenFraction);
}

class LogoWidget extends StatelessWidget {
  final LogoSize size;
  final bool isHome;

  const LogoWidget({
    this.size = LogoSize.medium,
    this.isHome = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (
        BuildContext context,
        BoxConstraints constraints,
      ) {
        return GestureDetector(
          onLongPress: () => _openPasswordDialog(context),
          child: Image.asset(
            GlobalsConstants.assetsLogo,
            width: constraints.biggest.width * size.screenFraction,
          ),
        );
      },
    );
  }

  void _openPasswordDialog(BuildContext context) {
    if (isHome) {
      PasswordDialog(
        parentContext: context,
      ).show();
    }
  }
}
