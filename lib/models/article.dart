class Article {
  final int id;
  final String title;
  final String description;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;

  Article(
      this.id,
      this.title,
      this.description,
      this.price,
      this.discountPercentage,
      this.rating,
      this.stock,
      this.brand,
      this.category,
      this.thumbnail
  );

  Article.fromJsonMap(Map<String, dynamic> map):
      id = map["id"],
      title = map["title"],
      description = map["description"],
      price = map["price"].toDouble(),
      discountPercentage = map["discountPercentage"].toDouble(),
      rating = map["rating"].toDouble(),
      stock = map["stock"],
      brand = map["brand"],
      category = map["category"],
      thumbnail = map["thumbnail"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    data['discountPercentage'] = discountPercentage;
    data['rating'] = rating;
    data['stock'] = stock;
    data['brand'] = brand;
    data['category'] = category;
    data['thumbnail'] = thumbnail;
    return data;
  }
}

// final articles = List<Article>.generate(
//   20,
//       (i) => Article(
//         i,
//     'Article $i',
//     'A description of what needs to be done for Article $i',
//   ),
// );