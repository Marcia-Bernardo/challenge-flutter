class Product {
  final String tags;
  final String name;
  final String image;
  final int total;
  final double value;

  Product(
      {required this.tags,
      required this.name,
      required this.image,
      required this.total,
      required this.value});

  factory Product.fromJson(Map<String, dynamic> json) {
    var tags = json['tags'];
    var image = json['image']['src'];
    var total = json['variants'][0]['inventory_quantity'];
    var name = json['title'];
    var value = double.parse(json['variants'][0]['price']);

    return Product(
        tags: tags, name: name, image: image, total: total, value: value);
  }
}
