import 'package:flutter/material.dart';

import 'package:find_my_cook_app/Cook/profile_page_for_user.dart';
import 'package:find_my_cook_app/Cook/profile_page.dart';

class Main_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text("Page 2"),
      ),
      body: Center(
        child: ProfilePageForUser(),
      ),
    );
  }
}