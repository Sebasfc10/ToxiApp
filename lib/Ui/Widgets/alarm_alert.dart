import 'package:flutter/material.dart';

class AlarmAlert extends StatefulWidget{

  @override
  State<AlarmAlert> createState() => _AlarmAlertState();
}

class _AlarmAlertState extends State<AlarmAlert> {
  bool complete = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      title: Text('Mensaje Importante'),
      content:
          Text("La Alarma Tóxica ha sido activada ✅​, si deseas mas info, puedes volver y leer las instrucciones"),
      actions: <Widget>[
        FlatButton(
            child: Text("Aceptar"),
            textColor: Colors.black,
            onPressed: () {
              Navigator.of(context).pop();
            }),

        FlatButton(
            child: Text("Volver"),
            textColor: Colors.red,
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ],
    );
  }
  }
