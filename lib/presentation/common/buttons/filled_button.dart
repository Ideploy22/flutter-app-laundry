import 'package:app_laundry/domain/theme/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:ideploy_package/presentation/spacer/spacer_horizontal.dart';

class FilledActionButton extends StatelessWidget {
  final void Function()? onTap;
  final String label;
  final Color color;
  final Color fillColor;
  final IconData? icon;
  final bool fullWidth;
  final bool centerContent;

  const FilledActionButton({
    required this.label,
    required this.color,
    required this.fillColor,
    this.onTap,
    this.icon,
    this.fullWidth = true,
    this.centerContent = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(ThemeConstants.borderRadius),
        child: Ink(
          padding: const EdgeInsets.symmetric(
            vertical: ThemeConstants.padding + ThemeConstants.minPadding,
            horizontal:
                ThemeConstants.doublePadding + ThemeConstants.halfPadding,
          ),
          decoration: BoxDecoration(
            color: fillColor,
            border: Border.all(
              color: const Color.fromARGB(55, 0, 0, 0),
              width: 1.25,
            ),
            borderRadius:
                BorderRadius.circular(ThemeConstants.dialogBorderRadius),
          ),
          child: Row(
            mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: centerContent
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: <Widget>[
              if (icon != null) ...<Widget>[
                Icon(
                  icon!,
                  color: color,
                  size: ThemeConstants.iconSizeSmall,
                ),
                const SpacerHorizontal.half(),
              ],
              Padding(
                padding: const EdgeInsets.all(ThemeConstants.doublePadding),
                child: Text(
                  label,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: color),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
