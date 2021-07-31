
import 'package:app_code_testing/model/EmployeeList.dart';
import 'package:floor/floor.dart';

@dao
abstract class EmployeeDAO {
  @insert
  Future<List<int>> insertUser(List<EmployeeList> user);

  @Query('SELECT * FROM EmployeeList')
  Future<List<EmployeeList>> retrieveUsers();

  @Query('DELETE FROM EmployeeList WHERE id = :id')
  Future<EmployeeList> deleteUser(int id);
}