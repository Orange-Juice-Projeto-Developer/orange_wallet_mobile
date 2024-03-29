import 'package:orange_wallet_mobile/models/category.dart';
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
    return listTransaction.toList();
  }

  Future<List<ListTransaction>> findByRecent() async {
    final listTransaction = await _listTransactionRepository.findAll();

    listTransaction.sort((item1, item2) {
      //   "date": "2022-07-09T00:17:54.575Z"

      final transacaoDados1 = item1.date.substring(0, 10).split('-');
      final transacaoDados2 = item2.date.substring(0, 10).split('-');
      final transacaoDados1T = item1.date.substring(11, 19).split(':');
      final transacaoDados2T = item2.date.substring(11, 19).split(':');

      final ano1 = int.parse(transacaoDados1[0]);
      final ano2 = int.parse(transacaoDados2[0]);

      final mes1 = int.parse(transacaoDados1[1]);
      final mes2 = int.parse(transacaoDados2[1]);

      final dia1 = int.parse(transacaoDados1[2]);
      final dia2 = int.parse(transacaoDados2[2]);

      final hora1 = int.parse(transacaoDados1T[0]);
      final hora2 = int.parse(transacaoDados2T[0]);

      final minuto1 = int.parse(transacaoDados1T[1]);
      final minuto2 = int.parse(transacaoDados2T[1]);

      final segundo1 = int.parse(transacaoDados1T[2]);
      final segundo2 = int.parse(transacaoDados2T[2]);

      if (ano1 < ano2) {
        return 1;
      } else if (ano1 == ano2) {
        if (mes1 < mes2) {
          return 1;
        } else if (mes1 == mes2) {
          if (dia1 < dia2) {
            return 1;
          } else if (dia1 == dia2) {
            if (hora1 < hora2) {
              return 1;
            } else if (hora1 == hora2) {
              if (minuto1 < minuto2) {
                return 1;
              } else if (minuto1 == minuto2) {
                if (segundo1 < segundo2) {
                  return 1;
                } else if (segundo1 == segundo2) {
                  return 0;
                } else {
                  return -1;
                }
              } else {
                return -1;
              }
            } else {
              return -1;
            }
          } else {
            return -1;
          }
        } else {
          return -1;
        }
      } else {
        return -1;
      }
    });
    return listTransaction.toList();
  }

  Future<List<ListTransaction>> findByCategoryType(String type) async {
    final listTransaction = await _listTransactionRepository.findAll();
    List<ListTransaction> listCategoryType = [];

    for (var objeto in listTransaction) {
      if (objeto.category.categoryType == type) {
        listCategoryType.add(objeto);
      }
    }
    return listCategoryType;
  }

  Future<double> getSaldo() async {
    final listTransaction = await _listTransactionRepository.findAll();
    double receitaSaldo = 0;
    double despesaSaldo = 0;

    for (var objeto in listTransaction) {
      if (objeto.category.categoryType == 'Receita') {
        receitaSaldo += objeto.value;
      } else {
        despesaSaldo += objeto.value;
      }
    }
    return (receitaSaldo - despesaSaldo).toDouble();
  }

  Future<double> saldoReceitaDespesa({required bool isReceita}) async {
    double saldo = 0.0;

    final lista = await findByCategoryType(isReceita ? 'Receita' : 'Despesa');
    for (var objeto in lista) {
      saldo += objeto.value;
    }
    return saldo;
  }
}
