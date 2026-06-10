import 'package:flutter/material.dart';

@immutable
class CustomTextStyles extends ThemeExtension<CustomTextStyles> {
  final TextStyle xs;
  final TextStyle sm;
  final TextStyle standard;
  final TextStyle lg;
  final TextStyle xl;
  final TextStyle xxl;

  const CustomTextStyles({
    this.xs = const TextStyle(fontSize: 12, height: 1.33),
    this.sm = const TextStyle(fontSize: 14, height: 1.43),
    this.standard = const TextStyle(fontSize: 16, height: 1.5),
    this.lg = const TextStyle(fontSize: 18, height: 1.56),
    this.xl = const TextStyle(fontSize: 20, height: 1.4),
    this.xxl = const TextStyle(fontSize: 32, height: 1.2),
  });

  @override
  CustomTextStyles copyWith({
    TextStyle? xs,
    TextStyle? sm,
    TextStyle? standard,
    TextStyle? lg,
    TextStyle? xl,
    TextStyle? xxl,
  }) {
    return CustomTextStyles(
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      standard: standard ?? this.standard,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
    );
  }

  @override
  CustomTextStyles lerp(ThemeExtension<CustomTextStyles>? other, double t) {
    if (other is! CustomTextStyles) return this;

    return CustomTextStyles(
      xs: TextStyle.lerp(xs, other.xs, t) ?? xs,
      sm: TextStyle.lerp(sm, other.sm, t) ?? sm,
      standard: TextStyle.lerp(standard, other.standard, t) ?? standard,
      lg: TextStyle.lerp(lg, other.lg, t) ?? lg,
      xl: TextStyle.lerp(xl, other.xl, t) ?? xl,
      xxl: TextStyle.lerp(xxl, other.xxl, t) ?? xxl,
    );
  }
}
