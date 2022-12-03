class Product {
  int productId;
  String name;
  String image;
  double price;
  String desc;
  int quantity;
  String height;
  String width;
  String humidity;
  int categoryId;

  Product(
      {required this.productId,
      required this.name,
      required this.image,
      required this.price,
      required this.desc,
      required this.quantity,
      required this.height,
      required this.width,
      required this.humidity,
      required this.categoryId});
}
