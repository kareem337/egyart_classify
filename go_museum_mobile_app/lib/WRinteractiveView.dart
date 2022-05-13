//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:go_museum_mobile_app/First_Screen.dart';
import 'package:go_museum_mobile_app/about_us.dart';
import 'package:go_museum_mobile_app/fade_in_animation.dart';
import 'package:go_museum_mobile_app/side_in_animation.dart';

class MonumentDetail extends StatefulWidget {
  const MonumentDetail({Key? key}) : super(key: key);

  @override
  _MonumentDetailState createState() => _MonumentDetailState();
}

class _MonumentDetailState extends State<MonumentDetail> {
  final FlutterTts flutterTts = FlutterTts();

  Future speak(String name) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(name);
  }

  String name =
      "Amnemhat III: known as Amenemhet III, was a pharaoh of ancient Egypt and the sixth king of the Twelfth Dynasty of the Middle Kingdom. He was elevated to throne as co-regent by his father Senusret III, with whom he shared the throne as the active king for twenty years. During his reign, Egypt attained its cultural and economic zenith of the Middle Kingdom.";
  final TransformationController _controller = TransformationController();
  bool isFavourite = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width,
                height: 250.0,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        width: size.width,
                        height: 190.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFe6a49a),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 25.0,
                      left: 8.0,
                      right: 8.0,
                      child: SideInAnimation(
                        delay: 1,
                        child: Container(
                          width: size.width,
                          height: 200.0,
                          margin: EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            //
                          ),
                          child: Expanded(
                            child: InteractiveViewer(
                              transformationController: _controller,
                              maxScale: 5.0,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: FittedBox(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      'assets/download.jpeg',
                                      //height: 200,
                                      //width: 200,
                                    ),
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.0),
              SideInAnimation(
                delay: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "Amnemhat III",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                              fontFamily: "AmazingInfographic-G4WO"),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isFavourite = !isFavourite;
                          });
                        },
                        icon: isFavourite
                            ? Icon(Icons.favorite_border)
                            : Icon(Icons.favorite),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25.0),
              // SideInAnimation(
              //   delay: 2,
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 20.0),
              //     child: Text(
              //       "Nike",
              //       style: TextStyle(
              //         fontSize: 20.0,
              //         color: Colors.grey,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ),
              // ),
              //SizedBox(height: 15.0),
              // SideInAnimation(
              //   delay: 3,
              //   child: Container(
              //     width: double.infinity,
              //     height: 100.0,
              //     margin: EdgeInsets.only(left: 20.0),
              //     child: ListView.builder(
              //         scrollDirection: Axis.horizontal,
              //         itemCount: images.length,
              //         itemBuilder: (context, index) {
              //           return InkWell(
              //             onTap: () {
              //               setState(() {
              //                 _currentImage = images[index];
              //                 _controller.value = Matrix4.identity();
              //               });
              //             },
              //             child: Container(
              //               margin: const EdgeInsets.all(8),
              //               padding: const EdgeInsets.all(2),
              //               // color: Colors.red,
              //               child: CachedNetworkImage(imageUrl: images[index]),
              //             ),
              //           );
              //         }),
              //   ),
              // ),
              SizedBox(height: 25.0),
              SideInAnimation(
                delay: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Monument Description",
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SideInAnimation(
                delay: 6,
                child: Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                  child: Text(
                    "${name}",
                    style: TextStyle(
                        fontSize: 17.0, color: Colors.black87, height: 1.75),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: FadeInAnimation(
        delay: 2,
        child: Container(
          height: 50,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ButtonBottom(
              //     title: "Scan Again", color: color1, textColor: color9),
              // ButtonBottom(title: "Audio", color: color4, textColor: color1),
              SizedBox(
                height: 50,
                width: 150,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xFFF7F3E6),
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        )),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutUs()),
                      );
                    },
                    child: Text(
                      "Scan Again",
                      style: TextStyle(color: Color(0xFF3C3D3E), fontSize: 17),
                    )),
              ),
              SizedBox(
                height: 50,
                width: 150,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xFF996FAF),
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        )),
                    onPressed: () {
                      print("Audio Pressed");
                      speak(name);
                    },
                    child: Text(
                      "Audio",
                      style: TextStyle(color: Color(0xFFF7F3E6), fontSize: 17),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class ButtonBottom extends StatelessWidget {
//   final String? title;
//   final int? color;
//   final int? textColor;
//   ButtonBottom({this.title, this.color, this.textColor});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 150,
//       height: 50.0,
//       padding: EdgeInsets.all(15),
//       decoration: BoxDecoration(
//         color: Color(color!),
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Center(
//         child: Text(
//           title!,
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//             color: Color(textColor!),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class BoxIcon extends StatelessWidget {
//   final IconData? icon;
//   BoxIcon({this.icon});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 40.0,
//       height: 40.0,
//       decoration: BoxDecoration(
//         color: Colors.grey[200],
//         borderRadius: BorderRadius.circular(12.0),
//       ),
//       child: Icon(icon),
//     );
//   }
// }
