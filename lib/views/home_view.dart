import 'package:flutter/material.dart';
import 'package:pokedox/consts.dart';

class HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PokeConsts.whiteBackground,
      body: Stack(
        children: [
          Positioned(
            right: -35,
            child: Opacity(
                opacity: 0.15,
              child: Image.asset(PokeConsts.blackPokeball, width: 73.98, height: 147.96,),
            ),
          ),
          Container(
            child: Image.asset(PokeConsts.logoPokemon),
          ),
        ],
      ),
    );
  }
}


