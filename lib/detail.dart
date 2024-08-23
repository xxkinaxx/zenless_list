import 'package:flutter/material.dart';
import 'package:zenless_list/model/character_data.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  character.image,
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    character.name,
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text('Rank'),
                        Image.asset(getRankImage(character.rank),
                          scale: 8,),
                      ],
                    ),
                    Column(
                      children: [
                        Text('Element'),
                        Image.asset(getElementImage(character.element),
                          scale: 1,),
                      ],
                    ),
                    Column(
                      children: [
                        Text('Faction'),
                        Image.asset(getFactionImage(character.faction),
                          scale: 4,),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Stats', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Text('HP: '),
                            Text(character.hp)
                          ],
                        ),
                        Row(
                          children: [
                            Text('Attack: '),
                            Text(character.atk)
                          ],
                        ),
                        Row(
                          children: [
                            Text('Def: '),
                            Text(character.def)
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text('Impact: '),
                            Text(character.impact)
                          ],
                        ),
                        Row(
                          children: [
                            Text('Mastery: '),
                            Text(character.mastery)
                          ],
                        ),
                        Row(
                          children: [
                            Text('Proficiency: '),
                            Text(character.proficiency)
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String getRankImage(String data) {
  switch (data) {
    case 'S' : return 'assets/images/s-rank.png';
    case 'A' : return 'assets/images/a-rank.png';
    default : return 'not found';
  }
}

String getElementImage(String data) {
  switch (data) {
    case 'ice' : return 'assets/images/element/ice.png';
    case 'fire' : return 'assets/images/element/fire.png';
    case 'electric' : return 'assets/images/element/electric.png';
    case 'ether' : return 'assets/images/element/ether.png';
    case 'physical' : return 'assets/images/element/physical.png';
    default : return 'not found';
  }
}

String getTypeImage(String data) {
  switch (data) {
    case 'attack' : return 'assets/images/type/attack.webp';
    case 'stun' : return 'assets/images/type/stun.webp';
    case 'support' : return 'assets/images/type/support.webp';
    case 'anomaly' : return 'assets/images/type/anomaly.webp';
    case 'defense' : return 'assets/images/type/defense.webp';
    default : return 'not found';
  }
}

String getFactionImage(String data) {
  switch (data) {
    case 'victoria housekeeping co' : return 'assets/images/faction/victoria_housekeeping_co.png';
    case 'belobog heavy industries' : return 'assets/images/faction/belobog_heavy_industries.png';
    case 'cunning hares' : return 'assets/images/faction/cunning_hares.png';
    default : return 'not found';
  }
}
