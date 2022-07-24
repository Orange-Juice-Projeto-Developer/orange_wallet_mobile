import 'package:orange_wallet_mobile/repositories/list_transaction_repository.dart';

import '../models/list_transaction.dart';

//Classe que intermedeia a comunicação entre o front-end e o repository
class ListTransactionController {
  // Chama o repository para comunicar com o back-end
  final _listTransactionRepository = ListTransactionRepository();

  // Função que recupera informações do repository e inverte a ordem
  // da lista para apresentar do mais novo para o mais antigo, considerando
  // que deve ser mostrado na HomePage() uma lista de transações da mais
  // recente para a mais antiga.
  
  Future<List<ListTransaction>> findAll() async {
    final listTransaction = await _listTransactionRepository.findAll();
    return listTransaction.reversed.toList();
  }
}
