import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Paddle extends RectangleComponent {
  final bool isPlayer;
  final double speed;

  Paddle({
    required Vector2 position,
    required Vector2 size,
    required this.isPlayer,
    required this.speed,
    Color color = Colors.white,
  }) : super(
      position: position,
      size: size,
      paint: Paint()
        ..color = color
  );

  void moveTo(double y, double dt) {
    if((y - position.y).abs() > 1){
      double dir = (y > position.y) ? 1 : -1;
      position.y += dir * speed * dt;

    }
  }
}