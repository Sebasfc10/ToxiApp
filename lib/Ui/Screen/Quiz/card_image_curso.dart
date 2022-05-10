import 'package:flutter/material.dart';
import 'package:toxi_app/Ui/Screen/Quiz/TimeLines_Peguntas/time_lines_fr.dart';

class CardImageCurso extends StatelessWidget{

  String pathImage = "lib/assets/camisa.png";

  CardImageCurso(this.pathImage);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final cardLanguajes = InkWell(
    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TimeLinesFR())),
    child: Container(
      height: 340.0,
      width: 240.0,
      margin: EdgeInsets.only(
        top: 60.0,
        left: 30.0,
        bottom: 20.0,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(pathImage),
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 15.0,
            offset: Offset(0.0, 7.0),
            ),
          ],
      ),
    ),
    );

    return Stack(
      alignment: Alignment(0.9, 1.0),
      children: [
        cardLanguajes,
      ],
    );
  }
}