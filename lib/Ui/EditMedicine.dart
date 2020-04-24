/*
* File Name: EditMedicine.dart
* Author: S.K.Liyanage
* Reg No: IT17152938
* Date: 2020/03/10
* Description: Contains interface design for medicine edit function.
* */

import 'package:MediScope/Utill/FirebaseData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'FullBackground.dart';
import 'package:intl/intl.dart';
import '../main.dart';
import '../Utill/CRUDModel.dart';
import '../Utill/Medicine.dart';
import 'ShowList.dart';
import 'ImageCapture.dart';

class EditMedicine extends StatefulWidget {
  Medicine m; //store current values

  //constructor with parameters for set Medicine current value to object
  EditMedicine(this.m) {
    Medicine.imgurl = m.img;
  }

  //creat StatefulWidget class for EditMedicine and set state to it
  @override
  State<StatefulWidget> createState() => _EditMedicineState(m);
}

class _EditMedicineState extends State<EditMedicine> {
  Medicine m; //store current values

  //create TextEditingController
  TextEditingController name = TextEditingController();
  TextEditingController dis = TextEditingController();

  //create GlobalKey for access in another class or state
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  //constructor with parameters for set Medicine current value to object
  _EditMedicineState(this.m);

  @override
  Widget build(BuildContext context) {
    //set current values
    Medicine.s = this;
    //set value to TextField
    name.text = m.name;
    dis.text = m.details;

    TextStyle textStyle = Theme.of(context).textTheme.headline5;
    return Scaffold(
      key: _scaffoldkey,
      body: Center(
        child: new Container(
          child: new Stack(
            children: <Widget>[
              new FullBackground('assets/backimg/backlogin.jpg', 3.0, 3.0, 0.4),// set Background image
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
                                    controller: name,//set TextEditingController
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
                                    controller: dis,//set TextEditingController
                                    keyboardType: TextInputType.text,
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
                                      'Edit Photo',
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
                                  var now = new DateTime.now();
                                  String date =
                                      new DateFormat("yyyy-MM-dd HH:mm:ss")
                                          .format(now);
                                  await new CRUDModel().updateMedicine(
                                      new Medicine(
                                          m.id,
                                          name.text,
                                          dis.text,
                                          date,
                                          FirebaseDataApi.useremail,
                                          Medicine.imgurl),
                                      m.id);
                                  Medicine.imgurl = " ";
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
                                      Icons.edit,
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      " Edit",
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
}
