import 'package:flutter/material.dart';
import 'package:responsive_view/src/responsive_utils.dart';

class ResponsiveView extends StatelessWidget {
  const ResponsiveView({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;

  @override
  Widget build(BuildContext context) {
    return switch (ResponsiveUtils.screenWidth) {
      > 180 && <= 480 => mobile ?? tablet ?? desktop ?? const SizedBox.shrink(),
      > 480 && <= 1080 =>
        tablet ?? mobile ?? desktop ?? const SizedBox.shrink(),
      > 1080 => desktop ?? tablet ?? mobile ?? const SizedBox.shrink(),
      _ => mobile ?? const SizedBox.shrink(),
    };
  }
}
