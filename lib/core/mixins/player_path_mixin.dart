import 'dart:math';
import 'dart:ui';

mixin PlayerPathMixin {
  final List<Offset> _path = [];
  List<Offset> get path => _path;

  void updatePath(Offset position) {
    if (_path.length >= 20) {
      _path.removeAt(0);
    }
    _path.add(position);
  }

  void clearPath() {
    _path.clear();
  }

  Offset get directionOffset {
    final first = _path.first;
    final last = _path.last;

    final avgDx = last.dx - first.dx;
    final avgDy = last.dy - first.dy;

    return Offset(avgDx, avgDy);
  }

  double get playerDirection => atan2(directionOffset.dy, directionOffset.dx);
}