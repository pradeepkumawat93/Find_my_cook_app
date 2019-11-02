import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:find_my_cook_app/loader/loader.dart';

String current_cook_image =
    'https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg';
String cook_name = 'vishnu Jangid';
String cook_native = 'chomu, jaipur, Rajasthan';
int food_prepared_type = 2; //0(veg),1(non-veg),2(both)
double coock_rating = 3.5;
double experince = 2;
int no_person_rating_given = 121;

class ProfilePageForUser extends StatefulWidget {
  @override
  _ProfilePageForUserState createState() => _ProfilePageForUserState();
}

class _ProfilePageForUserState extends State<ProfilePageForUser> {
  double rating = 3.5;

  @override
  Container get_food_color_dot(var v) {
    if (food_prepared_type == 0) {
      return new Container(
        child: new Row(
          children: <Widget>[
            new Text("food prepare  "),
            new Dot(
              radius: 12.0,
              color: Colors.green,
            )
          ],
        ),
      );
    } else if (food_prepared_type == 1) {
      return new Container(
        child: new Row(
          children: <Widget>[
            new Text("food prepare "),
            new Dot(
              radius: 12.0,
              color: Colors.red,
            )
          ],
        ),
      );
    } else {
      return new Container(
        child: new Row(
          children: <Widget>[
            new Text("food prepare "),
            new Dot(
              radius: 10.0,
              color: Colors.green,
            ),
            new Text("  "),
            new Dot(
              radius: 10.0,
              color: Colors.red,
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new ClipPath(
            child: Container(
              color: Colors.black.withOpacity(0.8),
            ),
            clipper: getClipper(),
          ),
          new Positioned(
            width: 350.0,
            left: 25.0,
            top: MediaQuery.of(context).size.height / 5,
            child: Column(
              children: <Widget>[
                new Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                          image: NetworkImage(current_cook_image),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(75.0)),
                      boxShadow: [
                        BoxShadow(blurRadius: 7.0, color: Colors.black)
                      ]),
                ),
                SizedBox(height: 70.0),
                Text(
                  cook_name,
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Monteserrat'),
                ),
                SizedBox(height: 15.0),
                Text(
                  cook_native,
                  style: TextStyle(
                      fontSize: 17.0,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Monteserrat'),
                ),
                SizedBox(height: 5.0),
                new Container(
                  height: 30.0,
                  width: 120.0,
                  child: get_food_color_dot(food_prepared_type),
                ),
                new Container(
                  height: 30.0,
                  width: 120.0,
                  child: new Center(
                    child: new Text(
                      (experince.toString() + " Year"),
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 17.0,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                new Center(
                  child: new Container(
                    height: 30.0,
                    width: 120.0,
                    child: new StarRating(
                      rating: coock_rating,
                      onRatingChanged: (rating) =>
                          setState(() => this.rating = rating),
                    ),
                  ),
                ),
                new Container(
                  height: 40.0,
                  width: 120.0,
                  child: new Center(
                    child: new Row(
                      children: <Widget>[
                        new IconButton(
                          icon: Icon(Icons.mood),
                          color: Colors.green,
                        ),
                        new Text(no_person_rating_given.toString(),
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 17.0)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                new Container(
                  height: 30.0,
                  width: 120.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.greenAccent,
                    color: Colors.green,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () {
                        //NEED TO UPDATE---------------------------------------------------
                      },
                      child: Center(
                        child: Text(
                          'Book The Cook',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Monteserrat'),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                new Container(
                  height: 30.0,
                  width: 120.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.blueAccent,
                    color: Colors.blue,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () {
                        //NEED TO UPDATE---------------------------------------------------
                      },
                      child: Center(
                        child: Text(
                          'check profile',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Monteserrat'),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

typedef void RatingChangeCallback(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;

  StarRating(
      {this.starCount = 5, this.rating = .0, this.onRatingChanged, this.color});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = new Icon(
        Icons.star_border,
        color: Theme.of(context).buttonColor,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = new Icon(
        Icons.star_half,
        color: color ?? Theme.of(context).primaryColor,
      );
    } else {
      icon = new Icon(
        Icons.star,
        color: color ?? Theme.of(context).primaryColor,
      );
    }
    return new InkResponse(
      onTap:
          onRatingChanged == null ? null : () => onRatingChanged(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
        children:
            new List.generate(starCount, (index) => buildStar(context, index)));
  }
}
