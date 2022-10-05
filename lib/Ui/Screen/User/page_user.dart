import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class PageUser extends StatefulWidget{
  @override
_PageUser createState() => _PageUser();

  void logout() async {
    await FirebaseAuth.instance.signOut();
  }
}

class _PageUser extends State<PageUser>{
  
  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
              SizedBox(
                height: 650.0,
              ),

            ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      padding: EdgeInsets.all(15.0),
                      primary: Colors.white54,
                      textStyle: TextStyle(fontSize: 20.0)),
                  onPressed: () {
                    print("authentication l");
                    this.widget.logout();
                     Navigator.push(context, MaterialPageRoute(builder: (context) => exit(0)));
                  },
                  child: Container(
                    child: Center(
                      child: Text('Cerrar Sesion y salir',
                      style: TextStyle(fontFamily: 'Lato', fontWeight: FontWeight.w900, color: Color(0xFFE60023)),),
                    ),
                    width: MediaQuery.of(context).size.width,
                  ),
                )
                  
      ],
    );
  }

}