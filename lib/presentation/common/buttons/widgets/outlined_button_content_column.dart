part of './../outlined_button.dart';

class _$OutlinedButtonContentColumn extends StatelessWidget {
  final String label;
  final Color color;
  final IconData? icon;
  final Color? iconColor;

  const _$OutlinedButtonContentColumn({
    required this.label,
    required this.color,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (icon != null) ...<Widget>[
          Icon(
            icon!,
            color: iconColor ?? color,
            size: ThemeConstants.iconSizeSmall,
          ),
          const SpacerVertical.half(),
        ],
        Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(color: color),
        ),
      ],
    );
  }
}
