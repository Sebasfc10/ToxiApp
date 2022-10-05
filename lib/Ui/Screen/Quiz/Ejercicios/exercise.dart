
import 'package:flutter/material.dart';
import 'package:toxi_app/Ui/Widgets/warning_widget_change_notifier.dart';
import '../TimeLines_Peguntas/time_lines_fr.dart';
import '../widget_audio.dart';
import 'package:google_fonts/google_fonts.dart';

class ModalQuiz{
  /*
  var Images = [
    "aurevoir",
    "bonjour",
    "cava",
    "bonnenuit",
  ];
  */
  
  
  var audios = [
   'https://firebasestorage.googleapis.com/v0/b/toxiapp-5cb77.appspot.com/o/Salut.m4a?alt=media&token=259e7e24-8db4-43fd-9149-b484849e557d',
   'https://firebasestorage.googleapis.com/v0/b/toxiapp-5cb77.appspot.com/o/Bonjour.m4a?alt=media&token=0c22fad7-9f46-4477-8c00-3a7a261fb6a0',
   'https://firebasestorage.googleapis.com/v0/b/toxiapp-5cb77.appspot.com/o/Bonsoir.m4a?alt=media&token=91743d0b-d3c2-491d-993f-a86bfb59fcb6',
   'https://firebasestorage.googleapis.com/v0/b/toxiapp-5cb77.appspot.com/o/Coucou.m4a?alt=media&token=114d804c-d1f8-44c3-8fb6-6ec80a070675',
  ];
  
  

  var questions = [
    "¿Que dice el audio?",
    "¿Que dice el audio?",
    "¿Que dice el audio?",
    "¿Que dice el audio?"
  ];

  var choices = [
    ["Bonjour", "Au revoir", "Ca va", "Salut"],
    ["Bonne nuit", "Coucou", "Au revoir", "Bonjour"],
    ["Au revoir", "Bonsoir", "Bonne nuit", "Ca va"],
    ["Ca va", "Bonne nuit", "Coucou", "Au revoir"],
  ];

