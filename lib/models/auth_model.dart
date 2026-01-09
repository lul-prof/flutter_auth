class Auth{
  String id;
  String username;
  String email;
  String password;
  DateTime createdAt;


  Auth({
    required this.id,
    required this.email,
    required this.username,
    required  this.password,
    DateTime? createdAt,
    }) : createdAt=createdAt ?? DateTime.now();

    //Convert to map for storage

    Map<String,dynamic>toJson(){
      return{
        'id':id,
        'username':username,
        'email':email,
        'password':password,
        'createdAt':createdAt.toIso8601String(),
      };
    }

    //Create a Todo Json for UI
    factory Auth.fromJson(Map<String,dynamic>map){
      return Auth(
        id: map['id'],
        email:map['email'] ,
        username:map['username'] ,
        password:map['password'] ,
        createdAt:DateTime.parse(map['createdAt']),
      );
    }

}