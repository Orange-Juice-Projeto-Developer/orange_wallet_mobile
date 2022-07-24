import 'dart:convert';

class ListTransaction {
  // {
  //   "id": "6abf85b6-e909-4b0b-8e84-8d3a7e4fab08",
  //   "title": "Salário",
  //   "value": 1300,
  //   "type": "Receita",
  //   "category": "Salário",
  //   "date": "2022-07-09T00:17:54.575Z"
  // },

  String id;
  String title;
  double value;
  String type;
  String category;
  String date;

  ListTransaction(
      {required this.id,
      required this.title,
      required this.value,
      required this.type,
      required this.category,
      required this.date});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'value': value,
      'type': type,
      'category': category,
      'date': date,
    };
  }

  factory ListTransaction.fromMap(Map<String, dynamic> map) {
    return ListTransaction(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      value: map['value']?.toDouble() ?? 0.0,
      type: map['type'] ?? '',
      category: map['category'] ?? '',
      date: map['date'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ListTransaction.fromJson(String source) =>
      ListTransaction.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ListTransaction(id: $id, title: $title, value: $value, type: $type, category: $category, date: $date)';
  }
}
