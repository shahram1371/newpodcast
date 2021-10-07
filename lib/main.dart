import 'package:flutter/material.dart';
import 'audioplayerbackground.dart';
import 'package:provider/provider.dart';
import 'MyAudio.dart';
import 'secondPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyAudio(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: secondPage(),
      ),
    );
  }
}





//https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png

// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   // MyHomePage({Key key, this.title}) : super(key: key);

//   // final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final imageSrc = 'https://picsum.photos/250?image=9';
//   var downloadPath = '';
//   var downloadProgress = 0.0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(""),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Expanded(flex: 5, child: Image.network(imageSrc)),
//             Expanded(
//               flex: 2,
//               child: Row(
//                 children: [
//                   ElevatedButton(
//                     // Download displayed image from imageSrc
//                     onPressed: () {
//                       downloadFile().catchError((onError) {
//                         debugPrint('Error downloading: $onError');
//                       }).then((imagePath) {
//                         debugPrint('Download successful, path: $imagePath');
//                         displayDownloadImage(imagePath);
//                       });
//                     },
//                     child: Text('Download'),
//                   ),
//                   ElevatedButton(
//                     // Delete downloaded image
//                     onPressed: () {
//                       deleteFile().catchError((onError) {
//                         debugPrint('Error deleting: $onError');
//                       }).then((value) {
//                         debugPrint('Delete successful');
//                       });
//                     },
//                     child: Text('Clear'),
//                   )
//                 ],
//               ),
//             ),
//             LinearProgressIndicator(
//               value: downloadProgress,
//             ),
//             Expanded(
//                 flex: 5,
//                 child: downloadPath == ''
//                     // Display a different image while downloadPath is empty
//                     // downloadPath will contain an image file path on successful image download
//                     ? Icon(Icons.image)
//                     : Image.file(File(downloadPath))),
//           ],
//         ),
//       ),
//     );
//   }

//   displayDownloadImage(String path) {
//     setState(() {
//       downloadPath = path;
//     });
//   }

//   Future deleteFile() async {
//     final dir = await getApplicationDocumentsDirectory();
//     var file = File('${dir.path}/image.jpg');
//     await file.delete();
//     setState(() {
//       // Clear downloadPath on file deletion
//       downloadPath = '';
//     });
//   }

//   Future downloadFile() async {
//     Dio dio = Dio();
//     var dir = await getApplicationDocumentsDirectory();
//     var imageDownloadPath = '${dir.path}/image.jpg';
//     await dio.download(imageSrc, imageDownloadPath,
//         onReceiveProgress: (received, total) {
//       var progress = (received / total) * 100;
//       debugPrint('Rec: $received , Total: $total, $progress%');
//       setState(() {
//         downloadProgress = received.toDouble() / total.toDouble();
//       });
//     });
//     // downloadFile function returns path where image has been downloaded
//     return imageDownloadPath;
//   }
// }
