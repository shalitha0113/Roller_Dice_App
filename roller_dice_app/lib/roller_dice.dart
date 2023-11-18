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
  List<int>playerOneScores=[];
  List<int>playerTwoScores=[];

  void roll() {
    setState(() {
      diceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, 
    children: [
      Text(
        'Round ${(round)+1}',
        style: const TextStyle(color: Colors.white,fontSize: 28),
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
          onPressed: roll,
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
          onPressed: roll,
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
        style: const TextStyle(color: Colors.white,fontSize: 24),
      ),
      const SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const Text(
                'Round#',style: TextStyle(color :Colors.black, fontSize: 20)),
                for (int r=1;r<=playerOneScores.length;r++)
                  Text(
                    'Round $r'
                  )
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            children: [
              const Text('Player 1',
              style: TextStyle(color: Colors.black,fontSize: 20)),
              for(var value in playerOneScores)Text(value.toString())
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            children: [
              const Text('Player 2',
              style: TextStyle(color: Colors.black,fontSize: 20)),
              for(var value in playerTwoScores)Text(value.toString())
            ],
          ),
        ],
      
      ),
    ]);
  }
}
