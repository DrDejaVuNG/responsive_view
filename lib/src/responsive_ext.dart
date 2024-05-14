import 'package:responsive_view/src/responsive_utils.dart';

extension ResponsiveExtension on num {
  ///
  double get w => ResponsiveUtils.setWidth(this);

  ///
  double get h => ResponsiveUtils.setHeight(this);

  ///
  double get r => ResponsiveUtils.setRadius(this);

  ///
  double get sp => ResponsiveUtils.setSp(this);

  /// Multiple of screen width
  double get sw => ResponsiveUtils.screenWidth * this;

  /// Multiple of screen height
  double get sh => ResponsiveUtils.screenHeight * this;
}
