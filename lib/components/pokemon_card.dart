import 'package:flutter/material.dart';
import 'package:pokedox/common/functions.dart';
import 'package:pokedox/consts.dart';
import 'package:pokedox/extentions/string_extention.dart';
import 'package:pokedox/modules/pokemon.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedox/views/poke_view.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  PokemonCard(this.pokemon);

  @override
  Widget build(BuildContext context) {
    final List<Color> colors =
        pokemon.types.first.setColorsByType(pokemon.types.first.type);
    final List<Card> typesCards = generatePokemonTypeCards(pokemon.types);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Ink(
                height: 110,
                width: 172,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      colors.first,
                      colors.last,
                    ],
                  ),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: (() {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PokeView(pokemon)));
                  }),
                  child: SizedBox(
                    width: 172,
                    height: 110,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                formatId(pokemon.id),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                                width: 90,
                              ),
                              Opacity(
                                opacity: 0.15,
                                child: Image.asset(
                                  PokeConsts.blackPokeball,
                                  height: 19,
                                  width: 19,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 22),
                          Text(
                            pokemon.name.capitalize(),
                            style: const TextStyle(fontSize: 19, color: Colors.white),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              typesCards.first,
                              if (typesCards.length > 1) typesCards.last,
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: -20,
            child: Container(
              width: 70,
              height: 120,
              child: Center(
                child: SvgPicture.network(
                  pokemon.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Card PokemonTypeCard(String type) {
    return Card(
      color: Color(0xFFD0F8F5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Text(
          type.capitalize(),
          style: TextStyle(fontSize: 8),
        ),
      ),
    );
  }

  List<Card> generatePokemonTypeCards(List<Type> types) {
    List<Card> cards = [];
    types.forEach((type) {
      cards.add(PokemonTypeCard(type.type));
    });
    return cards;
  }
}
