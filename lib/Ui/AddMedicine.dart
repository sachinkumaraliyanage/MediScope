import 'package:MediScope/Utill/FirebaseData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'FullBackground.dart';
import 'package:intl/intl.dart';
import '../main.dart';
import '../Utill/CRUDModel.dart';
import '../Utill/Medicine.dart';
import 'ShowList.dart';

class AddMedicine extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  TextEditingController name = TextEditingController();
  TextEditingController dis = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline5;
    return Scaffold(
      key: _scaffoldkey,
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
                                      'Medicine Name',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  new Padding(
                                      padding: EdgeInsets.only(top: 10)),
                                  new TextField(
                                    controller: name,
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
                                    controller: dis,
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
                                  _scaffoldkey.currentState.showSnackBar(SnackBar(
                                    content: new Text("Please Wait ",),
                                  ),

                                  );
                                  MainContoller.i = true;
                                  var now = new DateTime.now();
                                  String date =
                                      new DateFormat("yyyy-MM-dd HH:mm:ss")
                                          .format(now);
                                  await new CRUDModel().addMedicine(new Medicine(null,name.text,dis.text,date,FirebaseDataApi.useremail));
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => new ShowList()),
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
}
