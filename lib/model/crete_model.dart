
import 'package:rest_api/model/post_model.dart';

class Create{

  String status;
  String message;
  Post create_data;

  Create.fromJson(Map<String, dynamic> json)
      :  status = json["status"],
        message = json["message"],
  create_data =Post.fromJson(json["create_data"]);

  Map<String, dynamic> toJson() => {
    "status" : status,
    "message" : message,
    "create_data" : create_data.toJson(),

  };


}