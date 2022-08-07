import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:orange_wallet_mobile/models/category.dart';
import 'package:orange_wallet_mobile/models/list_transaction.dart';

class ListTransactionRepository {
  Future<List<ListTransaction>> findAll() async {
    try {
      final listTransactionResponse = await http.get(Uri.parse(
          'https://orange-wallet-backend.herokuapp.com/listTransaction'));

      final listTransactionList = jsonDecode(listTransactionResponse.body);

      return listTransactionList
          .map<ListTransaction>(
              (transacao) => ListTransaction.fromMap(transacao))
          .toList();
    } on Exception catch (e) {
      print('erro $e');
      return <ListTransaction>[];
    }
  }
}
