// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'MyAudio.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

// ignore: use_key_in_widget_constructors
class DownloadScreen extends StatefulWidget {
  // get dir => null;

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  bool downloading = false;
  var progressString = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    downloadFile();
    // getPermission();
  }

  Future<void> downloadFile() async {
    // var imageDownloadPath = '${dir.path}/image.jpg';

    Dio dio = Dio();
    var dir = await getApplicationDocumentsDirectory();
    var voiceDownloadPath = '${dir.path}/myvoice.mp3';
    try {
      await dio.download(Provider.of<MyAudio>(context, listen: false).url,
          "${dir.path}/myvoice.mp3", onReceiveProgress: (rec, total) {
        //  "${dir.path}/myvoice.mp3"
        setState(() {
          downloading = true;
          progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
          // ignore: avoid_print
        });
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }

    setState(() {
      downloading = false;
      progressString = "Completed";
    });
    // return
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: downloading
            // ignore: sized_box_for_whitespace
            ? Container(
                height: 120.0,
                width: 200.0,
                child: Card(
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ignore: prefer_const_constructors
                      CircularProgressIndicator(),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text("Downloading File $progressString",
                          style: const TextStyle(
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
              )
            : TextButton(
                child: const Text("No data"),
                onPressed: () {
                  // print("${dir.path}/myvoice.mp3()");
                  Navigator.pop(context);
                  // assetsAudioPlayer.open(Audio.file("${widget.dir.path}/myvoice.mp3"));
                  // assetsAudioPlayer.open(Audio.file(dir));
                },
              ),
      ),
    );
  }

  // void getPermission() {}
}