  var correct = [
    "Salut", "Bonjour", "Bonsoir", "Coucou"
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
      backgroundColor:Color(0xffF9F5F4),
      body: SafeArea(
        child: ListView(
          children: [
            const WarningWidgetChangeNotifier(),
            new Container(
            height: MediaQuery.of(context).size.height.round() * 0.91,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  spreadRadius: 0,
                  blurRadius: 13,
                  offset: const Offset(0, 4),
                )
              ],
              // ignore: prefer_const_constructors
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: const Alignment(1, 0.0),
                // ignore: prefer_const_literals_to_create_immutables
                colors: <Color>[
                  Colors.white,
                  Colors.white,
                ],
              ),
              ),
              // ignore: unnecessary_new
              child: Stack(
                children: 
                [
                  Column(
                  children: [
                  Container(
                  alignment: Alignment.centerRight,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        //color: Colors.red,
                        child: new Text("Pregunta ${NQuestions + 1}/${Quiz.questions.length}",
                        style: new TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),
                      new Text("Correctas: $finalScore",
                      style: new TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                     ),
                    ],
                  ),
                ),
                          new Padding(
                  padding: EdgeInsets.all(10.0)),
              
                          WAudio(audioUrl: '${Quiz.audios[NQuestions]}',),  
              
                    new Stack(
                      children: 
                      [
                      new Container(
                        
                        margin: const EdgeInsets.only(top: 80, left: 30, right: 30, bottom: 25),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xffF9F5F4),
                        ),
                        
                        // ignore: unnecessary_new
                        child: new Column(
                          children: [
                              new Padding(padding: EdgeInsets.all(15.0)),
                              Padding(
                                padding: EdgeInsets.only(right: 8, left: 8),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width * 0.75, 
                                  height: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: new Text(Quiz.questions[NQuestions],
                                  style: GoogleFonts.roboto(
                                    fontSize: 15.0,
                                  ),),
                                ),
                              ),
                            new Padding(padding: EdgeInsets.all(10.0)),
                            // ignore: unnecessary_new
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                   width: MediaQuery.of(context).size.width * 0.65, // Will take 50% of screen space
                                   child: OutlinedButton(
                                      child: Text(Quiz.choices[NQuestions][0]),
                                      style: OutlinedButton.styleFrom(
                                        primary: Colors.white,
                                        textStyle: TextStyle(
                                          fontSize: 20,
                                        ),
                                        backgroundColor: Colors.black,
                                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                      ),
                                      onPressed: () {
                                        if(Quiz.choices[NQuestions][0] == Quiz.correct[NQuestions]){
                                   debugPrint("correctoo");
                                   finalScore++;
                                 } else {
                                   debugPrint("Wrong");
                                 }
                                  updateQuestion();
                                      }
                                     ),
                                 ),
                                Container(
                                   width: MediaQuery.of(context).size.width * 0.65, // Will take 50% of screen space
                                   child: OutlinedButton(
                                      child: Text(Quiz.choices[NQuestions][1]),
                                      style: OutlinedButton.styleFrom(
                                        primary: Colors.white,
                                        textStyle: TextStyle(
                                          fontSize: 20,
                                        ),
                                        backgroundColor: Colors.black,
                                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                      ),
                                      onPressed: () {
                                         if(Quiz.choices[NQuestions][1] == Quiz.correct[NQuestions]){
                                   debugPrint("correctoo");
                                   finalScore++;
                                 } else {
                                   debugPrint("Wrong");
                                 }
                                  updateQuestion();
                                      }
                                     ),
                                 ),
                                Container(
                                   width: MediaQuery.of(context).size.width * 0.65, // Will take 50% of screen space
                                   child: OutlinedButton(
                                      child: Text(Quiz.choices[NQuestions][2]),
                                      style: OutlinedButton.styleFrom(
                                        primary: Colors.white,
                                        textStyle: TextStyle(
                                          fontSize: 20,
                                        ),
                                        backgroundColor: Colors.black,
                                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                      ),
                                      onPressed: () {
                                        if(Quiz.choices[NQuestions][2] == Quiz.correct[NQuestions]){
                                   debugPrint("correctoo");
                                   finalScore++;
                                 } else {
                                   debugPrint("Wrong");
                                 }
                                  updateQuestion();
                                      }
                                     ),
                                 ),
                                Container(
                                   width: MediaQuery.of(context).size.width * 0.65, // Will take 50% of screen space
                                   child: OutlinedButton(
                                      child: Text(Quiz.choices[NQuestions][3]),
                                      style: OutlinedButton.styleFrom(
                                        primary: Colors.white,
                                        textStyle: TextStyle(
                                          fontSize: 20,
                                        ),
                                        backgroundColor: Colors.black,
                                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                      ),
                                      onPressed: () {
                                        if(Quiz.choices[NQuestions][3] == Quiz.correct[NQuestions]){
                                   debugPrint("correctoo");
                                   finalScore++;
                                 } else {
                                   debugPrint("Wrong");
                                 }
                                  updateQuestion();
                                      }
                                     ),
                                 ),
                                const SizedBox(height: 60.0,),
                                new Padding(
                                  padding: EdgeInsets.only(
                                    bottom: 11.0,
                                  ),
                                  child: FloatingActionButton.extended(
                                    backgroundColor: Colors.red,
                                    onPressed: resetQuiz, 
                                    label: Text('Reiniciar/ Salir', style: GoogleFonts.roboto(),
                                    ),
                                    ),
                                ),
                                ],
                            ),
                                  
                          ],
                        ),
                      ),
                      ],
                    ),
                  ],
                ),
                ],
              ),
            ),
          ],
        ) 
        ),
    ),
    );
  }

  resetQuiz() {
    setState(() {
      Navigator.pop(context);
      finalScore = 0;
      NQuestions = 0;
    });
  }

  void updateQuestion() {
    setState(() {
      if(NQuestions == Quiz.questions.length - 1){
        Navigator.push(context, new MaterialPageRoute(builder: (context) => new Summary(score: finalScore,)));
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
              Center(
                child: new Text("Final Score: ${score}",
                style: new TextStyle(
                  fontSize: 25.0,
                ),
                ),
              ),
              new Padding(padding: EdgeInsets.all(20.0)),

              /*
              new AnimatedButton(
                color: Colors.red,
                onPressed: () => {
                  Navigator.pop(context),
                  finalScore = 0,
                  NQuestions = 0,
                }, 
                child: new Text("Reset Quiz",
                style: new TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              */

              new RaisedButton(
                color: Colors.green,
                onPressed: () {
                  showDialog(
                  barrierDismissible: false,
                  context: context, 
                  builder: (context) => AlertDialog(
                    title: new Text("¡ Enhorabuena !"),
                    content: new Text("Has logrado completar el ejercicio con exito, Felicidades. \n Toca el boton 'Continuar' para seguir con el siguiente paso. \n ! sigamos aprendiendo !"),
                    actions: [
                 new FlatButton(
                    child: new Text("Close"),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TimeLinesFR())), 
            ),
          ],
                  ),
                  );
                }, 
                child: new Text("Continuar con mas temas",
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