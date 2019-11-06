import 'package:flutter/material.dart';
import 'package:find_my_cook_app/Cook/main_page.dart';

String utype;
class UserTypeValidator extends StatefulWidget {
  @override
  _UserTypeValidatorState createState() => _UserTypeValidatorState(utype);
}

class _UserTypeValidatorState extends State<UserTypeValidator> {

  String usertype = "Admin";

  @override
  bool usercall(String usertype){

  }

  _UserTypeValidatorState(this.usertype);

  @override
  Widget build(BuildContext context) {
    return Container(
      //child: usercall(""),
    );
  }
}
