import 'package:flutter/material.dart';

import 'package:find_my_cook_app/loader/loader.dart';
import 'package:find_my_cook_app/Utils/common.dart';
import 'package:find_my_cook_app/Utils/common_structure.dart';
import 'package:find_my_cook_app/Utils/future_common_func.dart';

class cook_list_main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'cook_list_main',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Coock_list(title: 'Coock List'),
    );
  }
}

// ignore: camel_case_types
class Coock_list extends StatefulWidget {
  Coock_list({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Coock_listState createState() => _Coock_listState();
}

class _Coock_listState extends State<Coock_list> {
  String api_UserToCoockFirstList = "http://192.168.0.106:3000/api";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("buddy List"),
      ),
      body: Container(
        child: FutureBuilder(
          future: getUserToCoockFirstList(api_UserToCoockFirstList),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Center(
                  child: Container(
                child: Loader(),
              ));
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(snapshot.data[index].pic),
                    ),
                    title: Text(snapshot.data[index].name),
                    subtitle: Text(snapshot.data[index].email),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  DetailedPage(snapshot.data[index])));
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class DetailedPage extends StatelessWidget {
  final UserToCoockFirstList cookData;

  DetailedPage(this.cookData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cookData.name),
      ),
    );
  }
}
