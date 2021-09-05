import 'package:flutter/material.dart';
import 'package:rest_api/model/post_model.dart';
import 'package:rest_api/services/http_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String data;

  void apiPostList(){
    Network.GET(Network.API_GET1,  Network.paramsEmpty()).then((response) => {
      print(response),
      _showResponse(response),
    });
  }
  void apiPostList2(Post post){
    Network.GET(Network.API_GET2 + post.id.toString(),  Network.paramsEmpty()).then((response) => {
      print(response),
      _showResponse(response),
    });
  }
   _showResponse(String response){
    setState(() {
      data = response;
    });
   }

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
  //  var post  = new Post(id: 719);
    apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(data != null? data :"No data"),
      ),
    );
  }
}
