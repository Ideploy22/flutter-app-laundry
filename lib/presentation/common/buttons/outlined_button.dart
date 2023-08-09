import 'package:app_laundry/domain/theme/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:ideploy_package/presentation/spacer/space_vertical.dart';
import 'package:ideploy_package/presentation/spacer/spacer_horizontal.dart';

part './widgets/outlined_button_content_column.dart';
part './widgets/outlined_button_content_row.dart';

enum OutlinedButtonIconPos { top, left }

class OutlinedActionButton extends StatelessWidget {
  final void Function() onTap;
  final String label;
  final Color color;
  final IconData? icon;
  final Color? iconColor;
  final bool compact;
  final double? borderWidth;
  final OutlinedButtonIconPos iconPos;

  const OutlinedActionButton({
    required this.label,
    required this.onTap,
    required this.color,
    this.icon,
    this.iconColor,
    this.borderWidth,
    this.compact = false,
    this.iconPos = OutlinedButtonIconPos.left,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(ThemeConstants.dialogBorderRadius),
      child: InkWell(
        onTap: () => onTap(),
        borderRadius: BorderRadius.circular(ThemeConstants.dialogBorderRadius),
        child: Ink(
          padding: EdgeInsets.symmetric(
            vertical: compact
                ? ThemeConstants.halfPadding
                : ThemeConstants.padding + ThemeConstants.minPadding,
            horizontal:
                ThemeConstants.doublePadding + ThemeConstants.halfPadding,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: color, width: borderWidth ?? 1.25),
            borderRadius:
                BorderRadius.circular(ThemeConstants.dialogBorderRadius),
          ),
          child: iconPos == OutlinedButtonIconPos.left
              ? _$OutlinedButtonContentRow(
                  label: label,
                  iconColor: iconColor,
                  icon: icon,
                  color: color,
                )
              : _$OutlinedButtonContentColumn(
                  label: label,
                  iconColor: iconColor,
                  icon: icon,
                  color: color,
                ),
        ),
      ),
    );
  }
}
