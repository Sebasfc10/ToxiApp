import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toxi_app/Data/Controller/check_internet_connection.dart';
import 'package:toxi_app/Data/Controller/connection_status_change_notifier.dart';

class WarningWidgetChangeNotifier extends StatelessWidget {
  const WarningWidgetChangeNotifier({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ConnectionStatusChangeNotifier(),
      child: Consumer<ConnectionStatusChangeNotifier>(
        builder: (context, value, child){
          return Visibility(
            visible: value.status != ConnectionStatus.online,
            child: Container(
              padding: const EdgeInsets.all(16),
              height: 60,
              color: Colors.red,
              child: Row(children: [
                const Icon(Icons.wifi_off_rounded),
                const SizedBox(width: 8),
                const Text('No hay conexion a internet, porfavor conectate a un red y reinicia la app',maxLines: 3, style: TextStyle(overflow: TextOverflow.ellipsis, fontSize: 12.5),),
              ]),
            ),
          );
        }
       )
      );
  }
}