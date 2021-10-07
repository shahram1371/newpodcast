// ignore_for_file: avoid_print, file_names

import 'dart:io';
import 'MyAudio.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({Key? key}) : super(key: key);

  @override
  _DownloadScreenState createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  bool loading = false;
  final Dio dio = Dio();
  double progress = 0.0;
  Future<bool> saveFile(String url, String filename) async {
    Directory? directory;
    try {
      if (Platform.isAndroid) {
        if (await _requesPermision(Permission.storage)) {
          directory = await getExternalStorageDirectory();
          print(directory!.path);
          String newPath = "";

          ///storage/emulated/0/Android/data/com.example.downloadvideo/files
          List<String> folders = directory.path.split("/");
          for (int x = 1; x < folders.length; x++) {
            String folder = folders[x];
            if (folder != "Android") {
              newPath += "/" + folder;
            } else {
              break;
            }
          }
          newPath = newPath + "/myvoice";
          directory = Directory(newPath);
          print(directory.path);
        } else {
          return false;
        }
      } else {
        if (await _requesPermision(Permission.photos)) {
          directory = await getTemporaryDirectory();
        } else {
          return false;
        }
      }
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      if (await directory.exists()) {
        File savefile = File(directory.path + "/$filename");
        await dio.download(url, savefile.path,
            onReceiveProgress: (downloaded, total) {
          setState(() {
            progress = downloaded / total;
          });
        });
        if (Platform.isIOS) {
          await ImageGallerySaver.saveFile(savefile.path,
              isReturnPathOfIOS: true);
        }
        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<bool> _requesPermision(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }

  downloadFile() async {
    setState(() {
      loading = true;
    });
    bool downloaded = await saveFile(
        Provider.of<MyAudio>(context, listen: false).url, "myvoice.mp3");

    if (downloaded) {
      print("file downloaded");
    } else {
      print("problem downloading file");
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: loading
            ? LinearProgressIndicator(
                value: progress,
                minHeight: 10,
              )
            : TextButton.icon(
                onPressed: downloadFile,
                icon: Icon(Icons.download_rounded),
                label: Text(""),
              ),
      ),
    );
  }
}





























// // ignore_for_file: file_names

// import 'package:flutter/material.dart';

// import 'package:dio/dio.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:provider/provider.dart';
// import 'MyAudio.dart';
// import 'package:assets_audio_player/assets_audio_player.dart';

// // ignore: use_key_in_widget_constructors
// class DownloadScreen extends StatefulWidget {
//   // get dir => null;

//   @override
//   State<DownloadScreen> createState() => _DownloadScreenState();
// }

// class _DownloadScreenState extends State<DownloadScreen> {
//   AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
//   bool downloading = false;
//   var progressString = "";
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     downloadFile();
//     // getPermission();
//   }

//   Future<void> downloadFile() async {
//     // var imageDownloadPath = '${dir.path}/image.jpg';

//     Dio dio = Dio();
//     var dir = await getApplicationDocumentsDirectory();
//     var voiceDownloadPath = '${dir.path}/myvoice.mp3';
//     try {
//       await dio.download(Provider.of<MyAudio>(context, listen: false).url,
//           "${dir.path}/myvoice.mp3", onReceiveProgress: (rec, total) {
//         //  "${dir.path}/myvoice.mp3"
//         setState(() {
//           downloading = true;
//           progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
//           // ignore: avoid_print
//         });
//       });
//     } catch (e) {
//       // ignore: avoid_print
//       print(e);
//     }

//     setState(() {
//       downloading = false;
//       progressString = "Completed";
//     });
//     // return
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: downloading
//             // ignore: sized_box_for_whitespace
//             ? Container(
//                 height: 120.0,
//                 width: 200.0,
//                 child: Card(
//                   color: Colors.black,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       // ignore: prefer_const_constructors
//                       CircularProgressIndicator(),
//                       const SizedBox(
//                         height: 20.0,
//                       ),
//                       Text("Downloading File $progressString",
//                           style: const TextStyle(
//                             color: Colors.white,
//                           )),
//                     ],
//                   ),
//                 ),
//               )
//             : TextButton(
//                 child: const Text("No data"),
//                 onPressed: () {
//                   // print("${dir.path}/myvoice.mp3()");
//                   Navigator.pop(context);
//                   // assetsAudioPlayer.open(Audio.file("${widget.dir.path}/myvoice.mp3"));
//                   // assetsAudioPlayer.open(Audio.file(dir));
//                 },
//               ),
//       ),
//     );
//   }

//   // void getPermission() {}
// }
