import 'package:flutter/material.dart';
import 'package:zenless_list/detail.dart';
import 'package:zenless_list/model/character_data.dart';
import 'package:transformable_list_view/transformable_list_view.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Character List',
                style: TextStyle(color: Colors.white),
              ),
              Image.asset(
                'assets/images/Zenless_Zone_Zero_logo.png',
                scale: 7,
              )
            ],
          ),
          backgroundColor: Colors.black54,
        ),
        body: SafeArea(
          child: TransformableListView.builder(
            getTransformMatrix: getTransformMatrix,
            itemBuilder: (BuildContext context, index) {
              final Character character = listCharacter[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context) => DetailScreen(character: character)),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                    height: 120,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(character.image),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    character.name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(getTypeImage(character.type)),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Image.asset(getElementImage(character.element),scale: 1.2,),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: listCharacter.length,
          ),
        ),
      ),
    );
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

Matrix4 getTransformMatrix(TransformableListItem item) {
  /// final scale of child when the animation is completed
  const endScaleBound = 0.3;

  /// 0 when animation completed and [scale] == [endScaleBound]
  /// 1 when animation starts and [scale] == 1
  final animationProgress = item.visibleExtent / item.size.height;

  /// result matrix
  final paintTransform = Matrix4.identity();

  /// animate only if item is on edge
  if (item.position != TransformableListItemPosition.middle) {
    final scale = endScaleBound + ((1 - endScaleBound) * animationProgress);

    paintTransform
      ..translate(item.size.width / 2)
      ..scale(scale)
      ..translate(-item.size.width / 2);
  }

  return paintTransform;
}