import 'package:app_code_testing/details/Details.dart';
import 'package:app_code_testing/model/EmployeeList.dart';
import 'package:flutter/material.dart';

// @dart=2.9
class EmployeeCellStateLessWidget extends StatelessWidget {
  final EmployeeList employeeList;

  EmployeeCellStateLessWidget({Key key, this.employeeList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmployeeStateFullWidget(employeeList: employeeList);
  }
}

class EmployeeStateFullWidget extends StatefulWidget {
  final EmployeeList employeeList;

  EmployeeStateFullWidget({Key key, this.employeeList});

  @override
  _StateEmployeeCell createState() => _StateEmployeeCell();
}

class _StateEmployeeCell extends State<EmployeeStateFullWidget> {
  String employeeName = "";
  String employeeEmailId = "";
  String employeeAddress ="";
  String employeePhone ="";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    employeeName = widget.employeeList.name;
    employeeEmailId ="Email : ${widget.employeeList.email}" ;
    if(widget.employeeList.address!=null){
      employeeAddress = "Address : ${widget.employeeList.address.suite}, ${widget.employeeList.address.street}, ${widget.employeeList.address.city}, ${widget.employeeList.address.zipcode}";
    }
    if(widget.employeeList.phone!=null){
      employeePhone = "Ph no: ${widget.employeeList.phone}";
    }else{
      employeePhone = "Phone Number Not Available";
    }






  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Details(employeeList:widget.employeeList)),
          );


        },
        child: Container(
          child: Card(
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(children: <Widget>[
                  Text(employeeName,style: TextStyle(color: Colors.black38,fontSize: 15),),
                  SizedBox(height: 10,),
                  Align(alignment: Alignment.topLeft,
                  child: Text(employeeEmailId),),
                  SizedBox(height: 10,),
                  Align(alignment: Alignment.topLeft,
                    child: Text(employeeAddress),),
                  SizedBox(height: 10,),
                  Align(alignment: Alignment.topLeft,
                    child: Text(employeePhone),),
                ],),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ));
  }
}
