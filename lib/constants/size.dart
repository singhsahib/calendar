import 'dart:math';
import 'package:flutter/material.dart';

class CustomSize {
  static const double base_width = 392.72727272727275;
  static const double base_height = 781.0909090909091;

  static double getWidth(double curr_width, double value) {
    return (curr_width / base_width) * value;
  }

  static double getHeight(double curr_height, double value) {
    return (curr_height / base_height) * value;
  }

  static double getAppbarHeight(double curr_height) {
    return (curr_height / base_height) * 90;
  }

  static double size(
    double curr_width,
    double curr_height,
    double value,
  ) {
    double curr_area =
        sqrt(curr_width * curr_width + curr_height * curr_height);
    double base_area =
        sqrt(base_width * base_width + base_height * base_height);

    return (curr_area / base_area) * value;
  }

  static Size widgetSize(
    double curr_width,
    double curr_height,
    double value_w,
    double value_h,
  ) {
    return Size(
      getWidth(curr_width, value_w),
      getHeight(curr_height, value_h),
    );
  }

  static Radius getRadius({
    required double curr_width,
    required double curr_height,
    required double value,
  }) {
    return Radius.circular(
      size(curr_width, curr_height, value),
    );
  }

  static EdgeInsets padding(
    double curr_width,
    double curr_height,
    double value,
  ) {
    return EdgeInsets.symmetric(
      vertical: getHeight(curr_height, value),
      horizontal: getWidth(curr_width, value),
    );
  }

  static EdgeInsets horizontalPadding(double curr_width, double value) {
    return EdgeInsets.symmetric(
      horizontal: getWidth(curr_width, value),
    );
  }

  static EdgeInsets verticalPadding(double curr_width, double value) {
    return EdgeInsets.symmetric(
      vertical: getHeight(curr_width, value),
    );
  }

  static EdgeInsets symmetricalPadding(
    double curr_width,
    double curr_height,
    double horizontal,
    double vertical,
  ) {
    return EdgeInsets.symmetric(
      horizontal: getWidth(curr_width, horizontal),
      vertical: vertical,
    );
  }
}
