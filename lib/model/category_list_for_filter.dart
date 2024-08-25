class CategoryListForFilterModel {
  String? status;
  String? message;
  List<MainCategory>? mainCategory;

  CategoryListForFilterModel({this.status, this.message, this.mainCategory});

  CategoryListForFilterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['main_category'] != null) {
      mainCategory = <MainCategory>[];
      json['main_category'].forEach((v) {
        mainCategory!.add(MainCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (mainCategory != null) {
      data['main_category'] =
          mainCategory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MainCategory {
  int? categoryId;
  String? categoryName;

  MainCategory({this.categoryId, this.categoryName});

  MainCategory.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    return data;
  }
}
