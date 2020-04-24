/*
* File Name: AddMedicine.dart
* Author: S.K.Liyanage
* Reg No: IT17152938
* Date: 2020/03/10
* Description: Contains interface design for medicine add function.
*
* */

import 'package:MediScope/Utill/FirebaseData.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'FullBackground.dart';
import 'package:intl/intl.dart';
import '../main.dart';
import '../Utill/CRUDModel.dart';
import '../Utill/Medicine.dart';
import 'ShowList.dart';
import 'ImageCapture.dart';
import '../Utill/locator.dart';

class AddMedicine extends StatefulWidget {
  //creat StatefulWidget class for AddMedicine and set state to it
  @override
  State<StatefulWidget> createState() => AddMedicineState();
}

class AddMedicineState extends State<AddMedicine> {

  //create TextEditingController
  TextEditingController name = TextEditingController();
  TextEditingController dis = TextEditingController();

  //create GlobalKey for access in another class or state
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Medicine.s = this;
    print(Medicine.imgurl);
    TextStyle textStyle = Theme.of(context).textTheme.headline5;
    return Scaffold(
      key: _scaffoldkey,
      body: Center(
        child: new Container(
          child: new Stack(
            children: <Widget>[
              new FullBackground('assets/backimg/backlogin.jpg', 3.0, 3.0, 0.4), // set Background image
              new SingleChildScrollView(
                  child: new Container(
                      margin: EdgeInsets.fromLTRB(20, 80, 20, 80),
                      child: new Center(
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Container(
                              padding: EdgeInsets.only(
                                  top: 10, bottom: 10, left: 10, right: 10),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.4),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              child: new Column(
                                children: <Widget>[
                                  new Padding(
                                      padding: EdgeInsets.only(top: 10)),
                                  new Align(
                                    alignment: Alignment.centerLeft,
                                    child: new Text(
                                      'Medicine Name',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  new Padding(
                                      padding: EdgeInsets.only(top: 10)),
                                  new TextField(
                                    controller: name, //set TextEditingController
                                    keyboardType: TextInputType.text,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                        hintText: "Medicine Name",
                                        labelStyle: textStyle,
                                        contentPadding: EdgeInsets.fromLTRB(
                                            20.0, 15.0, 20.0, 15.0),
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.blueAccent,
                                                width: 32.0),
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white,
                                                width: 32.0),
                                            borderRadius:
                                                BorderRadius.circular(20.0))),
                                  ),
                                  new Padding(
                                      padding: EdgeInsets.only(top: 20)),
                                  new Align(
                                    alignment: Alignment.centerLeft,
                                    child: new Text(
                                      'Medicine Description',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  new Padding(
                                      padding: EdgeInsets.only(top: 10)),
                                  new TextField(
                                    controller: dis, //set TextEditingController
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 10,
                                    decoration: InputDecoration(
                                        hintText: "Medicine Description",
                                        labelStyle: textStyle,
                                        contentPadding: EdgeInsets.fromLTRB(
                                            20.0, 15.0, 20.0, 15.0),
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.blueAccent,
                                                width: 32.0),
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white,
                                                width: 32.0),
                                            borderRadius:
                                                BorderRadius.circular(20.0))),
                                  ),
                                  new Padding(
                                      padding: EdgeInsets.only(top: 20)),
                                  new Align(
                                    alignment: Alignment.centerLeft,
                                    child: new Text(
                                      'Add Photo',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  new Padding(
                                      padding: EdgeInsets.only(top: 10)),
                                  new FlatButton.icon(
                                    onPressed: () {
                                      //route to ImageCapture interface
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                new ImageCapture()),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.cloud_upload,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    label: new Text(
                                      'Upload Image',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ),
                                  new Padding(
                                      padding: EdgeInsets.only(top: 10)),
//                                  _logeimage();
                                  Image.network(
                                    Medicine.imgurl,
                                    width: 100,
                                  ),
                                  new Padding(
                                      padding: EdgeInsets.only(top: 10)),
                                ],
                              ),
                            ),
                            new Padding(padding: EdgeInsets.only(top: 20)),
                            new SizedBox(
                              width: 300.0,
                              height: 50.0,
                              child: new OutlineButton(
                                onPressed: () async {
                                  // send add data to CRUDModel and redirect to main list
                                  _scaffoldkey.currentState.showSnackBar(
                                    SnackBar(
                                      content: new Text(
                                        "Please Wait ",
                                      ),
                                    ),
                                  );
                                  MainContoller.i = true;
                                  //get current datetime
                                  var now = new DateTime.now();
                                  String date =
                                      new DateFormat("yyyy-MM-dd HH:mm:ss")
                                          .format(now);

                                  await new CRUDModel().addMedicine(
                                      new Medicine(
                                          null,
                                          name.text,
                                          dis.text,
                                          date,
                                          FirebaseDataApi.useremail,
                                          Medicine.imgurl));
                                  Medicine.imgurl = "";
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => new ShowList()),
                                  );
                                },
                                splashColor: Colors.green,
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Icon(
                                      Icons.add,
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      " Add",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                borderSide:
                                    BorderSide(color: Colors.white, width: 4),
                                shape: StadiumBorder(),
                              ),
                            ),
                          ],
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }

//  Future<String> _geturl(String url) async {
////    print("object");
////    print(await FirebaseStorage(storageBucket: firebaseImageUrl).ref().child(url).getDownloadURL(url).then((value) => value.toString()));
//    String path = await FirebaseStorage(storageBucket: firebaseImageUrl)
//        .ref()
//        .child(url)
//        .getDownloadURL()
//        .then((value) => value.toString());
//    print(path);
//    return path;
//  }
}
