// ignore_for_file: file_names

import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';

class Utils {
  var progressString = "";
  String url =
      "https://irsv.upmusics.com/99/Shahram%20Bozorgmehr%20-%20Tamoome%20Donyami%20(128).mp3?_ga=2.173124003.1627605893.1633178579-1547583649.1633178579";
  Future downloadFile() async {
    // var imageDownloadPath = '${dir.path}/image.jpg';

    Dio dio = Dio();
    var dir = await getApplicationDocumentsDirectory();
    var voiceDownloadPath = '${dir.path}/myvoice.mp3';
    try {
      await dio.download(url, voiceDownloadPath,
          onReceiveProgress: (rec, total) {
        //  "${dir.path}/myvoice.mp3"
        // setState(() {
        //   downloading = true;
        progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
        //   // ignore: avoid_print
        // });
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }

    // setState(() {
    //   downloading = false;
    //   progressString = "Completed";
    //   widget.path = voiceDownloadPath;
    // });
    return voiceDownloadPath;
  }

  // static Future<String> getFileUrl() async {
  //   final directory = await getApplicationDocumentsDirectory();

  //   return "${directory.path}/myvoice.mp3";
  // }
}
