import 'package:flutter/material.dart';
import 'package:toxi_app/Ui/Screen/Quiz/card_image_curso.dart';

class CardImageCursoList extends StatelessWidget{

  String pathImage = "lib/assets/camisa.png";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      //width: MediaQuery.of(context).size.width,
      //height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.all(35.0),
          //scrollDirection: Axis.vertical,
          children: [
            CardImageCurso(pathImage),
            CardImageCurso(pathImage),
            CardImageCurso(pathImage),
            CardImageCurso(pathImage),
          ],
        ),
        ],
      ),
    );
  }

}