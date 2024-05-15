import 'package:responsive_view/src/responsive_utils.dart';

/// Extension methods for adding responsive functionality to numeric values.
/// 
/// This extension provides convenient access to responsive scaling methods 
/// from the [ResponsiveUtils] class.
extension ResponsiveExtension on num {
  /// Sets the width of a UI element based on the design size and applies responsive scaling.
  ///
  /// * See [ResponsiveUtils.setWidth] for more details.
  double get w => ResponsiveUtils.setWidth(this);

  /// Sets the height of a UI element based on the design size and applies responsive scaling.
  ///
  /// * See [ResponsiveUtils.setHeight] for more details.
  double get h => ResponsiveUtils.setHeight(this);

  /// Sets the radius of a UI element based on the design size and applies responsive scaling.
  /// 
  /// * See [ResponsiveUtils.setRadius] for more details.
  double get r => ResponsiveUtils.setRadius(this);

  /// Sets the font size of a Text widget based on the design size and applies responsive scaling.
  ///
  /// * See [ResponsiveUtils.setSp] for more details.
  double get sp => ResponsiveUtils.setSp(this);

  /// Calculates a value as a multiple of the screen width.
  ///
  /// This method directly multiplies the current screen width by the provided value.
  double get sw => ResponsiveUtils.screenWidth * this;

  /// Calculates a value as a multiple of the screen height.
  ///
  /// This method directly multiplies the current screen height by the provided value.
  double get sh => ResponsiveUtils.screenHeight * this;
}
