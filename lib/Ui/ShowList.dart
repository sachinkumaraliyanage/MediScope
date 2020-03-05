import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Utill/Medicine.dart';
//sachin kumara Liyanage
//IT17152938
class ShowList extends StatelessWidget{
  List <_MedicineContainerCreator> list=new List<_MedicineContainerCreator>();

  @override
  Widget build(BuildContext context) {
    list.add(new _MedicineContainerCreator(new Medicine('sachin','data')));
    list.add(new _MedicineContainerCreator(new Medicine('kumara','data')));

    return Column(
      children: list,
    );
  }

}

class _MedicineContainerCreator extends StatelessWidget{
  Medicine m;

  _MedicineContainerCreator(this.m);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:new Column(
        children: <Widget>[
          new Container(
        padding: EdgeInsets.only(top:5,bottom: 5 ,left: 20,right: 20),
            child: new Container(
              padding: EdgeInsets.only(top:10,bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),

                borderRadius: BorderRadius.all(
                    Radius.circular(10.0)
                ),
              ),
              child: new Column(
                children: <Widget>[
                  new Text(
                      m.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                  new Container(
                    padding: EdgeInsets.only(left: 10,right: 10,top: 5),
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
                              borderRadius: BorderRadius.all(
                                  Radius.circular(50.0)
                              ),
                            ),
                            child: new IconButton(
                              icon: Icon(Icons.remove_red_eye),
                              tooltip: 'LogOut',
                              splashColor: Colors.white,
                              iconSize: 40,
                              onPressed: () {

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
                              borderRadius: BorderRadius.all(
                                  Radius.circular(50.0)
                              ),
                            ),
                            child: new IconButton(
                              icon: Icon(Icons.edit),
                              tooltip: 'LogOut',
                              splashColor: Colors.white,
                              iconSize: 40,
                              onPressed: () {

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
                              borderRadius: BorderRadius.all(
                                  Radius.circular(50.0)
                              ),
                            ),
                            child: new IconButton(
                              icon: Icon(Icons.delete),
                              tooltip: 'LogOut',
                              splashColor: Colors.white,
                              iconSize: 40,
                              onPressed: () {

                              },
                            ),
                          )
                        ],
                      )
                  ),
                ],

              ),
            ),
          ),
          new Padding(
              padding: EdgeInsets.only(top:10),
          ),
        ],
      )
    );
  }

}