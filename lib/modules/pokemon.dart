import 'package:flutter/material.dart';
import 'package:pokedox/consts.dart';

class Pokemon {
  final int id;
  final String name;
  final String image;
  final int weight;
  final int height;
  final List<Ability> abilities;
  final List<PokemonStatData> stats;
  final List<Type> types;
  final int gender;
  final List<Genera> specie;

  const Pokemon(
      {required this.id,
      required this.name,
      required this.image,
      required this.weight,
      required this.height,
      required this.stats,
      required this.abilities,
      required this.types,
      required this.gender,
      required this.specie});

  Pokemon.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        image = json['sprites']['other']['dream_world']['front_default'],
        weight = json['weight'],
        height = json['height'],
        stats = (json['stats'] as List)
            .map((e) => PokemonStatData.fromJson(e))
            .toList(),
        abilities = (json['abilities'] as List)
            .map((e) => Ability.fromJson(e))
            .toList(),
        types = (json['types'] as List)
            .map((e) => Type.fromJson(e))
            .toList(),
        gender = json['gender_rate'],
        specie = (json['genera'] as List)
            .map((e) => Genera.fromJson(e))
            .toList();

  @override
  String toString() {
    print('CAIU AQUI');
    stats.forEach((element) {
      print(
          'Stat name : ${element.statName.name} && Stat value : ${element.baseStat}');
    });
    abilities.forEach((element) {
      print('Ability name: ${element.ability}');
    });
    types.forEach((element) {
      print('Type name: ${element.type}');
    });
    specie.forEach((element) {
      print('Genera: ${element.specie}');
    });

    return 'Pokemon{id: $id, name: $name, weight: $weight, height $height, gender: $gender';
  }
}

class Genera {
  final String specie;
  final String language;

  Genera(this.specie, this.language);

  @override
  String toString() {
    return 'Genera{specie: $specie, language: $language}';
  }

  Genera.fromJson (Map<String, dynamic> json) :
      specie = json['genus'],
      language = json['language']['name'];
}

class Type {
  final String type;

  Type({required this.type});

  @override
  String toString() {
    return 'Type{type: $type}';
  }

  Type.fromJson(Map<String, dynamic> json) : type = json['type']['name'];

  List<Color> setColorsByType(String type) {
    List<Color> colors = [];
    switch(type){
      case 'grass': {
        colors.add(PokemonColors.grass);
        colors.add(PokemonColors.grassDark);
      }
      break;
      case 'normal': {
        colors.add(PokemonColors.normal);
        colors.add(PokemonColors.normalDark);
      }
      break;
      case 'fire': {
        colors.add(PokemonColors.fire);
        colors.add(PokemonColors.fireDark);
      }
      break;
      case 'water': {
        colors.add(PokemonColors.water);
        colors.add(PokemonColors.waterDark);
      }
      break;
      case 'eletric': {
        colors.add(PokemonColors.eletric);
        colors.add(PokemonColors.eletricDark);
      }
      break;
      case 'ice': {
        colors.add(PokemonColors.ice);
        colors.add(PokemonColors.iceDark);
      }
      break;
      case 'fighting': {
        colors.add(PokemonColors.fighting);
        colors.add(PokemonColors.fightingDark);
      }
      break;
      case 'poison': {
        colors.add(PokemonColors.poison);
        colors.add(PokemonColors.poisonDark);
      }
      break;
      case 'ground': {
        colors.add(PokemonColors.ground);
        colors.add(PokemonColors.groundDark);
      }
      break;
      case 'flying': {
        colors.add(PokemonColors.flying);
        colors.add(PokemonColors.flyingDark);
      }
      break;
      case 'psychic': {
        colors.add(PokemonColors.psychic);
        colors.add(PokemonColors.psychicDark);
      }
      break;
      case 'bug': {
        colors.add(PokemonColors.bug);
        colors.add(PokemonColors.bugDark);
      }
      break;
      case 'rock': {
        colors.add(PokemonColors.rock);
        colors.add(PokemonColors.rockDark);
      }
      break;
      case 'ghost': {
        colors.add(PokemonColors.ghost);
        colors.add(PokemonColors.ghostDark);
      }
      break;
      case 'dragon': {
        colors.add(PokemonColors.dragon);
        colors.add(PokemonColors.dragonDark);
      }
      break;
      case 'dark': {
        colors.add(PokemonColors.dark);
        colors.add(PokemonColors.darkDark);
      }
      break;
      case 'steel': {
        colors.add(PokemonColors.steel);
        colors.add(PokemonColors.steelDark);
      }
      break;
      case 'fairy': {
        colors.add(PokemonColors.fairy);
        colors.add(PokemonColors.fairyDark);
      }
      break;
      default: {
        colors.add(Colors.blue);
        colors.add(Colors.blue.shade800);
      }
    }
    return colors;
  }

}

class Ability {
  final String ability;

  Ability({required this.ability});

  @override
  String toString() {
    return 'Ability{ability: $ability}';
  }

  Ability.fromJson(Map<String, dynamic> json)
      : ability = json['ability']['name'];
}

class PokemonStatName {
  final String name;

  PokemonStatName({required this.name});

  @override
  String toString() {
    return 'PokemonStatName{name: $name}';
  }

  PokemonStatName.fromJson(Map<String, dynamic> json) : name = json['name'];
}

class PokemonStatData {
  final int baseStat;
  final PokemonStatName statName;

  PokemonStatData({required this.baseStat, required this.statName});

  @override
  String toString() {
    return 'PokemonStatData{baseStat: $baseStat, statName: $statName}';
  }

  PokemonStatData.fromJson(Map<String, dynamic> json)
      : baseStat = json['base_stat'],
        statName = PokemonStatName.fromJson(json['stat']);
}

class PokemonName {
  final String name;

  PokemonName(this.name);

  @override
  String toString() {
    return 'PokemonName{name: $name}';
  }

  PokemonName.fromJson(Map<String, dynamic> json) : name = json['results']['name'];
}
