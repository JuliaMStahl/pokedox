import 'package:flutter/material.dart';
import 'package:pokedox/common/functions.dart';
import 'package:pokedox/consts.dart';
import 'package:pokedox/modules/pokemon.dart';
import 'package:pokedox/extentions/string_extention.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PokeView extends StatefulWidget {
  final Pokemon pokemon;

  PokeView(this.pokemon);

  @override
  State<PokeView> createState() => _PokeViewState();
}

class _PokeViewState extends State<PokeView> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = widget.pokemon.types.first
        .setColorsByType(widget.pokemon.types.first.type);
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      backgroundColor: Colors.transparent,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  colors.last,
                  colors.first,
                ],
              ),
            ),
          ),
          Positioned(
            top: 120,
            child: Image.asset(
              PokeConsts.blackPokeballOpacity,
              scale: 1.2,
            ),
          ),
          Positioned(
            top: 60,
            child: Text(
              widget.pokemon.name.capitalize(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Container(
            // color: Colors.red,
            height: 438,
            width: screenWidth,
            child: Card(
              color: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 60, left: 10, right: 10),
                    child: Row(
                      children: [
                        Container(
                          height: 60,
                          width: 280,
                          // color: Colors.yellow,
                          child: TabBar(
                            controller: _tabController,
                            labelColor: colors.last,
                            unselectedLabelColor: colors.first,
                            indicatorColor: colors.last,
                            indicatorSize: TabBarIndicatorSize.label,
                            labelStyle: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                            tabs: const [
                              Tab(
                                text: 'About',
                                //height: 80,
                              ),
                              Tab(
                                text: 'Atributes',
                                //height: 60,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 100,
                          // color: Colors.purple,
                          child: Align(
                            child: Text(
                              formatId(widget.pokemon.id),
                              style: TextStyle(
                                  fontSize: 24,
                                  color: colors.first,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 10, right: 10),
                    child: Container(
                      height: 300,
                      width: double.maxFinite,
                      // color: Colors.pink,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          showPokedataAbout(),
                          showPokedataAtributes(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: -240,
            child: Container(
              height: 300,
              width: 290,
              child: SvgPicture.network(
                widget.pokemon.image,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column showPokedataAbout() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
              height: 54,
              width: 347,
              child: Text(
                'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.',
                style: TextStyle(fontSize: 15),
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Pokedata',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: widget.pokemon.types.first
                    .setColorsByType(widget.pokemon.types.first.type)
                    .last),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 10),
          child: Row(
            children: [
              const Text('Specie',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 18,
                width: 192,
              ),
              Text(
                getSpecieByLanguage('en'),
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 10),
          child: Row(
            children: [
              const Text('Weight',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 18,
                width: 190,
              ),
              Text(
                '${dataToIS(widget.pokemon.weight)} kg',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 10),
          child: Row(
            children: [
              const Text('Height',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 18,
                width: 193,
              ),
              Text(
                '${dataToIS(widget.pokemon.height)} m',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 10),
          child: Row(
            children: [
              const Text('Ability',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 18,
                width: 194,
              ),
              Text(
                widget.pokemon.abilities.first.ability.capitalize(),
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 8),
          child: Row(
            children: [
              const Text('Gender',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 18,
                width: 189,
              ),
              Text(
                genderToString(widget.pokemon.gender),
                style: const TextStyle(fontSize: 16),
              )
            ],
          ),
        )
      ],
    );
  }

  String getSpecieByLanguage(String language){
    final specieNamesList = widget.pokemon.specie;
    String specieName;

    for(var specie in specieNamesList){
      if (specie.language == language) {
        // remove as últimas 8 letras -> ' Pokemon'
        specieName = specie.specie.substring(0, specie.specie.length-8);
        return specieName;
      }
    }
    // se não encontrar, retornar a espécie em inglês
    return specieNamesList[8].specie;
  }

  Column showPokedataAtributes() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 40, bottom: 5),
          child: Row(
            children: [
              const Text('Special Ability',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 18,
                width: 130,
              ),
              Text(
                widget.pokemon.abilities.last.ability.capitalize(),
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 10),
          child: Row(
            children: [
              const Text('HP',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 18,
                width: 223,
              ),
              Text(
                widget.pokemon.stats.elementAt(0).baseStat.toString(),
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 10),
          child: Row(
            children: [
              const Text('Attack',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 18,
                width: 194,
              ),
              Text(
                widget.pokemon.stats.elementAt(1).baseStat.toString(),
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 10),
          child: Row(
            children: [
              const Text('Defense',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 18,
                width: 182,
              ),
              Text(
                widget.pokemon.stats.elementAt(2).baseStat.toString(),
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 10),
          child: Row(
            children: [
              const Text('Speed',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 18,
                width: 197,
              ),
              Text(
                widget.pokemon.stats.elementAt(3).baseStat.toString(),
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 10),
          child: Row(
            children: [
              const Text('Total',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 18,
                width: 207,
              ),
              Text(
                sumStatsValues(),
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String sumStatsValues() {
    var total = 0;
    widget.pokemon.stats.forEach((stat) => total += stat.baseStat);
    return total.toString();
  }

  String genderToString(int gender) {
    if (gender == 1) return 'Female';
    if (gender == 2) return 'Male';
    return 'Genderless';
  }

  // converts data from the pokemon to International System (meter and kg)
  String dataToIS(int data) {
    return (data / 10).toString();
  }
}
