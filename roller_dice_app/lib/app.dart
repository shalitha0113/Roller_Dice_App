import 'package:flutter/material.dart';
import 'package:roller_dice_app/gradient_container.dart';

class RollerDiceApp extends StatelessWidget {
  const RollerDiceApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text('Roller Dice App '),
        ),
        body: const GradientContainer(colors: [
            Color.fromARGB(255, 202, 127, 127),
            Color.fromARGB(198, 236, 11, 11)
          ]),
      ),
    );
  }
}




