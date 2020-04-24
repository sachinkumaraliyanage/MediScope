/*
* File Name: ImageCapture.dart
* Author: P.M.C.P.Paththinisekara
* Reg No: IT17056212
* Date: 2020/03/20
* Description: Contains interface design and ImageCapture functionalities using image_cropper & image_picker libraries.
* Reference: Flutter File Upload - Pick, Crop, and Save Images to the Cloud, July. 29, 2019. Accessed on: March. 16, 2020.
*            [Video file]. Available: https://www.youtube.com/watch?v=HCmAwk2fnZc&t=149s
* */

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'ImageUploader.dart';

/*
* Reference: Flutter File Upload - Pick, Crop, and Save Images to the Cloud, July. 29, 2019. Accessed on: March. 16, 2020.
*           [Video file]. Available: https://www.youtube.com/watch?v=HCmAwk2fnZc&t=149s
*
* Some of the code snippets of the above tutorial were adjusted and used for below function.
**/

class ImageCapture extends StatefulWidget {
  //creat StatefulWidget class for ImageCapture and set state to it
  @override
  State<StatefulWidget> createState() => ImageCaptureStatus();
}

/*
* Reference: Flutter File Upload - Pick, Crop, and Save Images to the Cloud, July. 29, 2019. Accessed on: March. 16, 2020.
*           [Video file]. Available: https://www.youtube.com/watch?v=HCmAwk2fnZc&t=149s
*
* Some of the code snippets of the above tutorial were adjusted and used for below function.
**/

class ImageCaptureStatus extends State<ImageCapture> {
  File _imageFile;//store selected or captured image file

  //constructor
  ImageCaptureStatus();

  //pick image from local gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      _imageFile = selected;
    });
  }

/*
* Reference: Flutter File Upload - Pick, Crop, and Save Images to the Cloud, July. 29, 2019. Accessed on: March. 16, 2020.
*           [Video file]. Available: https://www.youtube.com/watch?v=HCmAwk2fnZc&t=149s
*
* Some of the code snippets of the above tutorial were adjusted and used for below function.
**/

  //sending selected image to edit
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

  //generate image upload interface
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
      _listWidget.add(ImageUploader(file: _imageFile, imageCapture: this));
    }

    return _listWidget;
  }
}
