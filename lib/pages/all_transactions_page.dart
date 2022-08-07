import 'package:flutter/material.dart';
import 'package:orange_wallet_mobile/controller/list_transaction_controller.dart';
import 'package:orange_wallet_mobile/view/lista_transacoes_container.dart';

import '../models/list_transaction.dart';

class AllTransactionsPage extends StatefulWidget {
  const AllTransactionsPage({Key? key}) : super(key: key);

  @override
  State<AllTransactionsPage> createState() => _AllTransactionsPageState();
}

class _AllTransactionsPageState extends State<AllTransactionsPage> {
  var controller = ListTransactionController().findByRecent();

  List<ListTransaction> list = [];

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      list = await controller;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todas as transações'),
      ),
      body: FutureBuilder(
        future: controller,
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            list = snapshot.data as List<ListTransaction>;
            return ListView.builder(
                itemCount: list.length,
                itemBuilder: (_, index) {
                  return ListaTransacoesContainer(isLoading: false,
                      isVisible: true,
                      valorTransacao: list[index].value,
                      tituloTransacao: list[index].title,
                      dataTransacao: list[index].date,
                      isReceita: list[index].category.categoryType ?? '',
                      isFirst: list.first == list[index] ? true : false,
                      isLast: list.last == list[index] ? true : false);
                });
          } else if (snapshot.hasError) {
            return const Text(
              'Tivemos um problema com a sua requisição.',
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0XFFFF8A00),
              ),
            );
          }
        },
      ),
    );
  }
}
