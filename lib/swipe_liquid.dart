import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class SwipeLiquid extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
           child: Scaffold(
             body: LiquidSwipe(
              enableSideReveal: true,
              slideIconWidget: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              pages: [
           
                //TUTORIAL
                Container(
                  color: Colors.black,
                  child: const Center(child: Text('hola1'),),
                ),
           
           
                Container(
                  color: Colors.white,
                  child: const Center(child: Text('hola2'),),
                ),
           
           
                Container(
                  color: Colors.blue,
                  child: const Center(child: Text('hola3'),),
                ),
                ]
              ),
           ),
         );
  }

}