import 'dart:math';

import 'package:flutter/material.dart';

class ResponsiveUtils {
  static bool _initialized = false;
  static late Size _designSize;
  static late Size _currentSize;
  static late double _minMultiplier;
  static late double _maxMultiplier;

  static double get screenWidth => _currentSize.width;
  static double get screenHeight => _currentSize.height;
  static double get ratioX => screenWidth / _designSize.width;
  static double get ratioY => screenHeight / _designSize.height;
  static double get average => (ratioX + ratioY) / 2;

  static void init({
    required Size initSize,
    required Size phoneSize,
    required double minMultiple,
    required double maxMultiple,
  }) {
    _initialized = true;
    _designSize = initSize;
    _currentSize = phoneSize;
    _minMultiplier = minMultiple;
    _maxMultiplier = maxMultiple;
  }

  static double getValue(num oldValue, double newValue) {
    final minValue = oldValue * _minMultiplier;
    final maxValue = oldValue * _maxMultiplier;
    if (newValue < minValue) return minValue;
    if (newValue > maxValue) return maxValue;
    return newValue;
  }

  static double setWidth(num width) {
    assertInitialized();
    final value = width * ratioX;
    return getValue(width, value);
  }

  static double setHeight(num height) {
    assertInitialized();
    final value = height * ratioY;
    return getValue(height, value);
  }

  static double setRadius(num radius) {
    assertInitialized();
    final value = radius * min<double>(ratioX, ratioY);
    return getValue(radius, value);
  }

  static double setSp(num fontSize) {
    assertInitialized();
    final value = fontSize * average;
    return getValue(fontSize, value);
  }

  static void assertInitialized() {
    if (_initialized) return;
    throw FlutterError(
      'Responsive view is un_initialized, you need to Wrap MaterialApp with ResponsiveApp Widget.',
    );
  }
}
