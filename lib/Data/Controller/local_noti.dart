import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:rxdart/subjects.dart';


class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}
 
 final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
    BehaviorSubject<ReceivedNotification>();

 final BehaviorSubject<String?> selectNotificationSubject =
    BehaviorSubject<String?>();


class LocalNoti{

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();

  //OBTENER LA ZONA LOCAL
  init(){
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation("America/Bogota"));
    //CAMBIAR INCONO DE LA NOTIFICACION
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings("ic_launcher");

    // ignore: todo
    //TODO: ios_configu.
    final IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
          onDidReceiveLocalNotification: (
            int id,
            String? title,
            String? body,
            String? payload,
          ) async {
            didReceiveLocalNotificationSubject.add(
              ReceivedNotification(
                id: id,
                title: title,
                body: body,
                payload: payload,
              ),
            );
          });
    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    this.flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }


  //CREANDO EL ESQUEMA DE LA NOTIFICACION Y MOSTRARLA
  Future<void> showNotification ()async{
    const AndroidNotificationDetails androidPlataformChannelSpecifics = AndroidNotificationDetails(
      "your channerl",
      "channerl name"
      "channer descripcion",
      priority: Priority.max,
      importance: Importance.max,
      );
      //CREAR CANAL DE IOS
      const IOSNotificationDetails appleNotificationDetail = IOSNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: false,
        badgeNumber: 0,
        subtitle: "Hola"
      );

      const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlataformChannelSpecifics,
        iOS: appleNotificationDetail,
      );
      await this.flutterLocalNotificationsPlugin.show(
        0,
        "this is a notifications",
        "inside the notification",
        platformChannelSpecifics,
        );
  }


  //NOTIFICACION CADA VIERNES A LAS 12 - SEMANAL
  Future<void> scheduleWeeklyNotification()async{

    final detailsMini = NotificationDetails(
      android: AndroidNotificationDetails(
        "id",
        "name"
        "descripcion",
        priority: Priority.max,
        importance: Importance.max,
      ),
      iOS: IOSNotificationDetails(),
    );

      
    await this.flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      "SEMANAL",
      "VIERNES A LAS 12",
       _nextInstanceTomorow(),
      detailsMini,
      androidAllowWhileIdle: true, 
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime
      );
  }


  //SE CREA UN METODO PARA ALERTAR LA NOTIFICACION CADA VIERNES - (METODO DIA)
  tz.TZDateTime _nextInstanceTomorow() {
    //SE LLAMA AL (METODO HORA) PARA CALCULAR LOS DIAS Y ALERTAR A LA HORA ESPECIFICA
    tz.TZDateTime scheduleDate = _nextInstanceOfDocePM();
    while(scheduleDate.weekday != DateTime.monday && scheduleDate.weekday != DateTime.wednesday && scheduleDate.weekday != DateTime.friday){
      scheduleDate = scheduleDate.add(Duration(days: 1));
    }
    return scheduleDate;
  }

  //SE CREA UN METODO PARA ALERTAR LA NOTIFICACION A UNA (HORA) ESPECIFICA DEPENDE DEL (METODO DIA)
  tz.TZDateTime _nextInstanceOfDocePM() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduleDate = tz.TZDateTime(tz.local, now.year, now.month, now.day, 00,00);

    if(scheduleDate.isBefore(now)){
      scheduleDate = scheduleDate.add(Duration(days: 1));
    }
    return scheduleDate;
  }

//-------------------ESTE NOTIFICARA DIARIAMENTE---------------------------------------------------------------------------------------------------------------
   Future<void> scheduleDailyNotification()async{

    final detailsMini = NotificationDetails(
      android: AndroidNotificationDetails(
        "id",
        "name"
        "descripcion",
        priority: Priority.max,
        importance: Importance.max,
      )
    );

    await this.flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      "5 minutooos",
      "55555 55555",
      _nextInstanceOneHour(),
      detailsMini,
      androidAllowWhileIdle: true, 
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime
      );
  }


//METODO DIARIO Y CONTIENE CADA 2 HORAS, CONFIGURAR BIEN LOS BOTONES
  Future<void> diario() async{
    var time = Time(3, 38, 0);

    final detailsMini = NotificationDetails(
      android: AndroidNotificationDetails(
        "id",
        "name"
        "descripcion",
        priority: Priority.max,
        importance: Importance.max,
      ),
      iOS: IOSNotificationDetails(),
    );

    /*
    await this.flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      "5 minutooos",
      "55555 55555",
      _nextInstanceMoreMoreToxic(),
      //_nextInstanceMoreToxic(),
      detailsMini,
      androidAllowWhileIdle: true, 
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time
      );
    */
    

    //CADA 2 DIAS NOTIFICA - PROBADO
    //await this.flutterLocalNotificationsPlugin.periodicallyShow(0, "diario", "DIARIO", RepeatInterval.daily, detailsMini);

    //NOTIFICA CADA 2 HORAS - PROBADO
    //await this.flutterLocalNotificationsPlugin.periodicallyShow(0, "title", "body", RepeatInterval.hourly, detailsMini);
    
  }

    //SE CREA UN METODO PARA ALERTAR LA NOTIFICACION CADA HORA - (METODO HORAS) - NO HA SIDO PROBADO
    tz.TZDateTime _nextInstanceOneHour() {
    //SE LLAMA AL (METODO HORA) PARA CALCULAR LOS DIAS Y ALERTAR A LA HORA ESPECIFICA
    tz.TZDateTime scheduleDate = _nextInstanceMoreToxic();
    while(scheduleDate.weekday == DateTime.daysPerWeek){
      scheduleDate = scheduleDate.add(Duration(minutes: 60));
    }
    return scheduleDate;
  }


  //SE CREA UN METODO PARA ALERTAR LA NOTIFICACION A UNA (TOXIC) ESPECIFICA DEPENDE DEL (METODO TOXIC) - CADA DIA A LAS 10
  tz.TZDateTime _nextInstanceMoreToxic() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduleDate = tz.TZDateTime(tz.local, now.year, now.month, now.day, 10);

    if(scheduleDate.isBefore(now)){
      scheduleDate = scheduleDate.add(Duration(days: 1));
    }
    return scheduleDate;
  }
//PROBADO - CADA DIA SUENA A LAS 10Am Y LUEGO SUENA OTRA VEZ CADA 4H
   tz.TZDateTime _nextInstanceMoreMoreToxic() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduleDate = tz.TZDateTime(tz.local, now.year, now.month, now.day, 10,00);

    if(scheduleDate.day.isEven){
      scheduleDate = scheduleDate.add(Duration(hours: 4));
    }
    return scheduleDate;
  }

  //FUNCION PARA CANCELAR TODAS LAS NOTIFICACIONES DEBE IR EN UN BOTON
  Future<void> cancelAllNotification() async{
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
