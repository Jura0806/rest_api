

import 'package:rest_api/model/post_model.dart';

class Delete{

  String status;
  String message;
  Post delete_data;

  Delete.fromJson(Map<String, dynamic> json)
      :  status = json["status"],
        message = json["message"],
        delete_data =Post.fromJson(json["create_data"]);

  Map<String, dynamic> toJson() => {
    "status" : status,
    "message" : message,
    "create_data" : delete_data.toJson(),
  };
}