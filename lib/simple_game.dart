


import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'ball.dart';

class SimpleGame extends FlameGame with HasGameReference {
  final ValueNotifier<int> score = ValueNotifier<int>(0);
  late Ball _ball;
  Color bgColor  = Colors.black;

  @override
  Future<void> onLoad()  async{
    // TODO: implement onLoad
    // return super.onLoad();
    // initialize game objects
    _ball = Ball(position: Vector2(size.x / 2, size.y / 2), radius: 20, velocity: Vector2(150, 200), color: Colors.red);
    add(_ball);

  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    final pos  = _ball.position;
    final vel = _ball.velocity;
    bool bounces = false;

    if (pos.x - _ball.radius <= 0 && vel.x < 0 ) {
      _ball.velocity.x = -vel.x;
      bounces = true;
      score.value++;
    }
    if(pos.x + _ball.radius >= size.x && vel.x > 0) {
      _ball.velocity.x = -vel.x;
      bounces = true;
      score.value++;
    }
    if(pos.y + _ball.radius <= 0 && vel.y < 0) {
      _ball.velocity.y =  -vel.y;
      bounces = true;
      score.value++;
    }
    if(pos.y +_ball.radius >= size.y && vel.y > 0){
      _ball.velocity.y = -vel.y;
      bounces = true;
      score.value++;
    }

    add(BallTrail(_ball.position, _ball.radius, Colors.greenAccent));


    if(bounces){
      bgColor = Color(0xFF000000 + Random().nextInt(0xFFFFFF)).withOpacity(0.3);
    }
  }


  @override
  void render(Canvas canvas){
    canvas.drawRect(Rect.fromLTRB(0, 0, size.x, size.y), Paint()..color = bgColor);
    super.render(canvas);
  }


   @override
void onTapDown(TapDownInfo event) {
    _ball.position = event.eventPosition.global;
    // give randow velocity
    final rnd = Random();
     _ball.velocity = Vector2(
         (rnd.nextDouble() * 400) - 200,
       (rnd.nextDouble() * 400) - 200,
     );
   }


}