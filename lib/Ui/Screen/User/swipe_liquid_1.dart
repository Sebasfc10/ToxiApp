import 'package:flutter/material.dart';
import 'package:toxi_app/Ui/Screen/User/alarm_boton.dart';

class swipeL1 extends StatefulWidget {
  const swipeL1({ Key? key }) : super(key: key);

  @override
  State<swipeL1> createState() => _swipeL1State();
}

class _swipeL1State extends State<swipeL1> {
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
                      width: MediaQuery.of(context).size.width.round() * 0.999,
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
                          SizedBox(height: 20.0),

                          AlarmButton(image: "lib/assets/waves.png", title: "TOXI ALARMA SEMANAL !", subtitle: "Sonara cada viernes a las 12 ⚠️​",),

                          SizedBox(height: 10.0),

                          AlarmaButton2(title: "TOXI ALARMA CADA 2 HORAS !", image: "lib/assets/waves2.png", subtitle: "Sonara de cada 2 a 3 horas ⚠️⚠️"),

                          SizedBox(height: 10,),

                          CancelAlarm(title: "Cancelar Alarmas", image: "lib/assets/wavesfinish.png"),

                          /*
                          RaisedButton(
                              //backgroundColor: Colors.blue,
                              child: Row(
                                children: [
                                  Icon(Icons.alarm, color: Colors.black,),
                                  Text("Alarma semanal", style: TextStyle(color: Colors.black)),
                                ],
                              ), 
                              onPressed: (){
                              final LocalNoti noti = new LocalNoti();
                              noti.init();
                              //noti.showNotification();
                              noti.scheduleWeeklyNotification();
                            }),
                            */

                          /*
                            RaisedButton(
                                child: Row(
                                  children: [
                                    Icon(Icons.alarm_off_outlined, color: Colors.black,),
                                    Text("Alarma diaria")
                                  ],
                                ),
                                onPressed: (){
                                  final LocalNoti noti = new LocalNoti();
                                  noti.init();
                                  //noti.scheduleDailyNotification();
                                  noti.diario();
                                  print("presionado");
                                  //TODO: notificacion 5 seconds
                                }),
                              

                            RaisedButton(
                                color: Colors.red[400],
                                child: 
                                Text("Borrar Alarma"),
                                onPressed: (){
                                final LocalNoti noti = new LocalNoti();
                                  noti.init();
                                  //noti.scheduleDailyNotification();
                                  noti.cancelAllNotification();
                                  print("presionado en cancel");
                              }),
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