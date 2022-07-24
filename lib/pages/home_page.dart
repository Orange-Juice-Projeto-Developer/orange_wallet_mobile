import 'package:flutter/material.dart';
import 'package:orange_wallet_mobile/controller/list_transaction_controller.dart';
import 'package:orange_wallet_mobile/models/list_transaction.dart';
import 'package:orange_wallet_mobile/view/cadastrar_transacao_button.dart';
import 'package:orange_wallet_mobile/view/lista_transacoes_container.dart';
import 'package:orange_wallet_mobile/view/notification_button.dart';
import 'package:orange_wallet_mobile/view/receita_despesa_container.dart';
import 'package:orange_wallet_mobile/view/saldo_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isVisible = false;
  List<ListTransaction> list = [];
  var listController = ListTransactionController().findAll();

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      list = await listController;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: mediaQuery.height * .5,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(40),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black,
                    Color(0XFF323131),
                  ],
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: mediaQuery.height * 0.07,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Olá,',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            Text(
                              'Theodoro',
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: (() {
                                isVisible = !isVisible;
                                setState(() {});
                              }),
                              icon: Icon(isVisible
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined),
                              color: Colors.white,
                            ),
                            const NotificationButton(),
                            const SizedBox(
                              width: 16,
                              height: 0,
                            ),
                            const CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.black,
                              backgroundImage: NetworkImage(
                                  'https://www.araujopolicastro.com.br/wp-content/uploads/2014/08/theodoro-arajo-v21.png'),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.02843,
                    width: 0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      children: [
                        SaldoContainer(isVisible: isVisible),
                        SizedBox(
                          height: mediaQuery.height * 0.02843,
                          width: 0,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: ReceitaDespesaContainer(
                              isReceita: true,
                              isVisible: isVisible,
                            )),
                            SizedBox(
                              height: 0,
                              width: mediaQuery.width * 0.008,
                            ),
                            Expanded(
                                child: ReceitaDespesaContainer(
                              isReceita: false,
                              isVisible: isVisible,
                            )),
                          ],
                        ),
                        SizedBox(
                          height: mediaQuery.height * 0.02843,
                          width: 0,
                        ),
                        const CadastrarTransacaoButton(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: mediaQuery.height * 0.02843,
              width: 0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Transações recentes',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      )),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Ver todas',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: FutureBuilder(
                future: listController,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Column(
                      children: List<ListaTransacoesContainer>.generate(
                        list.length,
                        (index) {
                          return ListaTransacoesContainer(
                              isVisible: isVisible,
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
                      style: TextStyle(color: Colors.white),
                    );
                  } else {
                    return const CircularProgressIndicator(
                      color: Color(0XFFFF8A00),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
