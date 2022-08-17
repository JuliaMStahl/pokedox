class Pokemon {
  String name;
  PokemonAbout about;
  PokemonAtributes atributes;
  String id;

  Pokemon(
      {required this.name,
      required this.about,
      required this.atributes,
      required this.id});
}

class PokemonAtributes {
  String specialAbility;
  String hp;
  String attack;
  String defense;
  String speed;
  String total;

  PokemonAtributes(
      {required this.specialAbility,
      required this.hp,
      required this.attack,
      required this.defense,
      required this.speed,
      required this.total});
}

class PokemonAbout {
  String specie;
  String height;
  String weight;
  String ability;

  PokemonAbout(
      {required this.specie,
      required this.height,
      required this.weight,
      required this.ability});
}
