class User{
  String? name;
  String? email;
  String? password;
  String? mobile;
  int? id;

  User({this.name, this.email, this.password, this.mobile, this.id});
  User.fromJson(Map json){
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    id = json['id'];
  }

  Map<String,dynamic> toJsonForRegister(){
    return {
      'name': name,
      'email': email,
      'password': password,
      'mobile': mobile,
    };
  }

   Map<String,dynamic> toJsonForLogin(){
    return {
      'email': email,
      'password': password,
    };
  }

}