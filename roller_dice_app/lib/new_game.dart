import 'package:flutter/material.dart';
import 'package:roller_dice_app/roller_dice.dart';

class NewGame extends StatefulWidget {
  const NewGame({super.key});

  @override
  State<NewGame> createState() => _NewGameState();
}

class _NewGameState extends State<NewGame> {
  bool isGameStarted = false;

  @override
  Widget build(BuildContext context) {
    return isGameStarted
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const RollerDice(),
              const SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isGameStarted = false;
                  });
                },
                child: const Text(
                  '< Back to Home',
                  style: TextStyle(color: Colors.blue, fontSize: 25),
                ),
              )
            ],
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 70),
                  child: const Text(
                    'Welcome to Roller Dice App!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 42,
                        fontWeight: FontWeight.bold),
                  )),
              TextButton(
                  onPressed: () {
                    setState(() {
                      isGameStarted = true;
                    });
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                      textStyle: const TextStyle(fontSize: 28),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Play New Game'),
                  ))
            ],
          );
  }
}
