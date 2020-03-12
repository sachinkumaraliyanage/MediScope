import 'dart:io';

import '../Ui/AddMedicine.dart';

import '../Utill/Medicine.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../Utill/locator.dart';
import 'ImageCapture.dart';

class ImageUploader extends StatefulWidget {
  final File file;
  ImageCaptureStatus imageCapture;

  ImageUploader({Key key, this.file, this.imageCapture}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ImageUploaderStatus(imageCapture);
}

class _ImageUploaderStatus extends State<ImageUploader> {
  String filePath;
  ImageCaptureStatus imageCapture;

  _ImageUploaderStatus(this.imageCapture);

  final FirebaseStorage _storage =
      FirebaseStorage(storageBucket: firebaseImageUrl);
  StorageUploadTask _uploadTask;

  void _startUpload() {
    filePath = firebaseImageMainFolder + '${DateTime.now()}.jpg';
    setState(() {
      _uploadTask = _storage.ref().child(filePath).putFile(widget.file);
    });
    _uploadTask.onComplete.then((value) {
      getImgpath(filePath);
      Navigator.pop(context);
    });
  }

  void getImgpath(String path) async {
    path = await FirebaseStorage(storageBucket: firebaseImageUrl)
        .ref()
        .child(path)
        .getDownloadURL()
        .then((value) => value.toString());
    Medicine.imgurl = path;
    Medicine.s.setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_uploadTask != null) {
      return StreamBuilder<StorageTaskEvent>(
        stream: _uploadTask.events,
        builder: (context, snapshot) {
          var event = snapshot?.data?.snapshot;
          double progressPercent =
              event != null ? event.bytesTransferred / event.totalByteCount : 0;

          return Column(children: createcoulam(_uploadTask, progressPercent));
        },
      );
    } else {
      return Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 30),
          ),
          FlatButton.icon(
            onPressed: _startUpload,
            icon: Icon(
              Icons.cloud_upload,
              color: Colors.white,
              size: 40,
            ),
            label: new Text(
              'Upload Image',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            focusColor: Colors.green,
          ),
        ],
      );
    }
  }

  List<Widget> createcoulam(StorageUploadTask u, double progressPercent) {
    List<Widget> l = new List();
    print(u.onComplete);

    if (u.isComplete) {
      l.add(FlatButton.icon(
        onPressed: _startUpload,
        icon: Icon(
          Icons.cloud_upload,
          color: Colors.white,
          size: 40,
        ),
        label: new Text(
          'Upload Image',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        focusColor: Colors.green,
      ));
    } else {
      l.add(LinearProgressIndicator(
        value: progressPercent,
        backgroundColor: Colors.lime,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
      ));
    }
    return l;
  }
}
