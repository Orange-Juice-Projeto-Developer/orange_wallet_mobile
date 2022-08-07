import 'package:orange_wallet_mobile/models/create_transaction.dart';
import 'package:orange_wallet_mobile/repositories/list_category_repository.dart';

import '../models/category.dart';

class ListCategoryController {
  final _repository = ListCategoryRepository();

  Future<List<Category>> findAllCategories() async =>
      await _repository.findAllCategories();

  Future<List<Category>> findByType(String type) async {
    var lista = await _repository.findAllCategories();
    var listaNova = <Category>[];

    for (var element in lista) {
      if (element.categoryType == type) {
        listaNova.add(element);
      }
    }
    return listaNova;
  }

  Future<bool> saveData(
      {required String title,
      required String value,
      required int category,
      required String date}) async {
    final transacao = CreateTransaction(
        title: title,
        value: double.parse(value),
        categoryId: category,
        date: date);

    try {
      String response = await _repository.insert(transacao);

      if (int.tryParse(response)! >= 200 && int.tryParse(response)! < 300) {
        return true;
      } else {
        return false;
      }
    } on Exception {
      return false;
    }
  }
}
