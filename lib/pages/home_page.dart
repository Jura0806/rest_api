import 'package:flutter/material.dart';
import 'package:rest_api/model/empList_model.dart';
import 'package:rest_api/model/emp_model.dart';
import 'package:rest_api/model/empone_model.dart';
import 'package:rest_api/model/post_model.dart';
import 'package:rest_api/pages/emp_one.dart';
import 'package:rest_api/services/http_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  static final String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Employee> items = [];



  void _apiEmployeeList(){
    Network.GET(Network.API_EMP_LIST,  Network.paramsEmpty()).then((response) => {
      print(response),
      _showResponse(response),
    });
  }

  void _apiEmpOne(int id){
    Network.GET(Network.API_Employee + id.toString(),  Network.paramsEmpty()).then((response) => {
      print(response),
      _showResponse(response),
    });
  }

  void _apiPostCreate(Post post){
    Network.POST(Network.API_POST,  Network.paramsCreate(post)).then((response) => {
      print(response),
      _showResponse(response),
    });
  }

  void _apiUpdateList(Post post){
    Network.PUT(Network.API_PUT + post.id.toString(),  Network.paramsUpdate(post)).then((response) => {
      print(response),
      _showResponse(response),
    });
  }

  void _apiDeleleteList(Post post){
    Network.DELETE(Network.API_DELETE + post.id.toString(),  Network.paramsEmpty()).then((response) => {
      print(response),
      _showResponse(response),
    });
  }

   void _showResponse(String response){
    EmpList empList = Network.parseEmpList(response);
     setState(() {
       items = empList.data;
     });
   }

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiEmployeeList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee List"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, i){
         return itemOfList(items[i]);
        },
      ),
    );
  }

  Widget itemOfList(Employee emp){
    return GestureDetector(
      onTap: (){
        Navigator.push(context,  MaterialPageRoute (
          builder: (BuildContext context) =>  EmpOnePage(name: emp.employee_name, emp_age: emp.employee_age, salary: emp.employee_salary.toString(),),
        ),);
      },
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(bottom: 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(emp.employee_name + "(" + emp.employee_age.toString() + ")" , style: TextStyle(color: Colors.black, fontSize: 20),),
            SizedBox(height: 10,),
            Text(emp.employee_salary.toString() +"\$", style: TextStyle(color: Colors.black, fontSize: 18),),
          ],
        ),
      ),
    );
  }
}
