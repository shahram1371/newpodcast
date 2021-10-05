// ignore_for_file: file_names
import 'audioplayerbackground.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class secondPage extends StatefulWidget {
  const secondPage({Key? key}) : super(key: key);

  @override
  _secondPageState createState() => _secondPageState();
}

// ignore: camel_case_types
class _secondPageState extends State<secondPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.orangeAccent,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
              child: Column(
                children: [
                  Row(
                    textBaseline: TextBaseline.ideographic,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Podcast",
                        style: TextStyle(
                            color: Color(0xff101047),
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Schyler'),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffFFCD5A),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 95,
                        height: 75,
                        child: const Image(
                            image: AssetImage(
                          'assets/images/image.jpg',
                        )),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 10.0, left: 10.0),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AudioplayerBackground()));
                            },
                            child: Container(
                              height: 120.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: const Color(0xffF6F5F8),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 25.0, top: 10),
                                          child: Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    child: const Center(
                                                        child: Text(
                                                      "K",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20.0),
                                                    )),
                                                    width: 70.0,
                                                    height: 70.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      color: const Color(
                                                          0xff101047),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  const Text(
                                                    "Song Name",
                                                    style: TextStyle(
                                                      color: Color(0xff101047),
                                                      fontSize: 18.0,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              const Text("Singer Name",
                                                  style: TextStyle(
                                                      color: Color(0xff101047),
                                                      fontSize: 15.0))
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Center(
                                      child: TextButton(
                                        onPressed: () {},
                                        child: const Icon(
                                            Icons.arrow_forward_ios_sharp),
                                        //       Provider.of<MyAudio>(context,
                                        //                       listen: false)
                                        //                   .audioState ==
                                        //               "Playing"
                                        //           ? Provider.of<MyAudio>(context,
                                        //                   listen: false)
                                        //               .pauseAudio()
                                        //           : Provider.of<MyAudio>(context,
                                        //                   listen: false)
                                        //               .playAudio();
                                        //       setState(() {
                                        //         icon = Provider.of<MyAudio>(context,
                                        //                         listen: false)
                                        //                     .audioState ==
                                        //                 "Playing"
                                        //             ? Provider.of<MyAudio>(context,
                                        //                     listen: false)
                                        //                 .icons[0]
                                        //             : Provider.of<MyAudio>(context,
                                        //                     listen: false)
                                        //                 .icons[1];
                                        //         color = Provider.of<MyAudio>(
                                        //                         context,
                                        //                         listen: false)
                                        //                     .audioState ==
                                        //                 "Playing"
                                        //             ? Provider.of<MyAudio>(context,
                                        //                     listen: false)
                                        //                 .colors[0]
                                        //             : Provider.of<MyAudio>(context,
                                        //                     listen: false)
                                        //                 .colors[1];
                                        //       });

                                        //       // // if (Provider.of<MyAudio>(context,
                                        //       // //             listen: false)
                                        //       // //         .audioState ==
                                        //       // //     "Stopped") {
                                        //       // //   setState(() {
                                        //       // //     musicFlag = 1;
                                        //       // //     icon = Provider.of<MyAudio>(
                                        //       // //             context,
                                        //       // //             listen: false)
                                        //       // //         .icons[0];
                                        //       // //     Provider.of<MyAudio>(context,
                                        //       // //             listen: false)
                                        //       // //         .playAudio();
                                        //       // //   });
                                        //       // // }
                                        //       // if (Provider.of<MyAudio>(context,
                                        //       //             listen: false)
                                        //       //         .audioState ==
                                        //       //     "Playing") {
                                        //       //   setState(() {
                                        //       //     musicFlag = 0;
                                        //       //     icon = Provider.of<MyAudio>(
                                        //       //             context,
                                        //       //             listen: false)
                                        //       //         .icons[1];
                                        //       //     Provider.of<MyAudio>(context,
                                        //       //             listen: false)
                                        //       //         .playAudio();
                                        //       //   });
                                        //       // } else {
                                        //       //   Provider.of<MyAudio>(context,
                                        //       //           listen: false)
                                        //       //       .pauseAudio();
                                        //       //   setState(() {
                                        //       //     icon = Provider.of<MyAudio>(
                                        //       //             context,
                                        //       //             listen: false)
                                        //       //         .icons[0];
                                        //       //   });
                                        //       // }

                                        //       // );
                                        //     },
                                        //     child: Container(
                                        //       width: 30.0,
                                        //       height: 30.0,
                                        //       decoration: BoxDecoration(
                                        //         borderRadius:
                                        //             BorderRadius.circular(15),
                                        //         border: Border.all(
                                        //             color: Color(0xffFF3737)),
                                        //       ),
                                        //       child: Center(
                                        //         child: Icon(
                                        //           // Icons.play_arrow,
                                        //           icon,
                                        //           color: color,
                                        //         ),
                                        //       ),
                                        //     ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Text(totalduration.toString().split('.').first),
                        // Text(position.toString().split('.').first),
                        // Text(audioState.toString().split('.').first),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
