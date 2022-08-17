import 'package:flutter/material.dart';
import 'package:pokedox/consts.dart';

class StartScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PokeConsts.darkBlueBackground,
      body: Center(
        child: Image.asset('assets/images/pokemon_logo.png'),
      ),
    );
  }
}

