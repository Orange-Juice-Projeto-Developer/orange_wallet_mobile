import 'dart:convert';

class CreateTransaction {
// {
//   "id": "string",
//   "title": "string",
//   "value": 0,
//   "categoryId": 0,
//   "date": "2022-08-06T20:05:49.429Z"
// }
  String title;
  double value;
  int categoryId;
  String date;

  CreateTransaction(
      {required this.title,
      required this.value,
      required this.categoryId,
      required this.date});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'value': value,
      'categoryId': categoryId,
      'date': date,
    };
  }

  factory CreateTransaction.fromMap(Map<String, dynamic> map) {
    return CreateTransaction(
      title: map['title'] ?? '',
      value: map['value']?.toDouble() ?? 0.0,
      categoryId: map['categoryId']?.toDouble() ?? 0.0,
      date: map['date'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateTransaction.fromJson(String source) => CreateTransaction.fromMap(json.decode(source));
}
