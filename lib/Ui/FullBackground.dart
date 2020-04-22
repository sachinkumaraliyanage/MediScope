import 'dart:ui';
import 'package:flutter/material.dart';

//sachin kumara Liyanage
//IT17152938

class FullBackground extends StatelessWidget {
  // add background image for any class
  String _path = "";//image path
  double _x = 0.0;// sigma x for image blur
  double _y = 0.0;//sigma y for image blur
  double _opacity = 0.0;//opacity level for  image over layer Box Decoration

  //constructor with parameters
  FullBackground(this._path, this._x, this._y, this._opacity); //

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
            image: new AssetImage(_path), fit: BoxFit.cover),
      ),
      child: new BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: _x, sigmaY: _y),
        child: new Container(
          decoration: new BoxDecoration(
            color: Colors.black.withOpacity(_opacity),
          ),
        ),
      ),
    );
  }
}
