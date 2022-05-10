import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import "widget_audio.dart";

class ModalQuiz{
  
  var Images = [
    "aurevoir",
    "bonjour",
    "cava",
    "bonnenuit",
  ];
  
  /*
  var audios = [
    WidgetAudio('https://francestoxico.com/wp-content/uploads/2022/05/bonjour_fr.mp3'),
    WidgetAudio('https://francestoxico.com/wp-content/uploads/2022/05/bonjour_fr.mp3'),
    WidgetAudio('https://francestoxico.com/wp-content/uploads/2022/05/bonjour_fr.mp3'),
    WidgetAudio('https://francestoxico.com/wp-content/uploads/2022/05/bonjour_fr.mp3'),
  ];
  */
  

  var questions = [
    "Como se dice adios en fr?",
    "como se dice hola en fr?",
    "como se dice como estas en fr?",
    "como se dice buenas noches en fr"
  ];

  var choices = [
    ["bonjour", "aurevoir", "ca va", "bonne nuit"],
    ["bonne nuit", "ca va", "aurevoir", "bonjour"],
    ["aurevoir", "bonjour", "bonne nuit", "ca va"],
    ["ca va", "bonne nuit", "bonjour", "aurevoir"],
  ];

  var correct = [
    "aurevoir", "bonjour", "ca va", "bonne nuit"
  ];
}

var finalScore = 0;
var NQuestions = 0;
var Quiz = new ModalQuiz();

class Exercise extends StatefulWidget{
  @override
  State<Exercise> createState() {
    return new _ExerciseState();
    }
}

class _ExerciseState extends State<Exercise> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new WillPopScope( 
      onWillPop: ()async => false,
      child: Scaffold(
        body: new Container(
          margin: const EdgeInsets.all(10.0),
          alignment: Alignment.topCenter,
          child: new Column(
            children: [
              new Padding(
                padding: EdgeInsets.all(20.0),
                ),
              new Container(
                alignment: Alignment.centerRight,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    new Text("Pregunta ${NQuestions + 1} of ${Quiz.questions.length}",
                    style: new TextStyle(
                      fontSize: 17.0,
                    ),
                    ),
                    new Text("Puntaje: $finalScore",
                    style: new TextStyle(
                      fontSize: 16.0,
                    ),
                   ),
                  ],
                ),
              ),
              //MEDIA IMAGENES O AUDIOS
              new Padding(
                padding: EdgeInsets.all(10.0)),
                
             // new Image.asset(
                //"lib/assets/palabras/${Quiz.Images[NQuestions]}.png"
              //),
              WAudio(),
              //ModalQuiz().audios[NQuestions],
              
              new Padding(padding: EdgeInsets.all(10.0)),
              new Text(Quiz.questions[NQuestions],
              style: new TextStyle(
                fontSize: 20.0,
              ),),
              new Padding(padding: EdgeInsets.all(10.0)),
              //FILA DE BOTONES 2 COLUNMAS
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //BOTON 1
                  new AnimatedButton(
                        color: Colors.blue,
                        width: 120.0,
                        onPressed: () {

                         if(Quiz.choices[NQuestions][0] == Quiz.correct[NQuestions]){
                           debugPrint("correctoo");
                           finalScore++;
                         } else {
                           debugPrint("Wrong");
                         }
                          updateQuestion();
                        }, 
                        child: new Text(Quiz.choices[NQuestions][0],
                        style: new TextStyle(
                          fontSize: 19.0,
                          color: Colors.black,
                        )),
                        ),
                  //BOTON 2
                  new AnimatedButton(
                        color: Colors.blue,
                        width: 120.0,
                        onPressed: () {

                         if(Quiz.choices[NQuestions][1] == Quiz.correct[NQuestions]){
                           debugPrint("correctoo");
                           finalScore++;
                         } else {
                           debugPrint("Wrong");
                         }
                          updateQuestion();
                        }, 
                        child: new Text(Quiz.choices[NQuestions][1],
                        style: new TextStyle(
                          fontSize: 19.0,
                          color: Colors.black,
                        )),
                        ),
                ],
              ),
              
              new Padding(padding: EdgeInsets.all(10.0)),
              //SEGUNDA FILA DE BOTONES DE 2 COLUMNAS
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //BOTON 3
                  new AnimatedButton(
                        color: Colors.blue,
                        width: 120.0,
                        onPressed: () {

                         if(Quiz.choices[NQuestions][2] == Quiz.correct[NQuestions]){
                           debugPrint("correctoo");
                           finalScore++;
                         } else {
                           debugPrint("Wrong");
                         }
                          updateQuestion();
                        }, 
                        child: new Text(Quiz.choices[NQuestions][2],
                        style: new TextStyle(
                          fontSize: 19.0,
                          color: Colors.black,
                        )),
                        ),
                  //BOTON 4
                  new AnimatedButton(
                        color: Colors.blue,
                        width: 120.0,
                        onPressed: () {

                         if(Quiz.choices[NQuestions][3] == Quiz.correct[NQuestions]){
                           debugPrint("correctoo");
                           finalScore++;
                         } else {
                           debugPrint("Wrong");
                         }
                          updateQuestion();
                        }, 
                        child: new Text(Quiz.choices[NQuestions][3],
                        style: new TextStyle(
                          fontSize: 19.0,
                          color: Colors.black,
                        )),
                        ),
                ],
              ),

              new Padding(padding: EdgeInsets.all(10.0)),

              new Container(
                alignment: Alignment.bottomCenter,
                child: new AnimatedButton(
                  color: Colors.red,
                  width: 100.0,
                  height: 20.0,
                  onPressed: () {}, 
                  child: new Text("Quit",
                  style: new TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                  ),
                 ),
              )

            ],
          ),
        ),
      ),
    );
  }

  void resetQuiz() {
    setState(() {
      Navigator.pop(context);
      finalScore = 0;
      NQuestions = 0;
    });
  }

  void updateQuestion() {
    setState(() {
      if(NQuestions == Quiz.questions.length - 1){
        Navigator.push(context, new MaterialPageRoute(builder: (context) => new Summary(score: finalScore)));
      } else {
          NQuestions++;
      }

    });
  }

}

class Summary extends StatelessWidget{
  final int score;
  Summary({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: ()async => false,
      child: Scaffold(
        body: Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Text("Final Score: ${score}",
              style: new TextStyle(
                fontSize: 25.0,
              ),
              ),
              new Padding(padding: EdgeInsets.all(10.0)),

              new AnimatedButton(
                color: Colors.red,
                onPressed: () {
                  NQuestions = 0;
                  finalScore = 0;
                  Navigator.pop(context);
                }, 
                child: new Text("Reset Quiz",
                style: new TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}