import 'package:flutter/material.dart';

import 'dart:io';
import './Painters/ListPainter.dart';
import 'package:eyero/Painters/CurvePainter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eyero/Painters/StopPainter.dart';
import './Painters/TrianglePainter.dart';

class MyResultsPage extends StatefulWidget {
  String confidence, label, message;
  // bool isResult;

  MyResultsPage({this.confidence, this.label, this.message});
  static final style = TextStyle(
    fontSize: 20,
    fontFamily: "Billy",
    fontWeight: FontWeight.w400,
  );

  @override
  _MyResultsPageState createState() => _MyResultsPageState();
}

class _MyResultsPageState extends State<MyResultsPage> {
  var height;
  var width;
  // String text = "$confidence";

  @override
  Widget build(BuildContext context) {
    String confidence = widget.confidence;
    String label = widget.label;
    String message = widget.message;
    bool isNormal = false;
    bool isResult = false;

    if (label == 'normal') {
      isNormal = true;
    }

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return WillPopScope(
        onWillPop: () async {
          isResult = false;
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            backgroundColor: Colors.deepPurple,
            // automaticallyImplyLeading: false,
            elevation: 0,
            title: Row(
              children: <Widget>[Text("Eyero")],
            ),
            // Navigator.pop(context, true);
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.white, Colors.blueGrey],
              ),
            ),
            child: CustomPaint(
              painter: ListPainter(color1: Colors.deepPurple),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Center(),
                    isNormal
                        ? Text(
                            "You are $confidence % $label",
                            style: GoogleFonts.raleway(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.deepPurpleAccent,
                            ),
                            textAlign: TextAlign.center,
                          )
                        : Text(
                            "You have a $confidence % possibility of having $label",
                            style: GoogleFonts.raleway(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.deepPurpleAccent,
                            ),
                            textAlign: TextAlign.center,
                          ),
                    Text(
                      "\"$message\"",
                      style: GoogleFonts.shadowsIntoLight(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.deepPurpleAccent,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20.0,
                    )
                  ]),
            ),
          ),
        ));
  }
}
