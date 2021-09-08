
import 'dart:convert';

import 'package:http/http.dart';
import 'package:rest_api/model/post_model.dart';

class Network{

   static String BASE = "dummy.restapiexample.com";

   // http Apis //
  static  String API_GET1 = "/api/v1/employees";
  static  String API_GET2 = "/api/v1/employee/";  //{id}
  static  String API_POST = "/api/v1/create";
  static  String API_PUT = "/api/v1/update/";   //{id}
  static  String API_DELETE = "/api/v1/delete/";  //{id}


   // http requests //
  static Future<String> GET(String api, Map<String, String> params ) async{
    var uri = Uri.http(BASE, api, params);
     var response = await get(uri, );
     if(response.statusCode == 200){
       return response.body;
     }
     return null;
  }

   static Future<String> POST(String api, Map<String, String> params) async{
     var uri = Uri.http(BASE, api, params);
     var response = await post(uri, );
     if(response.statusCode == 200 || response.statusCode == 201){
       return response.body;
     }
     return null;
   }

   static Future<String> PUT(String api, Map<String, String> params) async{
     var uri = Uri.http(BASE, api, params);
     var response = await put(uri,);
     if(response.statusCode == 200){
       return response.body;
     }
     return null;
   }

   static Future<String> DELETE(String api, Map<String, String> params) async{
     var uri = Uri.http(BASE, api,);
     var response = await delete(uri);
     if(response.statusCode == 200){
       return response.body;
     }
     return null;
   }

   // http params //
   static Map<String, String> paramsEmpty(){
    Map<String, String> params = new Map();
    return params;
   }

   static Map<String, String> paramsCreate(Post post){
    Map<String, String> params = new Map();
    params.addAll({
      "employee_name" : post.employee_name,
      "employee_salary": post.employee_salary.toString(),
      "employee_age" : post.employee_age.toString(),
    });
    return params;
   }

    static Map<String, String> paramsUpdate(Post post) {
    Map<String, String> params = Map();
    params.addAll({
      "id" : post.id.toString(),
      "employee_name" : post.employee_name,
      "employee_salary": post.employee_salary.toString(),
      "employee_age" : post.employee_age.toString()
    });
    return params;
    }

}