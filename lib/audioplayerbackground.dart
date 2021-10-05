import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'downloadScreen.dart';
import 'package:path_provider/path_provider.dart';
import 'downloadScreen.dart';
import 'Utilis.dart';

class AudioplayerBackground extends StatefulWidget {
  const AudioplayerBackground({Key? key}) : super(key: key);

  @override
  _AudioplayerBackgroundState createState() => _AudioplayerBackgroundState();
}

class _AudioplayerBackgroundState extends State<AudioplayerBackground> {
  final audioPlayer = AssetsAudioPlayer();
  // DownloadScreen downloadScreen=DownloadScreen();
  // final Duration position = assetsAudioPlayer.currentPosition.value;

  @override
  void initState() {
    super.initState();
    setUpPlayList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void function() {
    // String Position;
    final Duration position = audioPlayer.currentPosition.value;
    // ignore: avoid_print
    print(position.toString().split('.').first);
  }

  void setUpPlayList() async {
    audioPlayer.open(
      Playlist(
        audios: [
          Audio.network(
            "https://irsv.upmusics.com/99/Shahram%20Bozorgmehr%20-%20Tamoome%20Donyami%20(128).mp3?_ga=2.173124003.1627605893.1633178579-1547583649.1633178579",
            metas: Metas(title: "Song1", artist: "Artist 1"),
          ),
          Audio.network(
            "https://irsv.upmusics.com/99/Reza%20Marzdashti%20%7C%20Vay%20Delam%20(128).mp3?_ga=2.239241731.1627605893.1633178579-1547583649.1633178579",
            metas: Metas(title: "Song2", artist: "Artist 2"),
          ),
        ],
      ),
      showNotification: true,
      autoStart: false,
    );
  }

  playMusic() async {
    await audioPlayer.play();
  }

  pausMusic() async {
    await audioPlayer.pause();
  }

  skipPrevious() async {
    await audioPlayer.previous();
  }

  skipNext() async {
    await audioPlayer.next();
  }

  // builderIsPlaying(
  //         builder: (BuildContext context, isPlaying)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: audioPlayer.builderIsPlaying(
          builder: (BuildContext context, isPlaying) {
            return SafeArea(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => SecondPage()));
                      },
                      child: Container(
                        width: 175,
                        height: 175,
                        decoration: BoxDecoration(
                          color: const Color(0xff101047),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(top: 15.0, left: 15.0),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: CircleAvatar(
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Color(0xffFF3737),
                                  ),
                                  radius: 35,
                                  backgroundColor: Color(0xff2B2A67),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Color(0xff2B2A67),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Song Name",
                      style: TextStyle(
                          fontSize: 30,
                          color: Color(0xff2B2A67),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20.0, right: 75, left: 75),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.share,
                            color: Color(0xff2B2A67),
                            size: 25,
                          ),
                          TextButton(
                            onPressed: () {
                              // function();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DownloadScreen()));
                            },
                            child: const Icon(
                              Icons.download_rounded,
                              color: Color(0xff2B2A67),
                              size: 25,
                            ),
                          ),
                          const Icon(
                            Icons.favorite_border_outlined,
                            color: Color(0xff2B2A67),
                            size: 25,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                      child: SliderTheme(
                        data: const SliderThemeData(
                          trackHeight: 5,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 5),
                        ),
                        child: Slider(
                            min: 0.0,
                            max: 20,
                            //Provider.of<MyAudio>(context, listen: false)
                            //             .totalduration ==
                            //         null
                            //     ? 20
                            //     : Provider.of<MyAudio>(context, listen: false)
                            //         .totalduration
                            //         .inMilliseconds
                            //         .toDouble(),
                            value: 0,
                            //Provider.of<MyAudio>(context, listen: false)
                            //             .position ==
                            //         null
                            //     ? 0
                            //     : Provider.of<MyAudio>(context, listen: false)
                            //         .position
                            //         .inMilliseconds
                            //         .toDouble(),
                            // activeColor: Color(0xff2B2A67),
                            inactiveColor: Colors.blue.withOpacity(0.3),
                            onChanged: (value) {
                              setState(() {
                                // Provider.of<MyAudio>(context, listen: false)
                                //     .seekAudio(
                                //         Duration(milliseconds: value.toInt()));
                              });
                            }),
                      ),
                    ),

//                     Padding(
//                       padding: const EdgeInsets.only(right: 40.0, left: 40.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children:  [
//                           // AudioWidget(audio: Audio.network("https://irsv.upmusics.com/99/Shahram%20Bozorgmehr%20-%20Tamoome%20Donyami%20(128).mp3?_ga=2.173124003.1627605893.1633178579-1547583649.1633178579"), child: )
//                           //inside a stateful widget

// // bool _play = false;

//                           // Text(audioPlayer.currentPosition.value),
//                           Text("00:00"),
//                         ],
//                       ),
//                     ),

                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Icon(
                            Icons.skip_previous,
                            color: Color(0xff2B2A67),
                            size: 35,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          child: Icon(
                            isPlaying ? Icons.pause : Icons.play_arrow,
                            size: 35,
                          ),
                          onTap: () {
                            isPlaying ? pausMusic() : playMusic();
                            // AssetsAudioPlayer().open(Audio.file(
                            //     Utils.getFileUrl("myvoice.mp3").toString()));
                            // Provider.of<MyAudio>(context, listen: false)
                            //             .audioState ==
                            //         "Playing"
                            //     ? Provider.of<MyAudio>(context, listen: false)
                            //         .pauseAudio()
                            //     : Provider.of<MyAudio>(context, listen: false)
                            //         .playAudio();
                            // setState(() {
                            //   icon = Provider.of<MyAudio>(context, listen: false)
                            //               .audioState ==
                            //           "Playing"
                            //       ? Provider.of<MyAudio>(context, listen: false)
                            //           .icons[0]
                            //       : Provider.of<MyAudio>(context, listen: false)
                            //           .icons[1];
                            //   color = Provider.of<MyAudio>(context, listen: false)
                            //               .audioState ==
                            //           "Playing"
                            //       ? Provider.of<MyAudio>(context, listen: false)
                            //           .colors[0]
                            //       : Provider.of<MyAudio>(context, listen: false)
                            //           .colors[1];
                            // },
                            // ),

                            // if (Provider.of<MyAudio>(context, listen: false)
                            //         .audioState ==
                            //     "Playing") {
                            //   setState(() {

                            //     icon = Provider.of<MyAudio>(context, listen: false)
                            //         .icons[0];
                            //     Provider.of<MyAudio>(context, listen: false)
                            //         .playAudio();
                            //   });
                            // } else {
                            //   Provider.of<MyAudio>(context, listen: false)
                            //       .pauseAudio();
                            //   setState(() {
                            //     icon = Provider.of<MyAudio>(context, listen: false)
                            //         .icons[1];
                            //   });
                            // }
                          },
                        ),
                        // color: color,

