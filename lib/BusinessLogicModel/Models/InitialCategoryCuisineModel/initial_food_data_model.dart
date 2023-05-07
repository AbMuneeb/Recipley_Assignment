class FoodInitialDataModel {
  InitialData? data;

  FoodInitialDataModel({this.data});

  FoodInitialDataModel.fromJson(Map<String, dynamic> json) {
    data = json['Data'] != null ? new InitialData.fromJson(json['Data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    return data;
  }
}

class InitialData {
  List<DataModel>? cuisine;
  List<DataModel>? category;

  InitialData({this.cuisine, this.category});

  InitialData.fromJson(Map<String, dynamic> json) {
    if (json['Cuisine'] != null) {
      cuisine = <DataModel>[];
      json['Cuisine'].forEach((v) {
        cuisine!.add(new DataModel.fromJson(v));
      });
    }
    if (json['Category'] != null) {
      category = <DataModel>[];
      json['Category'].forEach((v) {
        category!.add(new DataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cuisine != null) {
      data['Cuisine'] = this.cuisine!.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['Category'] = this.category!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataModel {
  int? id;
  String? name;

  DataModel({this.id, this.name});

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}