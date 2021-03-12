import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './StartScreen.dart';
import '../components/Chips.dart';
import '../Player.dart';
import '../Board.dart';

class GameScreen extends StatelessWidget {
  static const String id = 'GameScreen';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Consumer<Player1>(
          builder: (context, player1, child) {
            return Consumer<Player2>(
              builder: (context, player2, child) {
                return Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ColorChip(player1.color),
                        Text(
                          "${player1.name} vs ${player2.name}",
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            fontSize: 20
                          )
                        ),
                        ColorChip(player2.color),
                      ],
                    ),
                    Board(player1, player2)
                  ]
                );
              }
            );
          },
        ),
        FlatButton(
          onPressed: () => Navigator.pushNamed(context, StartScreen.id),
          child: Text("Quit Game", style: TextStyle(color: Colors.white))
        ),
      ]
    );
  }
}
