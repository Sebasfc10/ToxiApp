import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class WAudio extends StatefulWidget {
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
    return Container(
          //padding: EdgeInsets.all(80.0),
          margin: const EdgeInsets.only(
            top: 80.0,
          ),
          color: Colors.amber,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  //await player.setAsset('assets/audio/cow.mp3');
                   const url =
                      'https://francestoxico.com/wp-content/uploads/2022/05/bonjour_fr.mp3';
                   await player.setUrl(url);
                  player.play();
                },
                child: const Text('REPRODUCIR AUDIO'),
              ),
            ],
          ),
        );
  }
}