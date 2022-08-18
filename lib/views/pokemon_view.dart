import 'package:flutter/material.dart';
import 'package:pokedox/consts.dart';

class PokemonView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.purple, Colors.orange])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Positioned(
                  top: 110,
                  left: 40,
                  child: Opacity(opacity: 0.15,
                      child: Image.asset(
                        PokeConsts.blackPokeball, scale: 0.2,))),
              Positioned(
                top: 60,
                left: 130,
                child: Text(
                  'Bulbasaur',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                left: -3,
                bottom: -40,
                width: 415,
                height: 470,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        // tapview
                        SizedBox(
                          height: 118,
                          width: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                              height: 54,
                              width: 347,
                              child: Text(
                                'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.',
                                style: TextStyle(fontSize: 15),)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Pokedados', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purple),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30,top: 10),
                          child: Row(
                            children: [
                              Text('Espécie', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              SizedBox(height: 18, width: 183,),
                              Text('Seed', style: TextStyle(fontSize: 16),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30,top: 10),
                          child: Row(
                            children: [
                              Text('Peso', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              SizedBox(height: 18, width: 208,),
                              Text('6,9 kg', style: TextStyle(fontSize: 16),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30,top: 10),
                          child: Row(
                            children: [
                              Text('Altura', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              SizedBox(height: 18, width: 199,),
                              Text('73 cm', style: TextStyle(fontSize: 16),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30,top: 10),
                          child: Row(
                            children: [
                              Text('Habilidade', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              SizedBox(height: 18, width: 160,),
                              Text('Folha Navalha', style: TextStyle(fontSize: 16),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30,top: 8),
                          child: Row(
                            children: [
                              Text('Sexo', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              SizedBox(height: 18, width: 208,),
                              Image.asset(PokeConsts.blackPokeball, scale: 2.9,)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
