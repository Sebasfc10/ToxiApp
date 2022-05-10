import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toxi_app/Data/Controller/aut.dart';
import 'package:toxi_app/Data/Controller/push_notification_fmc.dart';
import 'Data/Controller/android_widgets.dart';
import 'Data/models/app_enum.dart';
//import 'package:form_controller_ui_v1/user_entity.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  PushNotificationFMC.initialzeApp();
  runApp(ChangeNotifierProvider(
      create: (context) => AppFirebaseState(), builder: (context, _) => MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toxi App Beta 1.1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xFFe28568),
          textTheme: TextTheme(headline5: TextStyle()).apply(bodyColor: Color(0xFF6e4875)), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xFFe28568))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  //final AppFirebaseState appFirebaseState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: null,
        backgroundColor: Color(0xFF1B232D),
        body: Aut()
        );
  }
}

class AppFirebaseState extends ChangeNotifier {
  AppFirebaseState() {
    this._isInitialAppState = true;
    init();
  }

  AppLoginState _loginState = AppLoginState.LOGGED_OUT;
  AppLoginState get loginState => _loginState;
  bool get isLoading => _isLoading;
  Future<QuerySnapshot>? get enrollUser => _user;
  String? get email => _email;
  bool get isInitialAppState => _isInitialAppState;

  bool _isInitialAppState = false;
  bool _isLoading = false;
  Future<QuerySnapshot>? _user; //UserEntity(userName: "Annonymous");
  String? _email;

  Future<void> init() async {
    await PushNotificationFMC.initialzeApp();
    this._email = "";
    await Firebase.initializeApp();
    FirebaseAuth.instance.userChanges().listen((user) {
      print("user");
      if (user != null) {
        print("user.uid ${user.uid}");
        _loginState = AppLoginState.LOGGED_IN;
        _user = FirebaseFirestore.instance
            .collection('registered_users')
            .where('userId', isEqualTo: user.uid)
            .get();
      } else {
        _loginState = AppLoginState.LOGGED_OUT;
      }
      this._isInitialAppState = false;
      this._isLoading = false;
      notifyListeners();
    });
  }

  void login(String email, String password,
      void Function(FirebaseAuthException e) errorCallback) async {
    try {
      _loadingNotify(this.isLoading);
      this._email = email;
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
      _unLoadingNotify();
    }
  }

  void _loadingNotify(bool isLoading) {
    if (!isLoading) {
      this._isLoading = true;
      notifyListeners();
    }
  }

  void _unLoadingNotify() {
    this._isLoading = false;
    notifyListeners();
  }

  void verifyEmail() {
    // not in use
  }

  void password() {
    // not in use
  }

  void getEnrollYourSelf() {
    _loginState = AppLoginState.REGISTER;
    notifyListeners();
  }

  void cancelRegistration() {
    print('AppFirebaseState cancelRegistration()');
    _loginState = AppLoginState.LOGGED_OUT;
    notifyListeners();
  }

  void register(
      String name,
      String email,
      String password,
      gender g,
      String idCard,
      int contactNum,
      String programmingLang,
      bool notifyForEvent,
      bool isParentAvailable,
      String parentRelationShip,
      void Function(FirebaseAuthException e) errorCallback) async {
    try {
      _loadingNotify(this.isLoading);
      var credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseFirestore.instance.collection('registered_users').add(<String, dynamic>{
        'timestamp': DateTime.now().millisecondsSinceEpoch,
        'userId': credential.user!.uid,
        'name': name,
        'gender': (g == gender.MALE) ? 'M' : 'F',
        'idCard': idCard,
        'contactNum': contactNum,
        'programmingLang': programmingLang,
        'notifyForEvent': notifyForEvent,
        'isParentAvailable': isParentAvailable,
        'parentRelationShip': parentRelationShip,
      });
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
      _unLoadingNotify();
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
  }
}