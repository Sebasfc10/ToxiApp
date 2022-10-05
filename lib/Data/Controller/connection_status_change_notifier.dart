import 'dart:async';
import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:toxi_app/Data/Controller/check_internet_connection.dart';
import 'package:toxi_app/main.dart';

class ConnectionStatusChangeNotifier extends ChangeNotifier {
  late StreamSubscription _connectionSubscription;

ConnectionStatus status = ConnectionStatus.online;
  ConnectionStatusChangeNotifier() {
   _connectionSubscription = internetChecker
    .internetStatus()
    .listen((newStatus) {
     status = newStatus;
     notifyListeners();
    });
  }

  @override
  void dispose() {
    _connectionSubscription.cancel();
    super.dispose();
  }
}