import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toxi_app/Ui/Screen/Quiz/TimeLines_Peguntas/time_lines_fr.dart';
import 'package:toxi_app/Ui/Screen/Quiz/Ejercicios/exercise.dart';
import 'package:toxi_app/Ui/Screen/Quiz/join_exercise.dart';



class MyHorizontalList extends StatelessWidget {
  const MyHorizontalList({ Key? key, 
  required this.startColor, 
  required this.endColor, 
  required this.courseTag, 
  required this.courseTitle, 
  required this.courseImg }) 
 : super(key: key);

  final int startColor, endColor;
  final String courseTag, courseTitle, courseImg;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 26),
      child: Container(
        width: 246,
        height: 349,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(22),
        boxShadow: [BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  spreadRadius: 0,
                  blurRadius: 13,
                  offset: const Offset(0, 4),
                )],
                border: Border.all(color: Color(0xFF252525)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: const Alignment(1, 0.0),
          colors: <Color>[
            Color(startColor),
            Color(endColor),
            ],
          ),
        ),
        //CARD DESIGN
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => TimeLinesFR()));
          },
          child: Stack(
            children: [
              //TAG COURSE
              Positioned(
                top: 15,
                left: 11,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: 39,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[100],
                    borderRadius: BorderRadius.circular(36),
                  ),
                  child: Text(courseTag,
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF252525),
                    fontSize: 16,
                  )),
                ),
              ),
        
              //TITLE COURSE
              Positioned(
                top: 80,
                left: 14,
                child: Text(courseTitle,
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25,
                )),
                ),
        
              //IMAG COURSE
              Positioned(
                top: 120,
                left: 10,
                //ASIGN ONE URL ABOUT IMG <CAMISA CON RAYAS>
                child: Stack(
                  children: [
                    Image.asset(
                    courseImg,
                    fit: BoxFit.cover,
                    scale: 4.9,
                    ),
                  ],
                ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}