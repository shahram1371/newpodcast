// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';

// ignore: camel_case_types
class MyAudio extends ChangeNotifier {
  MyAudio() {
    initAudio();
  }
  String url =
      "https://irsv.upmusics.com/99/Shahram%20Bozorgmehr%20-%20Tamoome%20Donyami%20(128).mp3?_ga=2.173124003.1627605893.1633178579-1547583649.1633178579";
  late Duration position = Duration(milliseconds: 20);
  final audioPlayer = AssetsAudioPlayer();

  initAudio() {
    audioPlayer.currentPosition.listen((event) {
      position = event;
    });
    notifyListeners();
  }
// position = audioPlayer.currentPosition.value;
  // String function() {
  //   final Duration position = audioPlayer.currentPosition.value;
  //   // ignore: avoid_print
  //   return position.toString().split('.').first;
  // }

  @override
  notifyListeners();
}
