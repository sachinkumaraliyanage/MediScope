import 'package:MediScope/Utill/FirebaseData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Utill/Medicine.dart';
import '../Utill/CRUDModel.dart';
import 'FullBackground.dart';
import '../Utill/FirebaseAuthPr.dart';
import '../main.dart';
//sachin kumara Liyanage
//IT17152938
class ShowList extends StatefulWidget{

  @override
  State<StatefulWidget> createState() =>_ShowLists();



}


class _ShowLists extends State<ShowList>{
  String search='';
  List <Widget> list=new List<Widget>();

  void setlist() async{
    await new CRUDModel().fetchMedicines().then((value){
      print("sachin ");
      list=new List();
      value.forEach((element) {
        if(element.email==FirebaseDataApi.useremail){
          if(search==''||search==null){
            list.add(new _MedicineContainerCreator(new Medicine(element.id, element.name,element.details,element.date,element.email)).build(this.context));
          }else{
            List<String> a= element.name.split(search);
            print(a.length);
            if(a.length>1){
              list.add(new _MedicineContainerCreator(new Medicine(element.id, element.name,element.details,element.date,element.email)).build(this.context));
            }
          }

        }
      });

    });

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    if(MainContoller.i){
      MainContoller.i=false;
      setlist();
    }



    return Scaffold(
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
                                MainContoller.i=true;
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
                child:new Column(
                  children:list,
                ),
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

class _MedicineContainerCreator {
  Medicine m;

  _MedicineContainerCreator(this.m);


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