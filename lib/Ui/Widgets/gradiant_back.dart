import 'package:flutter/material.dart';

class GradiantBack extends StatelessWidget{

  String title = "Bienvenido";

  GradiantBack(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 250.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFF9FAFE),
            Color(0xFFF9FAFE),
            //Colors.black,
            //Colors.white
          ],
          begin: FractionalOffset(0.2, 0.0),
          end: FractionalOffset(1.0, 0.6),
          stops: [0.0, 0.6],
          tileMode: TileMode.clamp
          ),
      ),
      child: Text(title,
      style: TextStyle(
        color: Color(0xFF262C4D),
        fontSize: 40.0,
        fontFamily: "Lato",
        fontWeight: FontWeight.bold,
       ),
      ),
      alignment: Alignment(-0.9, -0.6),
    );
  }

}