import 'package:flutter/material.dart';

class Dot extends StatelessWidget {
  final double radius;
  final Color color;

  Dot({this.radius, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: this.radius,
        height: this.radius,
        decoration: BoxDecoration(color: this.color, shape: BoxShape.circle),
      ),
    );
  }
}

Container getTypeOfFoodColorDot(var type_of_food, double radius) {
  if (type_of_food == 0) {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Text("food prepare  "),
          new Dot(
            radius: radius,
            color: Colors.green,
          )
        ],
      ),
    );
  } else if (type_of_food == 1) {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Text("food prepare "),
          new Dot(
            radius: radius,
            color: Colors.red,
          )
        ],
      ),
    );
  } else if (type_of_food == 2) {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Text("food prepare "),
          new Dot(
            radius: (radius-2.0),
            color: Colors.green,
          ),
          new Text("  "),
          new Dot(
            radius: (radius-2.0),
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
