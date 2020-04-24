/*
* File Name: ViewMedicine.dart
* Author: S.K.Liyanage
* Reg No: IT17152938
* Date: 2020/03/10
* Description: Contains interface design for medicine view function.
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

class ViewMedicine extends StatefulWidget {
  Medicine m;

  //constructor with parameters for set Medicine current value to object
  ViewMedicine(this.m);
  //creat StatefulWidget class for ViewMedicine and set state to it
  @override
  State<StatefulWidget> createState() => _ViewMedicineState(m);
}

class _ViewMedicineState extends State<ViewMedicine> {
  Medicine m;
  TextEditingController name = TextEditingController();
  TextEditingController dis = TextEditingController();

  _ViewMedicineState(this.m);

  @override
  Widget build(BuildContext context) {
    name.text = m.name;
    dis.text = m.details;
    TextStyle textStyle = Theme.of(context).textTheme.headline5;
    return Scaffold(
      body: Center(
        child: new Container(
          child: new Stack(
            children: <Widget>[
              new FullBackground('assets/backimg/backlogin.jpg', 3.0, 3.0, 0.4),
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
                                      'Medicine Name : ',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  new Padding(
                                      padding: EdgeInsets.only(top: 10)),
                                  new Container(
                                    child: new Align(
                                      alignment: Alignment.center,
                                      child: new Text(
                                        '  ' + m.name,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ),
                                  new Padding(
                                      padding: EdgeInsets.only(top: 20)),
                                  new Align(
                                    alignment: Alignment.centerLeft,
                                    child: new Text(
                                      'Medicine Description : ',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  new Padding(
                                      padding: EdgeInsets.only(top: 10)),
                                  new Container(
                                    child: new Align(
                                      alignment: Alignment.center,
                                      child: new Text(
                                        '  ' + m.details,
                                        maxLines: 10,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ),
                                  new Padding(
                                      padding: EdgeInsets.only(top: 20)),
                                  new Align(
                                    alignment: Alignment.centerLeft,
                                    child: new Text(
                                      'Image Of Medicine: ',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  new Padding(
                                      padding: EdgeInsets.only(top: 10)),
                                  Image.network(
                                    m.img,
                                    width: 100,
                                  ),
                                  new Padding(
                                      padding: EdgeInsets.only(top: 20)),
                                  new Align(
                                    alignment: Alignment.centerLeft,
                                    child: new Text(
                                      'Add Or Edit Date And Time : ',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  new Padding(
                                      padding: EdgeInsets.only(top: 10)),
                                  new Container(
                                    child: new Align(
                                      alignment: Alignment.center,
                                      child: new Text(
                                        '  ' + m.date,
                                        maxLines: 10,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
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
                                onPressed: () => Navigator.of(context).pop(),
                                splashColor: Colors.green,
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Icon(
                                      Icons.arrow_back,
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      " Back",
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
