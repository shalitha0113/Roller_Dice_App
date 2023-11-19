import 'dart:math';

import 'package:flutter/material.dart';

const numberOfRounds = 5;

class RollerDice extends StatefulWidget {
  const RollerDice({super.key});

  @override
  State<RollerDice> createState() => _RollerDiceState();
}

class _RollerDiceState extends State<RollerDice> {
  int diceNumber = 1;
  int round = 0;
  int playerOneWins = 0;
  int playerTwoWins = 0;
  int playerOneRound = 1;
  int playerTwoRound = 1;
  List<int> playerOneScores = [];
  List<int> playerTwoScores = [];
  String whoWins = '';

  void roll() {
    setState(() {
      diceNumber = Random().nextInt(6) + 1;
    });
  }

  playerOneAction() {
    setState(() {
      diceNumber = Random().nextInt(6) + 1;
      playerOneScores.add(diceNumber);
      playerOneRound += 1;
    });
  }

  playerTwoAction() {
    setState(() {
      diceNumber = Random().nextInt(6) + 1;
      playerTwoScores.add(diceNumber);
      playerTwoRound += 1;
    });
  }

  updateRound() {
    setState(() {
      if (playerOneRound == playerTwoRound && round <= numberOfRounds) {
        if (playerOneScores[round] > playerTwoScores[round]) {
          playerOneWins += 1;
        } else if (playerTwoScores[round] > playerOneScores[round]) {
          playerTwoWins += 1;
        }
        round += 1;
      }
      if (round == numberOfRounds) {
        if (playerOneWins > playerTwoWins) {
          whoWins = 'Player 1 Wins..!';
        } else if (playerTwoWins > playerOneWins) {
          whoWins = 'Player 2 wins..!';
        } else {
          whoWins = 'It\'s draw..';
        }
      }
    });
  }

  reset() {
    setState(() {
      diceNumber = 1;
      round = 0;
      playerOneWins = 0;
      playerTwoWins = 0;
      playerOneRound = 1;
      playerTwoRound = 1;
      playerOneScores = [];
      playerTwoScores = [];
    });
  }

  bool isPlayerOneButtonDisable() {
    if (playerOneRound > playerTwoRound) {
      return true;
    }
    return false;
  }

  bool isPlayerTwoButtonDisable() {
    if (playerOneRound == playerTwoRound) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        round == numberOfRounds
            ? Column(
                children: [
                  const Text('Game Over...',
                      style: TextStyle(color: Colors.white, fontSize: 28)),
                  Text(whoWins,
                      style:
                          const TextStyle(color: Colors.black, fontSize: 30)),
                  TextButton(
                      onPressed: reset,
                      child: const Text('Start a New Game!',
                          style: TextStyle(color: Colors.blue, fontSize: 20))),
                ],
              )
            : Column(children: [
                Text(
                  'Round ${(round) + 1}',
                  style: const TextStyle(color: Colors.white, fontSize: 28),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/dice-$diceNumber.png',
                  width: 200,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                        onPressed:
                            isPlayerOneButtonDisable() ? null : playerOneAction,
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.amber,
                          foregroundColor: Colors.black,
                          textStyle: const TextStyle(fontSize: 28),
                        ),
                        child: const Text('Player 1')),
                    const SizedBox(
                      width: 20,
                    ),
                    TextButton(
                        onPressed: isPlayerTwoButtonDisable()
                            ? null
                            : () {
                                playerTwoAction();
                                updateRound();
                              },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.amber,
                          foregroundColor: Colors.black,
                          textStyle: const TextStyle(fontSize: 28),
                        ),
                        child: const Text('Player 2'))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Player 1 : $playerOneWins - $playerTwoWins : Player 2',
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Text('Round#',
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                        for (int r = 1; r <= playerOneScores.length; r++)
                          Text('Round $r')
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        const Text('Player 1',
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                        for (var value in playerOneScores)
                          Text(value.toString())
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        const Text('Player 2',
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                        for (var value in playerTwoScores)
                          Text(value.toString())
                      ],
                    ),
                  ],
                ),
              ])
      ],
    );
  }
}
