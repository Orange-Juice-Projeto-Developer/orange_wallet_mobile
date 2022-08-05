import 'package:flutter/material.dart';
import '../controller/list_transaction_controller.dart';
import '../models/list_transaction.dart';
import 'lista_transacoes_container.dart';

class ListTransactionView extends StatefulWidget {
  final bool isVisible;

  const ListTransactionView({Key? key, required this.isVisible})
      : super(key: key);

  @override
  State<ListTransactionView> createState() => _ListTransactionViewState();
}

class _ListTransactionViewState extends State<ListTransactionView> {
  var listController = ListTransactionController().findByRecent();
  List<ListTransaction> list = [];
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      list = await listController;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: listController,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          list = snapshot.data as List<ListTransaction>;
          return Column(
            children: List<ListaTransacoesContainer>.generate(
              list.length > 6 ? 6 : list.length,
              (index) {
                list.take(6);
                bool isFirst;
                bool isLast;

                if (list.first == list[index]) {
                  isFirst = true;
                } else {
                  isFirst = false;
                }
                if (list[5] == list[index]) {
                  isLast = true;
                } else {
                  isLast = false;
                }

                return ListaTransacoesContainer(
                    isLast: isLast,
                    isFirst: isFirst,
                    isVisible: widget.isVisible,
                    valorTransacao: list[index].value,
                    tituloTransacao: list[index].title,
                    dataTransacao: list[index].date,
                    isReceita: list[index].category.categoryType);
              },
            ),
          );
        } else if (snapshot.hasError) {
          return const Text(
            'Tivemos um problema com a sua requisição.',
          );
        } else {
          return const CircularProgressIndicator(
            color: Color(0XFFFF8A00),
          );
        }
      },
    );
  }
}
