

import 'package:rest_api/model/post_model.dart';

class Update{

  String status;
  String message;
  Post update_data;

  Update.fromJson(Map<String, dynamic> json)
      :  status = json["status"],
        message = json["message"],
        update_data =Post.fromJson(json["create_data"]);

  Map<String, dynamic> toJson() => {
    "status" : status,
    "message" : message,
    "create_data" : update_data.toJson(),

  };
}