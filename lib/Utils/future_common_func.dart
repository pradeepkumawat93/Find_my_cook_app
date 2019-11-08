import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:find_my_cook_app/Utils/common_structure.dart';


Future<List<UserToCoockFirstList>> getUserToCoockFirstList(var ApiPath) async {
  var data = await http.get(ApiPath);
  var jsondata = json.decode(data.body);

  List<UserToCoockFirstList> cooklist = [];
  for (var u in jsondata["data"]) {
    UserToCoockFirstList cook = UserToCoockFirstList(
        u['uname'], u['email'], u['gender'], u['age'], u['tofp'], u['pic']);
    cooklist.add(cook);
  }
  return cooklist;
}
