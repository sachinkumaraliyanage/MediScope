/*
* File Name: ShowList.dart
* Author: S.K.Liyanage
* Reg No: IT17152938
* Date: 2020/03/10
* Description: Design and implementation of medicine list interface. This interface is used to show the list of medicine to the user.
* */

import 'package:MediScope/Utill/FirebaseData.dart';
import 'package:flutter/material.dart';
import '../Utill/Medicine.dart';
import '../Utill/CRUDModel.dart';
import 'FullBackground.dart';
import '../Utill/FirebaseAuthPr.dart';
import '../main.dart';
import 'AddMedicine.dart';
import 'ViewMedicine.dart';
import 'EditMedicine.dart';
import 'LoginPage.dart';

class ShowList extends StatefulWidget {
  //creat StatefulWidget class for ShowList and set state to it
  @override
  State<StatefulWidget> createState() => _ShowLists();
}

class _ShowLists extends State<ShowList> {
  String search = '';
  List<Widget> list = new List<Widget>();

  //get data from firebase and analyze and show list create
  void setlist() async {
    await new CRUDModel().fetchMedicines().then((value) {
      print("sachin ");
      list = new List();
      value.forEach((element) {
//        if (element.email == FirebaseDataApi.useremail) {
        if (search == '' || search == null) {
          list.add(new _MedicineContainerCreator(
                  new Medicine(element.id, element.name, element.details,
                      element.date, element.email, element.img),
                  this)
              .build(this.context));
        } else {
          List<String> a = element.name.split(search);
          print(a.length);
          if (a.length > 1) {
            list.add(new _MedicineContainerCreator(
                    new Medicine(element.id, element.name, element.details,
                        element.date, element.email, element.img),
                    this)
                .build(this.context));
          }
        }
//        }
      });
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (MainContoller.i) {
      MainContoller.i = false;
      setlist();
    }

    return Scaffold(
      body: new Stack(
        children: <Widget>[
          new FullBackground('assets/backimg/backlogin.jpg', 3.0, 3.0, 0.4),
          new Column(
            children: <Widget>[
              new Align(
                alignment: Alignment.topCenter,
                child: new Container(
                  padding:
                      EdgeInsets.only(bottom: 5, top: 35, left: 5, right: 20),
                  child: new Row(
                    children: <Widget>[
                      new IconButton(
                        icon: Icon(Icons.lock),
                        tooltip: 'LogOut',
                        splashColor: Colors.white,
                        iconSize: 40,
                        onPressed: () async {
                          await FirebaseAuthPr().logout();
                          MainContoller.i = true;
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new LoginPage()),
                          );
                        },
                      ),
                      new Expanded(
                        child: TextField(
                            keyboardType: TextInputType.text,
                            onChanged: (String val) {
                              setState(() {
                                search = val;
                                MainContoller.i = true;
                              });
                            },
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.blueAccent,
                            ),
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                prefixIcon: Icon(Icons.search),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Search By Name",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blueAccent, width: 32.0),
                                    borderRadius: BorderRadius.circular(20.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 32.0),
                                    borderRadius:
                                        BorderRadius.circular(20.0)))),
                      )
                    ],
                  ),
                ),
              ),
              new Expanded(
                  child: new SingleChildScrollView(
                child: new Column(
                  children: list,
                ),
              )),
              new Padding(padding: EdgeInsets.only(bottom: 60)),
            ],
          ),
          new Align(
              alignment: Alignment.bottomCenter,
              child: new Container(
                padding: EdgeInsets.only(bottom: 5, top: 10),
                child: new SizedBox(
                  width: 300.0,
                  height: 50.0,
                  child: new OutlineButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => new AddMedicine()),
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
                          " Add Data",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    borderSide: BorderSide(color: Colors.white, width: 4),
                    shape: StadiumBorder(),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

//generate single object for the interface
class _MedicineContainerCreator {

  Medicine m;
  _ShowLists aa;

  //constructor with parameters
  _MedicineContainerCreator(this.m, this.aa);

  Widget build(BuildContext context) {
    return Container(
        child: new Column(
      children: <Widget>[
        new SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: new Container(
            padding: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
            child: new Container(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: new Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                  ),
                  Image.network(
                    m.img,
                    width: 100,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                  ),
                  new Column(
                    children: <Widget>[
                      new Text(
                        m.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                      new Container(
                          padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Container(
                                decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.4),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.5),
                                    width: 4,
                                  ),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)),
                                ),
                                child: new IconButton(
                                  icon: Icon(Icons.remove_red_eye),
                                  tooltip: 'View',
                                  splashColor: Colors.white,
                                  iconSize: 40,
                                  onPressed: () {
                                    Navigator.push(
                                      aa.context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          new ViewMedicine(m)),
                                    );
                                  },
                                ),
                              ),
                              new Container(
                                margin: EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                  color: Colors.amber.withOpacity(0.4),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.5),
                                    width: 4,
                                  ),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)),
                                ),
                                child: new IconButton(
                                  icon: Icon(Icons.edit),
                                  tooltip: 'Edit',
                                  splashColor: Colors.white,
                                  iconSize: 40,
                                  onPressed: () {
                                    Navigator.push(
                                      aa.context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          new EditMedicine(m)),
                                    );
                                  },
                                ),
                              ),
                              new Container(
                                margin: EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                  color: Colors.red.withOpacity(0.4),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.5),
                                    width: 4,
                                  ),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)),
                                ),
                                child: new IconButton(
                                  icon: Icon(Icons.delete),
                                  tooltip: 'Delete',
                                  splashColor: Colors.white,
                                  iconSize: 40,
                                  onPressed: () async {
                                    showAlertDialog(aa.context, m, aa);
                                  },
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        new Padding(
          padding: EdgeInsets.only(top: 10),
        ),
      ],
    ));
  }

  showAlertDialog(BuildContext context2, Medicine m, _ShowLists aa) {
    // show the dialog
    showDialog(
      context: context2,
      builder: (BuildContext context) {
        // set up the buttons
        Widget delButton = FlatButton(
          child: Text("Delete"),
          onPressed: () async {
            MainContoller.i = true;
            await CRUDModel().removeMedicine(m.id);
            Navigator.of(context).pop();
            aa.setState(() {});
          },
        );
        Widget cancelButton = FlatButton(
          child: Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        );

        // set up the AlertDialog
        AlertDialog alert = AlertDialog(
          title: Text("Alert"),
          content: Text("Do you Want to Delete " + m.name),
          actions: [
            delButton,
            cancelButton,
          ],
        );
        return alert;
      },
    );
  }
}
