import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(DicePage());

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNum = 1;
  int rightDiceNum = 1;
  int leftWin = 0;
  int rightWin = 0;
  int playCount = 0;
  int tieCount = 0;
  String showWinner = 'Press the dice to start';

  void changeDiceFace() {
    setState(() {
      leftDiceNum = Random().nextInt(6) + 1;
      rightDiceNum = Random().nextInt(6) + 1;

      if (leftDiceNum > rightDiceNum) {
        showWinner = 'Left Dice Wins';
        leftWin++;
        playCount++;
      }

      if (rightDiceNum > leftDiceNum) {
        showWinner = 'Right Dice Wins';
        rightWin++;
        playCount++;
      }

      if (leftDiceNum == rightDiceNum) {
        showWinner = 'We Have A Tie!';
        tieCount++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.red,
          title: Text('Probability Counter'),
        ),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$showWinner',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: changeDiceFace,
                            child: Image.asset('images/dice$leftDiceNum.png'),
                          ),
                          Text(
                            'Wins: $leftWin',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: changeDiceFace,
                            child: Image.asset('images/dice$rightDiceNum.png'),
                          ),
                          Text(
                            'Wins: $rightWin',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: 32, bottom: 32),
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Draw: $tieCount',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Play Count: $playCount',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
