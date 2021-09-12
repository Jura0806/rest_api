
class Post{

  String name;
  int salary;
  int age;
  int id ;

  Post({this.id, this.name,  this.salary, this.age});

  Post.fromJson(Map<String, dynamic> json)
      :id = json["id"],
        name = json["name"],
      salary = json["salary"],
       age = json["age"];

   Map<String, dynamic> toJson() =>{
     "id" : id,
     "name" : name,
     "salary": salary,
     "age" : age,
   };
}