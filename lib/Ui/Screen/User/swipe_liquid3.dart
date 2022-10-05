import 'package:flutter/material.dart';
import 'package:toxi_app/Ui/Screen/User/alarm_boton.dart';
import 'package:toxi_app/Ui/Screen/inicio.dart';

class swipeL3 extends StatefulWidget {
  const swipeL3({ Key? key }) : super(key: key);

  @override
  State<swipeL3> createState() => _swipeL1State();
}

class _swipeL1State extends State<swipeL3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset("lib/assets/camisa.png", width: 250,),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 5.0),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height.round() * 0.5,
                      width: MediaQuery.of(context).size.width.round() * 0.9,
                      margin: const EdgeInsets.all(20),
                      color: Colors.white,
                      child: 
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Lorem ipsum",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            ),
                          ),
                          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ut tempor nulla. In tincidunt porta molestie. Praesent ac metus sed sem auctor sodales. Quisque hendrerit ac arcu tincidunt tincidunt. Praesent ornare, enim sit amet pulvinar vulputate,placerat cursus ut eu odio.",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                          ),
                          SizedBox(height: 40.0),

                          JoinButton(image: "lib/assets/wavesjoin.png", title: "Empezar / Start / Inizio/ Anfang / 始める"),

                          /*
                          RaisedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Inicio()));
                            }, 
                                child: Row(
                                  children: [
                                    const Text('Ir!', style: TextStyle(color: Colors.black),),
                                  ],
                                ),
                          ),
                          */
                          
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),  
    );
  }
}