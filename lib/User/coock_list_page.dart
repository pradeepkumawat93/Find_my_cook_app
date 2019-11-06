import 'package:flutter/material.dart';
import 'package:find_my_cook_app/loader/loader.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  Future<List<CoockBasicList>> _getCookList() async {
    var data = await http.get("http://localhost:3000/coock_list");
    var jsondata = json.decode(data.body);
    List<CoockBasicList> cooklist = [];
    for (var u in jsondata) {
      CoockBasicList cook = CoockBasicList(
          u['index'], u['about'], u['name'], u['email'], u['picture']);
      cooklist.add(cook);
    }

    return cooklist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(""),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getCookList(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Center(
                  child: Container(
                child: Text("Loading..."), //Loader(),
              ));
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(snapshot.data[index].picture),
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

class CoockBasicList {
  final String index;
  final String about;
  final String name;
  final String email;
  final String picture;

  CoockBasicList(this.index, this.about, this.name, this.email, this.picture);
}

class DetailedPage extends StatelessWidget {
  final CoockBasicList cookData;

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
