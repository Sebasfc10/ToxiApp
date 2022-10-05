import 'package:flutter/material.dart';
import 'package:toxi_app/Ui/Screen/Quiz/Ejercicios/exercise.dart';


class JoinExercise extends StatefulWidget{

  var activo = setState(() => StepState.complete);

  JoinExercise({Key? key, 
  required this.activo,
  required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<JoinExercise> createState() => _JoinExerciseState();

  static setState(StepState Function() param0) {}
}

class _JoinExerciseState extends State<JoinExercise> {

  activo(){
    setState(() => StepState.complete);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Exercise())),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.center,
              //color: Colors.red,
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14.0),
                                  image: new DecorationImage(
                                    image: new AssetImage("lib/assets/wavesexercise.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5, top: 7),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: [
                                        Text(widget.title, 
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          fontFamily: "Lato"
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                ]),
              ),
              
          ),
        ],
      ),
    );
      
  }
}