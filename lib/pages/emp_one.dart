import 'package:flutter/material.dart';
import 'package:rest_api/model/empone_model.dart';

class EmpOnePage extends StatefulWidget {
  static final String id = "emp_one";

    final String name;
    final int emp_age;
    final String salary;


  EmpOnePage({this.name, this.emp_age, this.salary});
  @override
  _EmpOnePageState createState() => _EmpOnePageState();
}

class _EmpOnePageState extends State<EmpOnePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee One"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.name + "(" + widget.emp_age.toString() + ")" , style: TextStyle(color: Colors.black, fontSize: 20),),
            SizedBox(height: 10,),
            Text(widget.salary +"\$", style: TextStyle(color: Colors.black, fontSize: 18),),
          ],
        ),
      ),
    );
  }
}
