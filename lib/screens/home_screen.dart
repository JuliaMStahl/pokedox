import 'package:flutter/material.dart';
import 'package:pokedox/components/pokemon_card.dart';
import 'package:pokedox/consts.dart';
import 'package:pokedox/http/webclient.dart';
import 'package:pokedox/modules/pokemon.dart';
import 'package:pokedox/views/poke_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  List<Pokemon> pokemons = [];
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      pokemons = await PokemonWebClient.findAll();

      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(PokeConsts.backgroundHome), fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  width: 240,
                  height: 90,
                  child: Image.asset(PokeConsts.logoPokemon),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 30, right: 30),
                child: TextField(
                  controller: _textController,
                  decoration:
                      const InputDecoration(hintText: 'Find Pokemon by name or id'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () async {
                      final String textInfo =
                          _textController.text.toLowerCase().trim();
                      print(textInfo);

                      final Pokemon? poke = _findPokemonLocal(textInfo);

                      if (poke != null) {
                        print(poke);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PokeView(poke)));
                      } else {
                        print('Não achou o pokemon');
                        showDialog(
                            context: context,
                            builder: (contextDialog) {
                              return FailureDialog(
                                  'Failed looking for Pokemon');
                            });
                      }
                    },
                    child: const Text('Find!')),
              ),
              Visibility(
                visible: !isLoading,
                replacement: const Center(
                  child: CircularProgressIndicator(),
                ),
                child: Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 24,
                    padding: const EdgeInsets.all(37),
                    children: List.generate(
                      pokemons.length,
                      (index) => PokemonCard(pokemons[index]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _findPokemonLocal(String textInfo) {
    final id = int.tryParse(textInfo);
    if (id != null) return pokemons[id - 1];

    final text = textInfo.trim().toLowerCase();
    for (Pokemon pokemon in pokemons) {
      if (pokemon.name == text) {
        return pokemon;
      }
    }
    return null;
  }
}

class FailureDialog extends StatelessWidget {
  final String message;

  FailureDialog(this.message);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Ops...', style: TextStyle(color: Colors.red),),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24.0,
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          child: const Text('Ok'),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
  }
}
