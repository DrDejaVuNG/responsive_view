import 'package:flutter/material.dart';
import 'package:responsive_view/src/responsive_utils.dart';

/// {@template responsive_app}
/// A widget that initializes the ResponsiveView framework and provides responsive scaling functionality for its child widget.
///
/// Wrap your MaterialApp widget with this widget to enable responsive scaling throughout your application.
/// {@endtemplate}
class ResponsiveApp extends StatelessWidget {
  /// {@macro responsive_app}
  const ResponsiveApp({
    super.key,
    required this.designSize,
    required this.child,
    this.minMultiplier = 0.8,
    this.maxMultiplier = 1.2,
  });

  /// The [Size] of the device used in the design process.
  /// This size will be used as the baseline for responsive scaling.
  final Size designSize;

  /// The minimum scaling factor allowed for responsive values. Values will be clamped to this minimum.
  /// Defaults to 1.
  final double minMultiplier;

  /// The maximum scaling factor allowed for responsive values. Values will be clamped to this maximum.
  /// Defaults to 1.
  final double maxMultiplier;

  /// The child widget to be wrapped within the responsive context.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final portrait = MediaQuery.orientationOf(context) == Orientation.portrait;

    // Initializes the ResponsiveUtils class with necessary data.
    ResponsiveUtils.init(
      initSize: designSize,
      screenSize: portrait ? size : size.flipped,
      minMultiple: minMultiplier,
      maxMultiple: maxMultiplier,
    );

    return child;
  }
}
