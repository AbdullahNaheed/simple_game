import 'dart:ui';

import 'package:flame/components.dart';

class Ball extends CircleComponent {
  Vector2 velocity;
  final double radius;

  Ball({
    required this.radius,
    required Vector2 position,
    required this.velocity,
    required Color color,
  }) : super(position: position, radius: radius, paint: Paint()..color = color);

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    position += velocity * dt;
  }
}

class BallTrail extends CircleComponent {
  BallTrail(Vector2 position, double radius ,Color color) : super(
    position: position,
  radius: radius,
  paint: Paint()..color = color.withOpacity(0.3)
  );

    @override
      void update(double dt) {
      super.update(dt);
      double nextOpacity = paint.color.opacity - 0.01;

      if(nextOpacity <= 0){
        removeFromParent();
      } else {
        paint.color = paint.color.withOpacity(nextOpacity);
      }

  }
}