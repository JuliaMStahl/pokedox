import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:pokedox/modules/pokemon.dart';
import 'interceptors/logging_interceptor.dart';

final Client client = InterceptedClient.build(
  interceptors: [LoggingInterceptor()],
  requestTimeout: const Duration(seconds: 3),
);

class PokemonWebClient {
  static Future<Pokemon> findPokemon(String poke) async {
    final uriPokemon = Uri.parse('https://pokeapi.co/api/v2/pokemon/$poke/');

    final Response responsePokemon = await client.get(uriPokemon);

    if (responsePokemon.statusCode != 200) {
      throw HttpException('Failed request', uri: uriPokemon);
    }

    final uriPokemonSpecies = Uri.parse('https://pokeapi.co/api/v2/pokemon-species/$poke/');
    final Response responsePokemonSpecies = await client.get(uriPokemonSpecies);
    final decodedJsonSpecies = jsonDecode(responsePokemonSpecies.body);

    if (responsePokemonSpecies.statusCode != 200) {
      throw HttpException('Failed request', uri: uriPokemonSpecies);
    }

    final decodedJson = jsonDecode(responsePokemon.body);
    decodedJson.addAll(decodedJsonSpecies);
    return Pokemon.fromJson(decodedJson);
  }

  static Future<List<Pokemon>> findAll() async {
    final List<Pokemon> pokemons = [];
    for(int i = 1; i<21; i++){
      try{
        pokemons.add(await findPokemon('$i'));
      }
      catch(e){
        throw e;
      }
    }
    return pokemons;
  }

}
