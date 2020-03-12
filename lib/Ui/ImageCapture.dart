import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'ImageUploader.dart';


class ImageCapture extends StatefulWidget {



  @override
  State<StatefulWidget> createState() => ImageCaptureStatus();
}

class ImageCaptureStatus extends State<ImageCapture> {

  File _imageFile;


  ImageCaptureStatus();

  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      _imageFile = selected;
    });
  }

  Future<void> _cropImage() async {
    File _cropped = await ImageCropper.cropImage(
      sourcePath: _imageFile.path,
//        toolbarColors:Colors.green,
    );

    setState(() {
      _imageFile = _cropped ?? _imageFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new IconButton(
                icon: Icon(Icons.photo_camera, size: 40, color: Colors.white),
                onPressed: () => _pickImage(ImageSource.camera)),
            new Padding(padding: EdgeInsets.only(right: 30)),
            new IconButton(
                icon: Icon(Icons.photo_library, size: 40, color: Colors.white),
                onPressed: () => _pickImage(ImageSource.gallery)),
          ],
        ),
      ),
      body: ListView(
        children: getWidget(),
      ),
    );
  }

  List<Widget> getWidget() {
    List<Widget> _listWidget = new List();
    if (_imageFile != null) {
      _listWidget.add(Image.file(_imageFile));
      Widget listButton = new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.edit, color: Colors.white, size: 40),
              label: new Text(
                'Edit Image',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              onPressed: _cropImage,
            ),
          ]);
      _listWidget.add(listButton);
      _listWidget.add(ImageUploader(file: _imageFile,imageCapture:this));
    }

    return _listWidget;
  }
}
