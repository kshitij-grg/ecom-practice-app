class CartResponse {
  late List<Plants> plants;
  late bool error;
  late String message;

  CartResponse(
      {required this.plants, required this.error, required this.message});

  CartResponse.fromJson(Map<String, dynamic> json) {
    plants = (json["plants"] == null
        ? null
        : (json["plants"] as List).map((e) => Plants.fromJson(e)).toList())!;
    error = json["error"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["plants"] = plants.map((e) => e.toJson()).toList();
    _data["error"] = error;
    _data["message"] = message;
    return _data;
  }
}

class Plants {
  late int plantId;
  late String name;
  late String description;
  late int price;
  late String height;
  late String humidity;
  late String thickness;
  late String image;
  late int categoryId;
  late String cartQuantity;
  late int cartId;

  Plants(
      {required this.plantId,
      required this.name,
      required this.description,
      required this.price,
      required this.height,
      required this.humidity,
      required this.thickness,
      required this.image,
      required this.categoryId,
      required this.cartQuantity,
      required this.cartId});

  Plants.fromJson(Map<String, dynamic> json) {
    plantId = json["plant_id"];
    name = json["name"];
    description = json["description"];
    price = json["price"];
    height = json["height"];
    humidity = json["humidity"];
    thickness = json["thickness"];
    image = json["image"];
    categoryId = json["category_id"];
    cartQuantity = json["cart_quantity"];
    cartId = json["cart_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["plant_id"] = plantId;
    _data["name"] = name;
    _data["description"] = description;
    _data["price"] = price;
    _data["height"] = height;
    _data["humidity"] = humidity;
    _data["thickness"] = thickness;
    _data["image"] = image;
    _data["category_id"] = categoryId;
    _data["cart_quantity"] = cartQuantity;
    _data["cart_id"] = cartId;
    return _data;
  }
}
