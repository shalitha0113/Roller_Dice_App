import 'package:flutter/material.dart';
import 'package:roller_dice_app/new_game.dart';
import 'package:roller_dice_app/roller_dice.dart';


const beginAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key,required this.colors});
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: beginAlignment,
                end: endAlignment,
                colors: colors)),
                child: const Center(child: NewGame()),);
  }
}
