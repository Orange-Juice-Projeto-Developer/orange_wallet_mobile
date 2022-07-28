import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:orange_wallet_mobile/models/list_transaction.dart';

class ListTransactionRepository {
  Future<List<ListTransaction>> findAll() async {
    final listTransactionResponse = await http.get(Uri.parse(
        'https://orange-wallet-backend.herokuapp.com/listTransaction'));

    final listTransactionList = jsonDecode(listTransactionResponse.body);

    return listTransactionList
        .map<ListTransaction>((transacao) => ListTransaction.fromMap(transacao))
        .toList();
  }

  Future<void> insert(ListTransaction transacao) async {
    var response = await http.post(
        Uri.parse(
            'https://orange-wallet-backend.herokuapp.com/createTransaction'),
        body: transacao.toJson(),
        headers: {
          'accept': 'application/json',
          'content-type': 'application/json',
        });
    print(transacao.toJson());

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('Success');
    } else {
      print(response.statusCode);
      throw Exception('Erro ao cadastrar transação');
    }
  }
}
