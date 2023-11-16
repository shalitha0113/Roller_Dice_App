import 'package:flutter/material.dart';

class RollerDiceApp extends StatelessWidget {
  const RollerDiceApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text('Roller Dice App 1'),
        ),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 202, 127, 127),
            Color.fromARGB(198, 236, 11, 11)
          ])),
        ),
      ),
    );
  }
}