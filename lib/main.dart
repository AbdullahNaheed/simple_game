import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:simple_app/simple_game.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GameWidget(
      game: SimpleGame(),
      overlayBuilderMap: {
        'Hud':
            (context, game) {
          final simpleGame = game as SimpleGame;
             return ValueListenableBuilder(
               valueListenable: simpleGame.score,
               builder: (context, score, _) {
                 return Align(
                    alignment: Alignment.topCenter,
                    child: Padding(padding: EdgeInsets.all(16),
                      child: Text(
                        'Score: $score',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  );
               }
             );
            },
      },
      initialActiveOverlays: ['Hud'],
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello World!'))),
    );
  }
}
