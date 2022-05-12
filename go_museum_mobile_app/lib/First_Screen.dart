import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

class WrOnboardingScreen2 extends StatefulWidget {
  @override
  _WrOnboardingScreen2State createState() => _WrOnboardingScreen2State();
}

class _WrOnboardingScreen2State extends State<WrOnboardingScreen2> {
  PageController? _pageController;
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20, top: 20),
            child: InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                width: 50.0,
                height: 50.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                        color: Color.fromRGBO(198, 116, 27, 1),
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: <Widget>[
              makePage(
                  image: 'assets/logo.jpeg',
                  title: "Welcome to Go-Museum",
                  content: "Where you discover the Egyptian history"),
              makePage(
                  reverse: true,
                  image: 'assets/egyptian gods.jpg',
                  title: "What is Go-Museum",
                  content: "Go-Museum will guide you through your whole museum tour. You can find the history behind the monuments by detecting them with your camera"),
              makePage(
                  image: 'assets/egypt.png',
                  title: "Have a Great Tour",
                  content:
                      "We hope you have the best experience with us"),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          )
        ],
      ),
    );
  }

  Widget makePage({image, required title, required content, reverse = false}) {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 60),
      child: Center(
        child: ListView(
           shrinkWrap: true,
        //padding: const EdgeInsets.all(20.0),
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            !reverse
                ? Column(
                    children: <Widget>[
                      Container(
                        //padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                            child: Image.asset(image)),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  )
                : SizedBox(),
            Center(
              child: Text(
                title,
                style: TextStyle(
                    color: Color.fromRGBO(52, 43, 37, 1),
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'AmazingInfographic-G4WO'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              content,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(137, 137, 137, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'AmazingInfographic-G4WO'),
            ),
            reverse
                ? Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                          //padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                              child: Image.asset(
                            image, 
                            fit: BoxFit.fill,
  width: double.infinity,
                          ))),
                    ],
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: Color.fromRGBO(198, 116, 27, 1), //OXFFE6A49A
          borderRadius: BorderRadius.circular(5)),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }
}
