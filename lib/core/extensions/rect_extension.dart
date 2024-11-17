import 'dart:ui';

extension RectExt on Rect {
  operator +(double value) => Rect.fromCenter(
        center: center,
        width: width + value,
        height: height + value,
      );
}
