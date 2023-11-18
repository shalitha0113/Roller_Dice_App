import 'dart:math';

import 'package:flutter/material.dart';

class RollerDice extends StatefulWidget {
  const RollerDice({super.key});

  @override
  State<RollerDice> createState() => _RollerDiceState();
}

class _RollerDiceState extends State<RollerDice> {
 
  var diceNumer = 1;

  void roll() {
    setState(() {
      diceNumer = Random().nextInt(6) +1;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Image.asset(
        'assets/images/dice-$diceNumer.png',
        width: 200,
      ),
      const SizedBox(
        height: 20,
      ),
      TextButton(
          onPressed: roll,
          style: TextButton.styleFrom(
            backgroundColor: Colors.amber,
            foregroundColor: Colors.black,
            textStyle: const TextStyle(fontSize: 28),
          ),
          child: const Text('Roller once'))
    ]);
  }
}

