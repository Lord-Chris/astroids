import 'dart:ui';

mixin GameBoundsMixin {
  Size screenSize = Size.zero;

  void updateGameBounds(Size size) {
    screenSize = size;
  }
}
