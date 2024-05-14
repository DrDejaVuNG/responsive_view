import 'dart:math';

import 'package:flutter/material.dart';

class ResponsiveUtils {
  static late Size designSize;
  static late Size currentSize;
  static late double minMultiplier;
  static late double maxMultiplier;

  static double get screenWidth => currentSize.width;
  static double get screenHeight => currentSize.height;
  static double get ratioX => screenWidth / designSize.width;
  static double get ratioY => screenHeight / designSize.height;
  static double get average => (ratioX + ratioY) / 2;

  static void init({
    required Size initSize,
    required Size phoneSize,
    required double minMultiple,
    required double maxMultiple,
  }) {
    designSize = initSize;
    currentSize = phoneSize;
    minMultiplier = minMultiple;
    maxMultiplier = maxMultiple;
  }

  static double getValue(num oldValue, double newValue) {
    final minValue = oldValue * minMultiplier;
    final maxValue = oldValue * maxMultiplier;
    if (newValue < minValue) return minValue;
    if (newValue > maxValue) return maxValue;
    return newValue;
  }

  static double setWidth(num width) {
    final value = width * ratioX;
    return getValue(width, value);
  }

  static double setHeight(num height) {
    final value = height * ratioY;
    return getValue(height, value);
  }

  static double setRadius(num radius) {
    final value = radius * min<double>(ratioX, ratioY);
    return getValue(radius, value);
  }

  static double setSp(num fontSize) {
    final value = fontSize * average;
    return getValue(fontSize, value);
  }
}
