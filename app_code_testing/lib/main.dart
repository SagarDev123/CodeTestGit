import 'dart:convert';

import 'package:app_code_testing/CommonUtils/Constants.dart';
import 'package:app_code_testing/model/EmployeeList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'employee_item/employee_child.dart';
import 'floordb/EmployeeDatabase.dart';

// @dart=2.9
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Employees'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key,  this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  EmployeeDatabase database;
  int _counter = 0;
 bool isEmployeeListAlreadyExist =false;
  List<EmployeeList> employee_list = new  List<EmployeeList>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(isEmployeeListAlreadyExist){
      initDataBase();  //Not Completed
    }else{
      getEmployeeDetails();
    }
  }

  Future<void> getEmployeeDetails() async {
    final response =
        await http.post(Constants.BASE_URL + "5d565297300000680030a986");
    if(response.statusCode==200){
     // print('Employee List : ' + response.body.toString());
      Iterable l = jsonDecode(response.body);
      List<EmployeeList> employee = List<EmployeeList>.from(l.map((model)=> EmployeeList.fromJson(model)));

      setState(() {
        employee_list = employee;

        for(var emp in employee_list){
          print("Employee ${emp.name}");
        }
      });

    }
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Container(
              child: ListView.builder(
                  itemCount: employee_list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return EmployeeCellStateLessWidget(
                        employeeList: employee_list[index]);
                  }),
            ),)
          ],
        ),
      ),
    );
  }

  Future<void> initDataBase() async {
    // final database = await $FloorAppDatabase.databaseBuilder('user_database.db').build();
    //
    // final personDao = database.personDao;
    // final person = Person(1, 'Frank');
    //
    // await personDao.insertPerson(person);
    // final result = await personDao.findPersonById(1);
  }


}
