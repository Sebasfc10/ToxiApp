
import 'package:flutter/material.dart';
import 'package:toxi_app/Ui/Screen/Quiz/join_exercise.dart';
import 'package:toxi_app/Ui/Screen/Quiz/page_home.dart';

class TimeLinesFR extends StatefulWidget {
  @override
  State<TimeLinesFR> createState() => _TimeLinesFRState();
}

class _TimeLinesFRState extends State<TimeLinesFR> {
  int currentStepp = 0;
  onStepTapped (index) {
    setState(() => currentStepp = index);
  }

  bool complete = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          complete
          ? Expanded(
      child: Center(
        child: AlertDialog(
          title: new Text("¡ Enhorabuena !"),
          content: new Text("Has logrado completar el ejercicio con exito, Felicidades. \n ! sigamos aprendiendo !"),
          actions: [
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                setState(() => complete = false);
              },
            ),
          ],
        ),
      ),
    )
          : Expanded(
              child: Theme(
                data: ThemeData(
                  colorScheme:  Theme.of(context).colorScheme.copyWith(primary: Colors.black),
                ),
                child: Stepper(
                  controlsBuilder: (BuildContext context, ControlsDetails details){
                    return Row(
                      children: [
                        TextButton(
                        onPressed: details.onStepContinue,
                        child: Text('Continuar', style: TextStyle(color: Colors.black, fontFamily: "Quicksand"),),
                        ),
              
                        TextButton(
                        onPressed: details.onStepCancel,
                        child: Text('Volver', style: TextStyle(color: Colors.black, fontFamily: "Quicksand"),),
                        ),
                      ],
                    );
                  },
                  type: StepperType.vertical,
                  currentStep: currentStepp,
                  onStepTapped: (index) {
                    setState(() => currentStepp++);
                  },
              
                  //BOTON EN CONFIRMAR
                  onStepContinue:() {
                    /*
                    if (currentStepp != 5){
                      setState(() => currentStepp++);
                    }
                    */
                    currentStepp + 1 != 6
                    ? onStepTapped(currentStepp + 1)
                    : setState(() => complete = true);
                  },
              
                  //BOTON EN CANCELAR
                  onStepCancel: (){
                    if (currentStepp != 0){
                      setState(() => currentStepp--);
                    }
                  },
                  steps: [
                    Step(
                      state: StepState.complete,
                      isActive: currentStepp >= 0,
                      title: Text("Saludos", style: TextStyle(fontFamily: "Quicksand"),), 
                      //WIDGET CUADRO DE INFO PARA IR A LOS EJERCICIOS
                      content: JoinExercise(activo: StepState.complete, title: "Aprender los Saludos"),
                      //Text("Aprenderas los modales en francés"),
                      ),
                      Step(
                      isActive: currentStepp >= 1,
                      state: StepState.complete,
                      title: Text("Saludos part. 2",style: TextStyle(fontFamily: "Quicksand"),), 
                      content: JoinExercise(activo: StepState.complete, title: "Aprender mas Saludos",),
                      ),
                      Step(
                      isActive: currentStepp >= 2,
                      state: StepState.complete,
                      title: Text("Proximamente",style: TextStyle(fontFamily: "Quicksand"),), 
                      content: JoinExercise(activo: StepState.complete, title: "Proximamente",),
                      ),
                      Step(
                      isActive: currentStepp >= 3,
                      state: StepState.complete,
                      title: Text("Proximamente",style: TextStyle(fontFamily: "Quicksand"),), 
                      content: Text("Proximamente mas temas para estudiar"),
                      ),
                      Step(
                      isActive: currentStepp >= 4,
                      state: StepState.complete,
                      title: Text("Proximamente",style: TextStyle(fontFamily: "Quicksand"),), 
                      content: Text("Proximamente mas temas para estudiar"),
                      ),
                      Step(
                      isActive: currentStepp >= 5,
                      state: StepState.complete,
                      title: Text("Proximamente",style: TextStyle(fontFamily: "Quicksand"),), 
                      content: Text("Proximamente mas temas para estudiar"),
                      ),
                   ],
                  ),
              ),
          ),
        ]
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.home),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PageHome())),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}