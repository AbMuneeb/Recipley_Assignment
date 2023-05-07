class SelectedFilterWrapper {
  List<WrapperDataModel>? cuisine;
  List<WrapperDataModel>? category;

  SelectedFilterWrapper({this.cuisine, this.category});

  SelectedFilterWrapper.fromJson(Map<String, dynamic> json) {
    if (json['Cuisine'] != null) {
      cuisine = <WrapperDataModel>[];
      json['Cuisine'].forEach((v) {
        cuisine!.add(new WrapperDataModel.fromJson(v));
      });
    }
    if (json['Category'] != null) {
      category = <WrapperDataModel>[];
      json['Category'].forEach((v) {
        category!.add(new WrapperDataModel.fromJson(v));
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

class WrapperDataModel {
  int? id;
  bool? selected;

  WrapperDataModel({this.id,this.selected = false,});

  WrapperDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    selected = json['selected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['selected'] = selected;
    return data;
  }
}