import 'dart:math';

import 'package:flutter/material.dart';

import '../../core/extensions/_extensions.dart';
import '../../shared/_constants.dart';
import '../states/game_notifier.dart';
import '../states/game_state.dart';

class ParticlesZone extends StatelessWidget {
  const ParticlesZone({super.key});

  @override
  Widget build(BuildContext context) {
    final gameNotifier = GameNotifier();
    return ValueListenableBuilder(
      valueListenable: gameNotifier,
      builder: (context, state, child) {
        return Stack(
          fit: StackFit.expand,
          children: [
            for (var i = 0; i < state.particles.length; i++)
              Positioned.fromRect(
                rect: Rect.fromCenter(
                  center: state.particles[i].position,
                  width: state.particles[i].size,
                  height: state.particles[i].size,
                ),
                child: SizedBox.fromSize(
                  size: Size.square(state.particles[i].size),
                  child: CustomPaint(
                    painter: ParticleClipper(state.particles[i].vertices),
                  ),
                ),
              ),
            for (var i = 0; i < state.bullets.length; i++)
              Positioned.fromRect(
                rect: Rect.fromCenter(
                  center: state.bullets[i].position,
                  width: state.bullets[i].size,
                  height: state.bullets[i].size,
                ),
                child: CircleAvatar(
                  backgroundColor: context.cScheme.onBackground,
                ),
              ),
            Positioned(
              top: 10,
              left: 10,
              child: Text(
                'Timer: ${state.formattedDuration}',
                style: AppTextStyles.medium24,
              ),
            ),
          ],
        );
      },
    );
  }
}

class ParticleClipper extends CustomPainter {
  List<Offset> vertices;
  ParticleClipper(this.vertices);

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final paint = Paint()
      ..color = AppColors.errorRed
      ..strokeWidth = size.width / 2
      ..style = PaintingStyle.fill;

    if (vertices.length < 3) {
      path.addArc(
        Rect.fromCenter(
          center: size.center(Offset.zero),
          width: size.width,
          height: size.height,
        ),
        0,
        2 * pi,
      );
      canvas.drawPath(path, paint);
      return;
    }

    // final drawLines = <(Offset, Offset)>{};
    path.moveTo(vertices[0].dx, vertices[0].dy);
    for (int i = 1; i < vertices.length; i++) {
      // TEST
      // for (int j = 0; j < vertices.length; j++) {
      //   final line = (vertices[i], vertices[j]);
      //   if (drawLines.contains(line)) continue;

      //   path.lineTo(vertices[j].dx, vertices[j].dy);
      //   drawLines.add(line);
      // }
      // path.moveTo(vertices[i].dx, vertices[i].dy);

      path.lineTo(vertices[i].dx, vertices[i].dy);
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
