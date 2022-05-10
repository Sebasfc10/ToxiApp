import 'package:flutter/material.dart';
import 'package:toxi_app/Ui/Screen/Quiz/join_exercise.dart';

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
              child: Stepper(
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
                    title: Text("Saludos"), 
                    //WIDGET CUADRO DE INFO PARA IR A LOS EJERCICIOS
                    content: JoinExercise(),
                    //Text("Aprenderas los modales en francés"),
                    ),
                    Step(
                    isActive: currentStepp >= 1,
                    state: StepState.complete,
                    title: Text("Dias de la semana"), 
                    content: Text("Aprenderas los dias de la semana en francés"),
                    ),
                    Step(
                    isActive: currentStepp >= 2,
                    state: StepState.complete,
                    title: Text("Vocabulario #1"), 
                    content: Text("Aprenderemos la primera parte del vocabulario"),
                    ),
                    Step(
                    isActive: currentStepp >= 3,
                    state: StepState.complete,
                    title: Text("Vocabulario #1"), 
                    content: Text("Aprenderemos la primera parte del vocabulario"),
                    ),
                    Step(
                    isActive: currentStepp >= 4,
                    state: StepState.complete,
                    title: Text("Vocabulario #1"), 
                    content: Text("Aprenderemos la primera parte del vocabulario"),
                    ),
                    Step(
                    isActive: currentStepp >= 5,
                    state: StepState.complete,
                    title: Text("Vocabulario #1"), 
                    content: Text("Aprenderemos la primera parte del vocabulario"),
                    ),
                 ],
                ),
          ),
        ]
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}