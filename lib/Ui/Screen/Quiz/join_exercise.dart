import 'package:flutter/material.dart';
import 'package:animated_button/animated_button.dart';
import 'package:toxi_app/Ui/Screen/Quiz/exercise.dart';


class JoinExercise extends StatefulWidget{
  @override
  State<JoinExercise> createState() => _JoinExerciseState();
}

class _JoinExerciseState extends State<JoinExercise> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedButton(
      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Exercise())), 
      child: Text("Aprender", style: TextStyle(color: Colors.white),),
      duration: 70,
      );
  }
}