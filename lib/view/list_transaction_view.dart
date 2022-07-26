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
  var listController = ListTransactionController().findAll();
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
                return ListaTransacoesContainer(
                    isVisible: widget.isVisible,
                    valorTransacao: list[index].value,
                    tituloTransacao: list[index].title,
                    dataTransacao: list[index].date,
                    isReceita: list[index].type);
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
