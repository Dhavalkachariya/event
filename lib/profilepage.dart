import 'package:event/dbhelper/sqfliteDatabase.dart';
import 'package:flutter/material.dart';
import 'package:event/dbhelper/model.dart';

Future<List<sqfliteDbmodel>> fetchEmployeesFromDatabase() async {
  var dbHelper =sqfliteDatabase();
  Future<List<sqfliteDbmodel>> employees = dbHelper.getModelsFromMapList();
  return employees;
}

class profile extends StatefulWidget {
  @override
  State<profile> createState() => new _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Employee List'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(16.0),
        child: new FutureBuilder<List<sqfliteDbmodel>>(
          future: fetchEmployeesFromDatabase(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return new ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(snapshot.data![index].name,
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18.0)),
                          new Text(snapshot.data![index].email,
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14.0)),
                          new Divider()
                        ]);
                  });
            } else if (snapshot.hasError) {
              return new Text("${snapshot.error}");
            }
            return new Container(alignment: AlignmentDirectional.center,child: new CircularProgressIndicator(),);
          },
        ),
      ),
    );
  }
}