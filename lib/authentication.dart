import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:toxi_app/app_enum.dart';
import 'android_widgets.dart';
import 'swipe_liquid.dart';

// ignore: must_be_immutable
class Authentication extends StatefulWidget {
  Authentication(
      {required this.isLoading,
      required this.email,
      required this.user,
      required this.appLoginState,
      required this.login,
      required this.verifyEmail,
      required this.password,
      required this.register,
      required this.logout,
      required this.getEnrollYourSelf,
      required this.cancel});

  bool isInitialAppState = false;
  final void Function() cancel;
  final String? email;
  final bool isLoading;
  final Future<QuerySnapshot>? user;
  final void Function() getEnrollYourSelf;
  final AppLoginState appLoginState;
  final void Function(String email, String password, void Function(Exception e) error) login;
  final void Function() verifyEmail;
  final void Function() password;
  final void Function(
      String name,
      String email,
      String password,
      gender gender,
      String idCard,
      int contactNum,
      String programmingLang,
      bool notifyForEvent,
      bool isParentAvailable,
      String parentRelationShip,
      void Function(Exception e) errorCallback) register;
  final void Function() logout;

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  void initState() {
    super.initState();
    widget.isInitialAppState = true;
  }

  @override

  Widget build(BuildContext context) {
    if (this.widget.isLoading) {
      return Stack(
        children: [Center(child: CircularProgressIndicator(value: null))],
      );
    }
    print("this.widget.isInitialAppState ${this.widget.isInitialAppState}");
    if (this.widget.isInitialAppState) {
      print("Authentication isInitialAppState");
      Future.delayed(Duration.zero, () => _showNoticeDialog(context, 'ToxiNoticia'));
    }

    switch (this.widget.appLoginState) {
      case AppLoginState.LOGGED_IN:
        // MOSTRAR LA PANTALLA DE INICIO Y EL BOTON DE CIERRE DE SESSION

        return Column(
            children: [
              //INDICADOR DE CARGA CIRCULAR
              FutureBuilder<QuerySnapshot>(
                  future: widget.user,
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    //BARRA EN PROGRESO ESPERANDO...
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Stack(
                          children: [Center(child: CircularProgressIndicator(value: null))],
                        );
                      //LA VERIFICACION DEBE SER CORRECTA = DONE
                    } else if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData){
                        //RESULTADO
                        //MENSAJE DE BIENVENIDA
                        return Column(
                          children: [
                            SizedBox(height: 0,),
                            Text(
                              "Bienvenue 🇫🇷",
                              style: TextStyle(fontFamily: 'Lato', fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            SizedBox(height: 10.0,),
                            Container(
                              child: Text(
                                //BUSCA EN LA LISTA PARA COLOCAR EL NOMBRE EN LA LISTA
                               'Salut ${(snapshot.data!.docs.length > 0 ? snapshot.data!.docs[0]['name'] : '')}\n\n\Has logrado ingresar con exito en tu App Tóxica\n',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.0,
                                  color: Colors.white,
                                  ),
                              ),
                            ),
                          ],
                        );
                      
                      }
                    }

                    return Container(
                      child: Text('Algo salio mal en el servidor'),
                    );
                  }),



              SizedBox(
                height: 420,
              ),
              SizedBox(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.all(15.0),
                        primary: Color(0xFF242F3B),
                        textStyle: TextStyle(fontSize: 20.0)),
                  onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SwipeLiquid()));
                  },
                  child: const Text("Empezar")),
              ),
              //BOTON CERRAR SESION
              
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      padding: EdgeInsets.all(15.0),
                      primary: Color(0xFF242F3B),
                      textStyle: TextStyle(fontSize: 20.0)),
                  onPressed: () {
                    print("authentication l");
                    this.widget.logout();
                  },
                  child: Container(
                    child: Center(
                      child: Text('Cerrar Sesion',
                      style: TextStyle(fontFamily: 'Lato', fontWeight: FontWeight.w900, color: Color(0xFFE60023)),),
                    ),
                    width: MediaQuery.of(context).size.width,
                  ) 
                  )
                  
            ],
          );

        
      //WIDGET ALERT DE LOGIN ERROR
      case AppLoginState.LOGGED_OUT:
        return (Platform.isAndroid)
            ? LoginAndroid(
                email: widget.email!,
                login: (email, password) {
                  this.widget.login(email, password, (e) {
                    _showErrorDialog(context, 'Ingreso Fallido ❌', e);
                  });
                },
                getEnrolled: () {
                  this.widget.getEnrollYourSelf();
                },
              )

      /// IOPS WIDGETS
            : Container(
                child: Text('please use IOS'),
              );
      // show login screen
      case AppLoginState.VERIFY_EMAIL:
        // currently not in use
        // verify email with verify email call back if verified then show password if not then show signup
        return Container();
      case AppLoginState.PASSWORD:
        // currently not in use
        // signin with email and password
        return Container();
      case AppLoginState.REGISTER:
        // show register page
        return (Platform.isAndroid)
            ? RegisterAndroid(
                register: (
                  String name,
                  String email,
                  String password,
                  gender gender,
                  String idCard,
                  int contactNum,
                  String programmingLang,
                  bool notifyForEvent,
                  bool isParentAvailable,
                  String parentRelationShip,
                ) {
                  this.widget.register(
                      name,
                      email,
                      password,
                      gender,
                      idCard,
                      contactNum,
                      programmingLang,
                      notifyForEvent,
                      isParentAvailable,
                      parentRelationShip,
                      (e) => _showErrorDialog(context, 'Fallo al resgistrarte', e));
                },
                cancel: () => this.widget.cancel(),
              )
            : Container(
                child: Text('IOS platform'),
              );
    }
  }


//WIDGETS PARA MONSTRAR ALERT DE ERROR
  void _showErrorDialog(BuildContext context, String title, Exception e) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(fontSize: 24),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  '${(e as dynamic).message}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Okis...',
                  style: TextStyle(fontFamily: 'Quicksand', fontSize: 19.0, fontWeight: FontWeight.bold, color: Color(0xFF1B232D)),
                )),
          ],
        );
      },
    );
  }

  void _showNoticeDialog(context, String title) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              title,
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            content: Text(
              'Si no lograste ingresar prueba creando una cuenta de nuevo',
              style: TextStyle(fontSize: 18.0),
            ),
            actions: [
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                        padding: EdgeInsets.all(14.0),
                        primary: Color(0xFF1B232D),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Okis',style: TextStyle(color: Colors.white)),
                    ),
                  )
                ],
              )
            ],
          );
        });
  }
}