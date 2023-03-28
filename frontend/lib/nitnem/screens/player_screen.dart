import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';


class Player extends StatefulWidget {
  const Player({super.key, required this.source});
  final String source;

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await audioPlayer.stop();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.all(10.0),
                  child: const Image(
                      image: AssetImage('assets/images/nitenam.png'))),
              const SizedBox(
                height: 40.0,
              ),
              GestureDetector(
                  onTap: () async {
                    if (isPlaying) {
                      await audioPlayer.pause();
                    } else {
                      audioPlayer.play(AssetSource(widget.source),
                          volume: 30.0);
                    }
                  },
                  child: Center(
                    child: isPlaying
                        ? const Icon(Icons.play_circle)
                        : const Icon(Icons.pause_circle),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}