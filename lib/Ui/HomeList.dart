import 'package:flutter/material.dart';
import '../Utill/FirebaseAuthPr.dart';
import '../main.dart';
import 'FullBackground.dart';
import 'ShowList.dart';

//sachin kumara Liyanage
//IT17152938

class HomeList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>new _HomeList();

}

class _HomeList extends State<HomeList>{
  String search='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: new AppBar(
//        backgroundColor: Colors.green,
//        leading: new IconButton(
//          icon: new Icon(Icons.lock, color: Colors.black,size: 40,),
//          onPressed: () async {
//            await FirebaseAuthPr().logout();
//
//            Navigator.pushReplacement(
//              context,
//              MaterialPageRoute(builder: (context) => new MainContoller()),
//            );
//
//          },
//        ),
//        title: Text("Medi Scope",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
//        centerTitle: true,
//      ),
      body:  new Stack(
          children: <Widget>[
            new FullBackground('assets/backimg/backlogin.jpg', 3.0, 3.0, 0.4),
            new Column(
              children: <Widget>[
                new Align(
                  alignment: Alignment.topCenter,
                  child: new Container(
                    padding: EdgeInsets.only(bottom: 5,top: 35,left: 5,right: 20),
                    child: new Row(
                      children: <Widget>[
                        new IconButton(
                          icon: Icon(Icons.lock),
                          tooltip: 'LogOut',
                          splashColor: Colors.white,
                          iconSize: 40,
                          onPressed: () async {
                            await FirebaseAuthPr().logout();

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => new MainContoller()),
                            );

                          },
                        ),

                        new Expanded(
                          child: TextField(
                              keyboardType: TextInputType.text,
                              onChanged: (String val){
                                setState(() {
                                  search=val;
                                });
                              },
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.blueAccent,
                              ),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                  prefixIcon: Icon(Icons.search),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Search By Name",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.blueAccent, width: 32.0),
                                      borderRadius: BorderRadius.circular(20.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white, width: 32.0),
                                      borderRadius: BorderRadius.circular(20.0)
                                  )
                              )
                          ),
                        )

                      ],
                    ),
                  ),
                ),

                new Expanded(child: new SingleChildScrollView(
                  child:ShowList(),
                )),

                new Padding(padding: EdgeInsets.only(bottom: 60)),

              ],
            ),



            new Align(
                alignment:Alignment.bottomCenter,
                child: new Container(
                  padding: EdgeInsets.only(bottom: 5,top: 10),
                  child: new SizedBox(
                    width: 300.0,
                    height: 50.0,

                    child: new OutlineButton(
                      onPressed: () {

                      },
                      splashColor: Colors.green,
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Icon(Icons.add,size: 50,color: Colors.white,),
                          Text(
                            " Add Data",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      borderSide: BorderSide(color: Colors.white,width: 4),
                      shape: StadiumBorder(),
                    ),
                  ),
                )
            ),


          ],
        ),

    );
  }

}