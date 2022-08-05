import 'dart:convert';
import 'category.dart';

class ListTransaction implements Comparable<ListTransaction> {
  // {
  //   "id": "e4a09106-b806-41c0-b4f4-867f0f4cabd1",
  //   "title": "Yakisoba",
  //   "value": 39,
  //   "Category": {
  //     "categoryName": "Alimentação",
  //     "categoryType": "Despesa"
  //   },
  //   "date": "2022-07-24T10:07:18.145Z"
  // },

  String? id;
  String title;
  double value;
  Category category;
  String date;

  ListTransaction(
      {this.id,
      required this.title,
      required this.value,
      required this.category,
      required this.date});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'value': value,
      'Category': category.toMap(),
      'date': date,
    };
  }

  factory ListTransaction.fromMap(Map<String, dynamic> map) {
    return ListTransaction(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      value: map['value']?.toDouble() ?? 0.0,
      category: Category.fromMap(map['Category']),
      date: map['date'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ListTransaction.fromJson(String source) =>
      ListTransaction.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ListTransaction(title: $title, value: $value, category: $category, date: $date)';
  }

  @override
  int compareTo(ListTransaction other) {
    return date.compareTo(other.date);
  }
}
