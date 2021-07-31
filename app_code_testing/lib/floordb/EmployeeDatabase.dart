import 'dart:async';
import 'package:app_code_testing/floordb/EmployeeDao.dart';
import 'package:app_code_testing/model/EmployeeList.dart';
import 'package:floor/floor.dart';

import 'package:sqflite/sqflite.dart' as sqflite;


part 'user_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [EmployeeList])
abstract class EmployeeDatabase extends FloorDatabase {
  EmployeeDAO get userDAO;
}
