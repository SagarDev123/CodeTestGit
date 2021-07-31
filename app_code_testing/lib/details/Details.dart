import 'package:app_code_testing/model/EmployeeList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

// @dart=2.9
class Details extends StatelessWidget {
  final EmployeeList employeeList;

  Details({Key key, this.employeeList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DetailsStateFullWidget(
      employeeList: employeeList,
    );
  }
}

class DetailsStateFullWidget extends StatefulWidget {
  final EmployeeList employeeList;

  DetailsStateFullWidget({Key key, this.employeeList});

  @override
  _StateDetails createState() => _StateDetails();
}

class _StateDetails extends State<DetailsStateFullWidget> {
  String employeeImage = "";
  String employeeName = "";
  String employeeEmailId = "";
  String employeeAddress = "";
  String employeePhone = "";
  String employeeWebsite ="";
  String employeeCompany ="";
  String employeeGeo ="";



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.employeeList.profileImage != null) {
      employeeImage = widget.employeeList.profileImage;
    }

    employeeName = widget.employeeList.name;
    employeeEmailId = "Email : ${widget.employeeList.email}";
    if (widget.employeeList.address != null) {

      if(widget.employeeList.address.geo!=null){
        employeeGeo = "Geolocation :- Lat : ${widget.employeeList.address.geo.lat} , Long : ${widget.employeeList.address.geo.lng} ";
      }


      employeeAddress =
          "Address : ${widget.employeeList.address.suite},\n ${widget.employeeList.address.street}, ${widget.employeeList.address.city},\n ${widget.employeeList.address.zipcode}";
    }
    if (widget.employeeList.phone != null) {
      employeePhone = "Ph no: ${widget.employeeList.phone}";
    } else {
      employeePhone = "Ph no: Not Available";
    }


    if(widget.employeeList.company!=null){
      employeeCompany = " ${widget.employeeList.company.name},\n ${widget.employeeList.company.catchPhrase},\n ${widget.employeeList.company.bs}";
    }

    if(widget.employeeList.website!=null){
      employeeWebsite = "Website link : ${widget.employeeList.website}";
    }else{
      employeeWebsite = "Website not available";
    }






  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          },
        ),
        title: Text(
          "Employee Details",
          style: TextStyle(
              color: Colors.white, fontFamily: 'KarlaBold', fontSize: 16),
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(employeeImage),
                          ))),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    employeeName,
                    style: TextStyle(color: Colors.black38, fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(employeeEmailId),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(employeeAddress),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(employeeGeo),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(employeePhone),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(employeeWebsite),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text("Company:- "),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(employeeCompany),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
