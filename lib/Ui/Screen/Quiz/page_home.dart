import 'package:flutter/material.dart';
import 'package:toxi_app/Ui/Widgets/header.dart';

class PageHome extends StatelessWidget{

  String pathImage = "lib/assets/camisa.png";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      backgroundColor: Colors.amber,
      body: SingleChildScrollView(
        //scrollDirection: Axis.vertical,
        child: Column(
              children: [
                Header(),
              ],
        ),
      ),
    );
  }

}