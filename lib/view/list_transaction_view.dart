import 'package:flutter/material.dart';
import '../models/list_transaction.dart';
import 'lista_transacoes_container.dart';

class ListTransactionView extends StatelessWidget {
  final bool isVisible;
  final List<ListTransaction> lista;
  final bool isLoading;

  const ListTransactionView(
      {Key? key, required this.isVisible, required this.lista, required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List<ListaTransacoesContainer>.generate(
        lista.length > 6 ? 6 : lista.length,
        (index) {
          lista.take(6);
          bool isFirst;
          bool isLast;

          if (lista.first == lista[index]) {
            isFirst = true;
          } else {
            isFirst = false;
          }
          if (lista[5] == lista[index]) {
            isLast = true;
          } else {
            isLast = false;
          }

          return ListaTransacoesContainer(
              isLoading: isLoading,
              isLast: isLast,
              isFirst: isFirst,
              isVisible: isVisible,
              valorTransacao: lista[index].value,
              tituloTransacao: lista[index].title,
              dataTransacao: lista[index].date,
              isReceita: lista[index].category.categoryType ?? '');
        },
      ),
    );
  }
}
