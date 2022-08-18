import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 24,
          padding: const EdgeInsets.all(37),
          children: [
            PokemonCard(),
            PokemonCard(),
            PokemonCard(),
            PokemonCard(),
            PokemonCard(),
            PokemonCard(),
            PokemonCard(),
            PokemonCard(),
            PokemonCard(),
            PokemonCard(),
          ],
        ),
    );
  }
}

class PokemonCard extends StatelessWidget {
  const PokemonCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Ink(
              height: 110,
              width: 172,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.blue,
                        Colors.pink,
                      ])),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: (() {}),
                child: SizedBox(
                  width: 172,
                  height: 110,
                  child: Center(
                    child: Text('pokemon.name'),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
