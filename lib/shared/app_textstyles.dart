import 'package:flutter/widgets.dart';

class AppTextStyles {
  static const String inter = 'Inter';

  static TextStyle dynamic(
    double size, {
    Color? color,
    FontWeight? weight,
    double? height,
    double? spacing,
    FontStyle? style,
    String? fontFamily,
  }) {
    return TextStyle(
      fontFamily: fontFamily ?? inter,
      fontSize: size,
      color: color,
      fontWeight: weight,
      height: height == null ? null : height / size,
      letterSpacing: spacing,
      fontStyle: style,
    );
  }

  // Regular
  static const regular10 = TextStyle(
    height: 1.6,
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );

  static const regular12 = TextStyle(
    height: 1.67,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static const regular14 = TextStyle(
    height: 1.42,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const regular16 = TextStyle(
    height: 1.5,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  // Medium
  static const medium12 = TextStyle(
    height: 1.67,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static const medium14 = TextStyle(
    height: 1.42,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const medium16 = TextStyle(
    height: 1.5,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const medium24 = TextStyle(
    height: 1.33,
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );

  static const medium32 = TextStyle(
    height: 1.25,
    fontSize: 32,
    fontWeight: FontWeight.w500,
  );

  // SemiBold
  static const semibold11 = TextStyle(
    height: 1.27,
    fontSize: 11,
    fontWeight: FontWeight.w600,
  );

  static const semibold12 = TextStyle(
    height: 1.67,
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  static const semibold16 = TextStyle(
    height: 1.5,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const semibold24 = TextStyle(
    height: 1.33,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static const semibold32 = TextStyle(
    height: 1.14,
    fontSize: 32,
    fontWeight: FontWeight.w600,
  );

  static const bold60 = TextStyle(
    height: 1.2,
    fontSize: 60,
    fontWeight: FontWeight.w700,
  );
}
