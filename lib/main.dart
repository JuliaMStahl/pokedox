import 'package:flutter/material.dart';
import 'package:pokedox/components/pokemon_card.dart';
import 'package:pokedox/http/webclient.dart';
import 'package:pokedox/modules/pokemon.dart';
import 'package:pokedox/screens/home_screen.dart';
import 'package:pokedox/views/find_pokemon_view.dart';
import 'package:pokedox/views/home_view.dart';
import 'package:pokedox/views/pokemon_view.dart';
import 'package:pokedox/screens/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: PokemonView(),
      // home: Center(
      //   child: PokemonCard(),
      // ),
       // home: FindPokemonView(),
      home: HomeScreen(),
    );
  }
}