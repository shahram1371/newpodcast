// ignore_for_file: file_names

import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'MyAudio.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class Utils {
  Directory? directory;
  Future<String> saveFile() async {
    directory = await getExternalStorageDirectory();
    print(directory!.path);
    String newPath = "";
    List<String> folders = directory!.path.split("/");
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

    return directory!.path;
  }
}





















// class Utils {
//   var progressString = "";
//   String url =
//       "https://irsv.upmusics.com/99/Shahram%20Bozorgmehr%20-%20Tamoome%20Donyami%20(128).mp3?_ga=2.173124003.1627605893.1633178579-1547583649.1633178579";
//   Future downloadFile() async {
//     // var imageDownloadPath = '${dir.path}/image.jpg';

//     Dio dio = Dio();
//     var dir = await getApplicationDocumentsDirectory();
//     var voiceDownloadPath = '${dir.path}/myvoice.mp3';
//     try {
//       await dio.download(url, voiceDownloadPath,
//           onReceiveProgress: (rec, total) {
//         //  "${dir.path}/myvoice.mp3"
//         // setState(() {
//         //   downloading = true;
//         progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
//         //   // ignore: avoid_print
//         // });
//       });
//     } catch (e) {
//       // ignore: avoid_print
//       print(e);
//     }

//     // setState(() {
//     //   downloading = false;
//     //   progressString = "Completed";
//     //   widget.path = voiceDownloadPath;
//     // });
//     return voiceDownloadPath;
//   }

//   // static Future<String> getFileUrl() async {
//   //   final directory = await getApplicationDocumentsDirectory();

//   //   return "${directory.path}/myvoice.mp3";
//   // }
// }
