class CategoryResponse {
  late List<Categories> categories;
  late bool error;
  late String message;

  CategoryResponse(
      {required this.categories, required this.error, required this.message});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    if (json["categories"] is List) {
      categories = (json["categories"] == null
          ? null
          : (json["categories"] as List)
              .map((e) => Categories.fromJson(e))
              .toList())!;
    }
    if (json["error"] is bool) {
      error = json["error"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["categories"] = categories.map((e) => e.toJson()).toList();
    _data["error"] = error;
    _data["message"] = message;
    return _data;
  }
}

class Categories {
  late int categoryId;
  late String name;

  Categories({required this.categoryId, required this.name});

  Categories.fromJson(Map<String, dynamic> json) {
    if (json["category_id"] is int) {
      categoryId = json["category_id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["category_id"] = categoryId;
    _data["name"] = name;
    return _data;
  }
}