                        const SizedBox(
                          width: 30.0,
                        ),
                        const Icon(
                          Icons.skip_next,
                          color: Color(0xff2B2A67),
                          size: 35,
                        ),
                      ],
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 8.0, left: 15),
                    //   child: Text(
                    //       Provider.of<MyAudio>(context, listen: false).audioState ==
                    //               null
                    //           ? "Pause"
                    //           : Provider.of<MyAudio>(context, listen: false)
                    //               .audioState
                    //               .toString()
                    //               .split('.')
                    //               .first),
                    // ),
                    // AudioFile(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}







    // Scaffold(
    //   body: Container(
    //     alignment: Alignment.center,
    //     child: audioPlayer.builderIsPlaying(
    //         builder: (BuildContext context, isPlaying) {
    //       return Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           IconButton(
    //             onPressed: () => skipPrevious(),
    //             icon: const Icon(Icons.skip_previous),
    //           ),
    //           IconButton(
    //               onPressed: () => isPlaying ? pausMusic() : playMusic(),
    //               icon: Icon(isPlaying ? Icons.pause : Icons.favorite)),
    //           IconButton(
    //             onPressed: () => skipNext(),
    //             icon: const Icon(Icons.skip_next),
    //           ),
    //         ],
    //       );
    //     }),
    //   ),
    // );