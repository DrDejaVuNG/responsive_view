import 'package:flutter/material.dart';
import 'package:responsive_view/src/responsive_utils.dart';

class ResponsiveApp extends StatelessWidget {
  const ResponsiveApp({
    super.key,
    required this.designSize,
    required this.child,
    this.minMultiplier = 1,
    this.maxMultiplier = 1,
  });

  /// The [Size] of the device used in the design
  final Size designSize;

  final double minMultiplier;

  final double maxMultiplier;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final portrait = MediaQuery.orientationOf(context) == Orientation.portrait;
    ResponsiveUtils.init(
      initSize: designSize,
      phoneSize: portrait ? size : size.flipped,
      minMultiple: minMultiplier,
      maxMultiple: maxMultiplier,
    );
    return child;
  }
}
