import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:toxi_app/Ui/Screen/Quiz/page_home.dart';
import 'User/page_user.dart';

class Inicio extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Pantalla(),
    );
  }
}

class Pantalla extends StatefulWidget{
  @override
  _Pantalla createState() => _Pantalla();
}

  class _Pantalla extends State<Pantalla> {
    int sigIndice = 0;

    List listOfItem = [
      
      PageHome(),
      Container(
        color: Colors.white,
        child: PageUser(),
      ),
      //Container(color: Colors.blue,),
      Container(
        color: Colors.white,
      ),
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,

      body: listOfItem[sigIndice],

      bottomNavigationBar: BottomNavyBar(
        
        //backgroundColor: Color(0xFF242F3B),
        backgroundColor: Colors.white,
        selectedIndex: sigIndice,
        animationDuration: Duration(milliseconds: 300),
        //curve: Curves.elasticInOut,
        onItemSelected: (index){
          setState(() {
            sigIndice = index;
          });
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.home_filled),
            title: Text('Inicio'),
            activeColor: Colors.redAccent,
            inactiveColor: Colors.black,
            ),
            BottomNavyBarItem(
            icon: Icon(Icons.person_outlined),
            title: Text('Perfil'),
            activeColor: Colors.blueAccent,
            inactiveColor: Colors.black,
            ),
            BottomNavyBarItem(
            icon: Icon(Icons.extension_rounded),
            title: Text('Proxima...'),
            activeColor: Colors.blueAccent,
            inactiveColor: Colors.black,
            ),
        ],
      ),
    );
  }   
 }
