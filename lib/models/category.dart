import 'dart:convert';

class Category {
  String categoryName;
  String categoryType;

  Category({required this.categoryName, required this.categoryType});

  Map<String, dynamic> toMap() {
    return {
      'categoryName': categoryName,
      'categoryType': categoryType,
    };
  }

  factory Category.fromMap(Map<String, dynamic> mapa) {
    return Category(
      categoryName: mapa['categoryName'] ?? '',
      categoryType: mapa['categoryType'] ?? '',
    );
  }

  String toJson() => jsonEncode(toMap());

  factory Category.fromJson(String json) => Category.fromMap(jsonDecode(json));
}
