import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:tflite/tflite.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("eyero"),
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: MyImagePicker(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyImagePicker extends StatefulWidget {
  @override
  _MyImagePickerState createState() => _MyImagePickerState();
}

class _MyImagePickerState extends State<MyImagePicker> {
  File imageURI;
  String result;
  String path;

  Future getImageFromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      imageURI = image;
      path = image.path;
    });
  }

  Future getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageURI = image;
      path = image.path;
    });
  }

  Future classifyImage() async {
    await Tflite.loadModel(
        model: "assets/model_unquant.tflite", labels: "assets/labels.txt");
    var output = await Tflite.runModelOnImage(path: path);

    setState(() {
      result = output.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
          imageURI == null
              ? Text('No image selected.')
              : Image.file(imageURI,
                  width: 300, height: 200, fit: BoxFit.cover),
          Container(
              margin: EdgeInsets.fromLTRB(0, 30, 0, 20),
              child: RaisedButton(
                onPressed: () => getImageFromCamera(),
                child: Text('Click Here To Select Image From Camera'),
                textColor: Colors.white,
                color: Colors.blue,
                padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
              )),
          Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: RaisedButton(
                onPressed: () => getImageFromGallery(),
                child: Text('Click Here To Select Image From Gallery'),
                textColor: Colors.white,
                color: Colors.blue,
                padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
              )),
          Container(
              margin: EdgeInsets.fromLTRB(0, 30, 0, 20),
              child: RaisedButton(
                onPressed: () => classifyImage(),
                child: Text('Classify Image'),
                textColor: Colors.white,
                color: Colors.blue,
                padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
              )),
          result == null
              ? Text('Result')
              : CircularPercentIndicator(
                  radius: 60.0,
                  lineWidth: 5.0,
                  percent: 1.0,
                  center: new Text(result),
                  progressColor: Colors.blue,
                )
        ])));
  }
}
