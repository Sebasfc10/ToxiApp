import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toxi_app/Data/Controller/local_noti.dart';
import 'package:toxi_app/Ui/Screen/inicio.dart';
import 'package:toxi_app/Ui/Widgets/alarm_alert.dart';

class AlarmButton extends StatelessWidget {
  const AlarmButton({ Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
     }) 
   : super(key: key);

   final String image, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        final LocalNoti noti = new LocalNoti();
                              noti.init();
                              //noti.showNotification();
                              noti.scheduleWeeklyNotification();
          showDialog<void>(
            context: context,
            builder: (_) => AlarmAlert(),
    );
      }),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.center,
              //color: Colors.red,
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14.0),
                                  image: new DecorationImage(
                                    image: new AssetImage(this.image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5, top: 7),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: [
                                        Text(this.title, 
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(this.subtitle,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.start,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                ]),
              ),
              
          ),
        ],
      ),
    );
  }
}

class AlarmaButton2 extends StatelessWidget {
  const AlarmaButton2({ Key? key,
    required this.title,
    required this.image,
    required this.subtitle,
   }) 
   : super(key: key);

   final String title, image, subtitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        final LocalNoti noti = new LocalNoti();
                                  noti.init();
                                  //noti.scheduleDailyNotification();
                                  noti.diario();
                                  //TODO: notificacion 5 seconds
      }),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.center,
              //color: Colors.red,
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14.0),
                                  image: new DecorationImage(
                                    image: new AssetImage(this.image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5, top: 7),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: [
                                        Text(this.title, 
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                          ),
                                          textAlign: TextAlign.center
                                        ),
                                        Text(this.subtitle,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.start,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                ]),
              ),
              
          ),
        ],
      ),
    );
  }
}

class CancelAlarm extends StatelessWidget {
  const CancelAlarm({ Key? key,
    required this.title,
    required this.image,
   }) : super(key: key);

   final String title, image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        final LocalNoti noti = new LocalNoti();
                                  noti.init();
                                  //noti.scheduleDailyNotification();
                                  noti.cancelAllNotification();
                                  print("presionado en cancel");
      }),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.center,
              //color: Colors.red,
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14.0),
                                  image: new DecorationImage(
                                    image: new AssetImage(this.image),
                                    fit: BoxFit.cover,

                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5, top: 7),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: [
                                        Text(this.title, 
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                ]),
              ),
              
          ),
        ],
      ),
    );
  }
}

class JoinButton extends StatelessWidget {
  const JoinButton({ Key? key,
    required this.title,
    required this.image,
   }) : super(key: key);

   final String title, image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Inicio())),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.center,
              //color: Colors.red,
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14.0),
                                  image: new DecorationImage(
                                    image: new AssetImage(this.image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5, top: 7),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: [
                                        Text(this.title, 
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          fontFamily: "Lato"
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                ]),
              ),
              
          ),
        ],
      ),
    );
  }
}
