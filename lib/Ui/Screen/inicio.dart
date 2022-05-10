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
      Container(
        color: Colors.black,
        child: PageUser(),
      ),
      PageHome(),
      //Container(color: Colors.blue,),
      Container(
        color: Color.fromARGB(255, 148, 13, 3),
      ),
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,

      body: listOfItem[sigIndice],

      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Color(0xFF242F3B),
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
            icon: Icon(Icons.person_outlined),
            title: Text('Perfil'),
            activeColor: Colors.redAccent,
            inactiveColor: Colors.black,
            ),
            BottomNavyBarItem(
            icon: Icon(Icons.home_filled),
            title: Text('Home'),
            activeColor: Colors.blueAccent,
            inactiveColor: Colors.black,
            ),
            BottomNavyBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            title: Text('Boutique'),
            activeColor: Colors.blueAccent,
            inactiveColor: Colors.black,
            ),
        ],
      ),
    );
  }   
 }
