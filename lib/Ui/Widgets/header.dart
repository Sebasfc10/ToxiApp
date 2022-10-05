import 'package:flutter/material.dart';
import 'package:toxi_app/Ui/Screen/Quiz/card_image_curso_list.dart';
import 'package:toxi_app/Ui/Widgets/gradiant_back.dart';

class Header extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        GradiantBack("Bienvenido"),
        CardImageCursoList(),
        CardImageCursoList(),
      ],
    );
  }

}