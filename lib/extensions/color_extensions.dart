import 'package:flutter/material.dart';

extension ColorExtensions on Color {
  Color darken(double percent) => HSLColor.fromColor(this)
      .withLightness((HSLColor.fromColor(this).lightness - percent).clamp(0, 1))
      .toColor();

  Color lighten(double percent) => HSLColor.fromColor(this)
      .withLightness((HSLColor.fromColor(this).lightness + percent).clamp(0, 1))
      .toColor();
}
