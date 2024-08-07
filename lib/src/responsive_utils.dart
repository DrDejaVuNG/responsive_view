import 'dart:math';

import 'package:flutter/material.dart';

/// Utility class for handling responsive layouts in Flutter applications.
/// This class helps adapt UI elements based on device screen size while
/// maintaining consistency with a design size.
class ResponsiveUtils {
  static bool _initialized = false;
  static late Size _designSize;
  static late Size _currentSize;
  static late double _minMultiplier;
  static late double _maxMultiplier;

  /// Access the width of the current screen.
  static double get screenWidth => _currentSize.width;

  /// Access the height of the current screen.
  static double get screenHeight => _currentSize.height;

  /// Get the horizontal scaling factor based on the design size.
  static double get ratioX => screenWidth / _designSize.width;

  /// Get the vertical scaling factor based on the design size.
  static double get ratioY => screenHeight / _designSize.height;

  /// Get the average scaling factor of the current device.
  static double get average => (ratioX + ratioY) / 2;

  /// Initializes the ResponsiveUtils class with essential parameters.
  ///
  /// * [initSize]: The size representing your design layout.
  /// * [screenSize]: The size representing the base phone screen size.
  /// * [minMultiple]: The minimum scaling factor allowed for values.
  /// * [maxMultiple]: The maximum scaling factor allowed for values.
  static void init({
    required Size initSize,
    required Size screenSize,
    required double minMultiple,
    required double maxMultiple,
  }) {
    _initialized = true;
    _designSize = initSize;
    _currentSize = screenSize;
    _minMultiplier = minMultiple;
    _maxMultiplier = maxMultiple;
  }

  /// Converts a design-time value to a responsive value based on the current screen size.
  ///
  /// This method ensures values stay within a defined range
  /// specified by [minMultiple] and [maxMultiple].
  ///
  /// * [oldValue]: The value from your design layout.
  /// * [newValue]: The calculated responsive value based on scaling factors.
  static double getValue(num oldValue, double newValue) {
    final minValue = oldValue * _minMultiplier;
    final maxValue = oldValue * _maxMultiplier;
    if (newValue < minValue) return minValue;
    if (newValue > maxValue) return maxValue;
    return newValue;
  }

  /// Sets the width of a UI element based on the design size and applies responsive scaling.
  ///
  /// * [width]: The desired width from your design layout.
  static double setWidth(num width) {
    _assertInitialized();
    final value = width * ratioX;
    return getValue(width, value);
  }

  /// Sets the height of a UI element based on the design size and applies responsive scaling.
  ///
  /// * [height]: The desired height from your design layout.
  static double setHeight(num height) {
    _assertInitialized();
    final value = height * ratioY;
    return getValue(height, value);
  }

  /// Sets the radius of a UI element based on the design size and applies responsive scaling.
  ///
  /// This method uses the minimum scaling factor (ratioX or ratioY) to ensure a
  /// circular shape on all devices.
  ///
  /// * [radius]: The desired radius from your design layout.
  static double setRadius(num radius) {
    _assertInitialized();
    final value = radius * min<double>(ratioX, ratioY);
    return getValue(radius, value);
  }

  /// Sets the font size of a Text widget based on the design size and applies responsive scaling.
  ///
  /// * [fontSize]: The desired font size from your design layout.
  static double setSp(num fontSize) {
    _assertInitialized();
    final value = fontSize * average;
    return getValue(fontSize, value);
  }

  static void _assertInitialized() {
    if (_initialized) return;
    throw FlutterError(
      'Responsive view is uninitialized, you need to Wrap MaterialApp with ResponsiveApp Widget.',
    );
  }
}
