import 'dart:convert';

class Category {
  // {
  //   "id": 3,
  //   "categoryName": "13º salário",
  //   "categoryType": "Receita"
  // },
  
  int id;
  String? categoryName;
  String? categoryType;

  Category({
    required this.id,
    required this.categoryName,
    required this.categoryType,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'categoryName': categoryName,
      'categoryType': categoryType,
    };
  }

  factory Category.fromMap(Map<String, dynamic> mapa) {
    return Category(
      id: mapa['id'] ?? 0,
      categoryName: mapa['categoryName'] ?? '',
      categoryType: mapa['categoryType'] ?? '',
    );
  }

  String toJson() => jsonEncode(toMap());

  factory Category.fromJson(String json) => Category.fromMap(jsonDecode(json));
}
