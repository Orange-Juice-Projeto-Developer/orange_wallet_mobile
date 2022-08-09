import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:orange_wallet_mobile/models/create_transaction.dart';
import '../models/category.dart';

class ListCategoryRepository {
  Future<List<Category>> findAllCategories() async {
    try {
      final response = await http.get(Uri.parse(
          'https://orange-wallet-backend.herokuapp.com/listCategories'));

      final listCategories = jsonDecode(response.body);

      return listCategories
          .map<Category>((category) => Category.fromMap(category))
          .toList();
    } on Exception catch (e) {
      print('erro $e');
      return <Category>[];
    }
  }

   Future<String> insert(CreateTransaction transacao) async {
    try {
      var response = await http.post(
          Uri.parse(
              'https://orange-wallet-backend.herokuapp.com/createTransaction'),
          body: transacao.toJson(),
          headers: {
            'accept': 'application/json',
            'content-type': 'application/json',
          });
      print(transacao.toJson());
      return response.statusCode.toString();
    } on Exception catch (e) {
      return 'Erro encontrado: $e';
    }
  }
}
