import 'package:flutter/material.dart';

class MessageComplete extends StatefulWidget{

  @override
  State<MessageComplete> createState() => _MessageCompleteState();
}

class _MessageCompleteState extends State<MessageComplete> {
  bool complete = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
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
    );
  }
}