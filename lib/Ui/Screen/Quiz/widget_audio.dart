import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:toxi_app/Data/Controller/check_internet_connection.dart';
import 'package:toxi_app/Data/Controller/connection_status_change_notifier.dart';

class WAudio extends StatefulWidget {
  final String audioUrl;

  const WAudio ({Key? key, required this.audioUrl}) : super(key: key);
  @override
  _WAudio createState() => _WAudio();
}

class _WAudio extends State<WAudio> {
  late AudioPlayer player;
  late AudioPlayer player2;
  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    player2 = AudioPlayer();
  }
  @override
  void dispose() {
    player.dispose();
    player2.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ConnectionStatusChangeNotifier(),
      child: Consumer<ConnectionStatusChangeNotifier>(
        builder: (context, value, child) {
          return Visibility(
            visible: value.status == ConnectionStatus.online,
            child: Container(
          //padding: EdgeInsets.all(80.0),
          margin: const EdgeInsets.only(
            top: 80.0,
          ),
          //color: Colors.amber,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black),
                onPressed: () async {
                  //await player.setAsset('assets/audio/cow.mp3');
                   //var url =
                      //'https://francestoxico.com/wp-content/uploads/2022/05/bonjour_fr.mp3';
                   await player.setUrl(widget.audioUrl);
                   player.play();
                },
                child: const Text('REPRODUCIR AUDIO'),
              ),
            ],
           ),
          ),
        );
        },
      )
    );
  }
}





