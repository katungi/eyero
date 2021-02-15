import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

void main() => runApp(MySwiperApp());

class MySwiperApp extends StatelessWidget {
  static const TextStyle goldcoinGreyStyle = TextStyle(
      color: Colors.grey,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontFamily: "Product Sans");

  static const TextStyle goldCoinWhiteStyle = TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontFamily: "Product Sans");

  static const TextStyle greyStyle =
      TextStyle(fontSize: 40.0, color: Colors.grey, fontFamily: "Product Sans");
  static const TextStyle whiteStyle = TextStyle(
      fontSize: 40.0, color: Colors.white, fontFamily: "Product Sans");

  static const TextStyle boldStyle = TextStyle(
    fontSize: 50.0,
    color: Colors.black,
    fontFamily: "Product Sans",
    fontWeight: FontWeight.bold,
  );

  static const TextStyle descriptionGreyStyle = TextStyle(
    color: Colors.grey,
    fontSize: 20.0,
    fontFamily: "Product Sans",
  );

  static const TextStyle descriptionWhiteStyle = TextStyle(
    color: Colors.white,
    fontSize: 20.0,
    fontFamily: "Product Sans",
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LiquidSwipe(
          pages: [
            Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "EYERO",
                          style: goldcoinGreyStyle,
                        ),
                        Text(
                          "",
                          style: goldcoinGreyStyle,
                        ),
                      ],
                    ),
                  ),
                  Image.asset("assets/main-eye.png"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Getting",
                          style: greyStyle,
                        ),
                        Text(
                          "Started",
                          style: boldStyle,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "Eyero performs mobile eye checkups\n"
                          "We do this in 3 simple steps\n"
                          "",
                          style: descriptionGreyStyle,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Color(0xFF55006c),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "EYERO",
                          style: goldCoinWhiteStyle,
                        ),
                        Text(
                          "",
                          style: goldCoinWhiteStyle,
                        ),
                      ],
                    ),
                  ),
                  Image.asset("assets/take-picture.png"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Take a picture",
                          style: whiteStyle,
                        ),
                        Text(
                          "then Classify",
                          style: boldStyle,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "Click the camera option\n"
                          "Take a picture with your camera\n"
                          "Then click classify to get the results",
                          style: descriptionWhiteStyle,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.orange,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Eyero",
                          style: goldCoinWhiteStyle,
                        ),
                        RaisedButton(
                          color: Colors.white.withOpacity(0.01),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          onPressed: () {
                            Navigator.pushNamed(context, '/imagePicker');
                          },
                          child: Text("Get Started", style: goldCoinWhiteStyle),
                        )
                      ],
                    ),
                  ),
                  Image.asset("assets/gallery.png"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Pick from",
                          style: whiteStyle,
                        ),
                        Text(
                          "Gallery",
                          style: boldStyle,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "select the pick from gallery option\n"
                          "select an image \n"
                          "Then click classify to get the results",
                          style: descriptionWhiteStyle,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
          enableLoop: false,
          fullTransitionValue: 300,
          enableSlideIcon: true,
          waveType: WaveType.liquidReveal,
          positionSlideIcon: 0.5,
        ),
      ),
    );
  }
}
