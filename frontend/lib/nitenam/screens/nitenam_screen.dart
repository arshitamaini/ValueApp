import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NitenamScreen extends StatefulWidget {
  const NitenamScreen({super.key});

  @override
  State<NitenamScreen> createState() => _NitenamScreenState();
}

class _NitenamScreenState extends State<NitenamScreen> {
  final audioPlayer = AudioPlayer();
  List itemList = [
    'JapJi Sahib',
    'Jaap Sahib',
    'Tav Paar Sawaiye',
    'Benti Chaupai',
    'Anand Sahib',
    'Shabad Hazare',
    'Rehras Sahib',
    'Ardaas'
  ];
  List countList = [3, 0, 1, 0, 8, 2, 0, 22];
  List startList = [
    '19-01-2023',
    '',
    '14-01-2023',
    '',
    '19-01-2023',
    '05-01-2023',
    '',
    '07-01-2023'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/nitenamBg.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 10,
                child: ListView.builder(
                    itemCount: itemList.length,
                    itemBuilder: (context, index) {
                      var count = countList[index];
                      var startDate = startList[index];
                      return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 8.0),
                          child: GestureDetector(
                            onTap: (() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => const Player(
                                            source: 'audio/japjiSahib.mp3',
                                          ))));
                            }),
                            child: Column(
                              children: [
                                ListTile(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: const BorderSide(
                                          width: 4.0,
                                          color: Color(0xFFD9AB68))),
                                  title: Column(
                                    children: [
                                      Center(
                                        child: Text(itemList[index],
                                            style: const TextStyle(
                                                color: Color(0xFFD9AB68),
                                                fontSize: 25.0,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Count: $count',
                                            style: TextStyle(fontSize: 15.0),
                                          ),
                                          if (startDate != '')
                                            Text('Start Date : $startDate',
                                                style:
                                                    TextStyle(fontSize: 15.0))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ));
                    }),
              ),
              const Expanded(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      'Please remove your shoes and cover your head properly',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFFD9AB68),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

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
                        ? const Icon(FontAwesomeIcons.pause)
                        : const Icon(FontAwesomeIcons.play),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
