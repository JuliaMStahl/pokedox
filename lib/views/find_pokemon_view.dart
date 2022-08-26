import 'package:flutter/material.dart';
import 'package:pokedox/http/webclient.dart';
import 'package:pokedox/modules/pokemon.dart';
import 'package:pokedox/views/pokemon_view.dart';

class FindPokemonView extends StatefulWidget {

  @override
  State<FindPokemonView> createState() => _FindPokemonViewState();
}

class _FindPokemonViewState extends State<FindPokemonView> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Find Pokemon by name or id'
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () async {
                  final String poke = _textController.text.toLowerCase().trim();
                  print(poke);
                  final Pokemon? pokemon = await PokemonWebClient.findPokemon(poke);
                  if(pokemon != null){
                    print(pokemon.toString());
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PokemonView(pokemon)));
                  } else {
                    print('pokemon não econtrado');
                  }
                },
                child: Text('Find!')),
          )
        ],
      ),
    );
  }
}
