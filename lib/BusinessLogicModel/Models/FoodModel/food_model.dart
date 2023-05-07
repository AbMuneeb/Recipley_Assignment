class FoodModel {
  List<FoodData>? data;

  FoodModel({this.data});

  FoodModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <FoodData>[];
      json['data'].forEach((v) {
        data!.add(new FoodData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FoodData {
  int? categoryId;
  String? image;
  String? chef;
  int? cuisineId;
  int? id;
  String? name;

  FoodData({this.categoryId, this.chef, this.cuisineId, this.id, this.name});

  FoodData.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    chef = json['chef'];
    image = json['image'];
    cuisineId = json['cuisineId'];
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryId'] = this.categoryId;
    data['chef'] = this.chef;
    data['image'] = image;
    data['cuisineId'] = this.cuisineId;
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}