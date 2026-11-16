class Product {
  final int id;
  final String name;
  final String category;
  final double price;
  final String icon;
  final String description;
  final String imageAsset;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.icon,
    required this.description,
    required this.imageAsset,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      category: json['category'] as String,
      price: (json['price'] as num).toDouble(),
      icon: json['icon'] as String,
      description: json['description'] as String,
      imageAsset: json['imageAsset'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'price': price,
      'icon': icon,
      'description': description,
      'imageAsset': imageAsset,
    };
  }
}