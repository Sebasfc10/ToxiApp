import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toxi_app/main.dart';

import 'Authentication.dart';

class Aut extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return Column(children: [
          SizedBox(height: 30.0),
          //Image.asset("lib/assets/camisa.png"),
          
          //Text(
           // "Bienvenue 🇫🇷",
            //style: TextStyle(fontFamily: 'Lato', fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.white),
          //),
          Expanded(
              child: ListView(children: [
            Padding(
                padding: EdgeInsets.all(20.0),
                child: Consumer<AppFirebaseState>(
                  builder: (context, appState, _) {
                    print("consumer");
                    if (appState.isInitialAppState) {
                      return Container();
                    }
                    return Authentication(
                        isLoading: appState.isLoading,
                        email: appState.email,
                        user: appState.enrollUser,
                        getEnrollYourSelf: appState.getEnrollYourSelf,
                        appLoginState: appState.loginState,
                        login: appState.login,
                        verifyEmail: appState.verifyEmail,
                        password: appState.verifyEmail,
                        register: appState.register,
                        logout: appState.logout,
                        cancel: appState.cancelRegistration);
                  },
                ))
          ])),
        ]);
  }

}