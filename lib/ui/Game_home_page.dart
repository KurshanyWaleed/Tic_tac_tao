import 'package:flutter/material.dart';
import 'package:tictoa/ui/app_color.dart';
import 'package:tictoa/ui/game_logic.dart';

class GameHomePage extends StatefulWidget {
  const GameHomePage({Key? key}) : super(key: key);

  @override
  _GameHomePageState createState() => _GameHomePageState();
}

class _GameHomePageState extends State<GameHomePage> {
  String textLight = 'Hello light theme';
  String textDark = 'Hello dark theme';
  String lassValue = 'X';
  bool gameOver = false;
  Game game = Game();
  int turn = 0;
  String result = "";
  List<int> scoreBoard = [0, 0, 0, 0, 0, 0, 0, 0, 0];

  @override
  void initState() {
    super.initState();
    game.board = Game.initGameBoard();
  }

  @override
  Widget build(BuildContext context) {
    print(game.board);
    double boardWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "It's $lassValue turn".toUpperCase(),
            style: const TextStyle(color: Colors.white, fontSize: 58),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            height: boardWidth,
            width: boardWidth,
            child: GridView.count(
              crossAxisCount: Game.boardlen ~/ 3,
              padding: const EdgeInsets.all(16.0),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              children: List.generate(Game.boardlen, (index) {
                return InkWell(
                  onTap: gameOver
                      ? null
                      : () {
                          if (game.board![index] == "") {
                            setState(() {
                              game.board![index] = lassValue;
                              turn++;
                              gameOver = game.winerCheck(
                                  lassValue, index, scoreBoard, 3);
                              if (gameOver) {
                                result =
                                    "-*-*-* $lassValue is the Winner ! :D -*-*-*";
                              } else if (!gameOver && turn == 9) {
                                result = "It 's a Draw ! ";
                                gameOver = true;
                              }
                              if (lassValue == "X") {
                                lassValue = "O";
                              } else {
                                lassValue = "X";
                              }
                            });
                          }
                        },
                  child: Container(
                    width: Game.blocSize,
                    height: Game.blocSize,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(14)),
                    child: Center(
                      child: Text(
                        game.board![index],
                        style: TextStyle(
                          color: game.board![index] == 'X'
                              ? Colors.blue
                              : Colors.white,
                          fontSize: 64.0,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(
            height: 30.0,
            child: Text(
              result,
              style: const TextStyle(color: Colors.white, fontSize: 22.0),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                game.board = Game.initGameBoard();
                lassValue = "X";
                gameOver = false;
                turn = 0;
                result = '';
                scoreBoard = [0, 0, 0, 0, 0, 0, 0, 0, 0];
              });
            },
            icon: const Icon(Icons.replay),
            label: const Text('Replay the Game'),
          )
        ],
      ),
    );
  }
}
