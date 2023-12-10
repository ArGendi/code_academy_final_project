class Resturant{
  int? id;
  String? name;
  String? pic;
  String? deliveryTime;

  Resturant({this.deliveryTime, this.id, this.name, this.pic});
  Resturant.fromJson(Map json){
    id = json['id'];
    name = json['name'];
    pic = json['pic'].replaceAll('public', 'https://project1.amit-learning.com');
    deliveryTime = json['delivery_time'];
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'name': name,
      'pic': pic,
      'delivery_time': deliveryTime,
    };
  }
}