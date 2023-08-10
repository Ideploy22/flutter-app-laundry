import 'package:app_laundry/domain/theme/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:ideploy_package/presentation/spacer/spacer_horizontal.dart';

class ClosableHeader extends StatelessWidget {
  final void Function() onClose;
  const ClosableHeader({
    required this.onClose,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Expanded(child: SizedBox()),
        IconButton(
          onPressed: () => onClose(),
          icon: const Icon(
            Icons.close,
            size: ThemeConstants.iconSizeMedium,
          ),
        ),
        const SpacerHorizontal.double(),
      ],
    );
  }
}
