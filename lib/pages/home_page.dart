import 'package:flutter/material.dart';
import 'package:orange_wallet_mobile/controller/list_transaction_controller.dart';
import 'package:orange_wallet_mobile/view/cadastrar_transacao_button.dart';
import 'package:orange_wallet_mobile/view/list_transaction_view.dart';
import 'package:orange_wallet_mobile/view/loading/shimmer.dart';
import 'package:orange_wallet_mobile/view/notification_button.dart';
import 'package:orange_wallet_mobile/view/receita_despesa_container.dart';
import 'package:orange_wallet_mobile/view/saldo_container.dart';
import '../models/list_transaction.dart';

const _shimmerGradient = LinearGradient(
  colors: [
    Colors.grey,
    Color.fromARGB(249, 114, 114, 120),
    Color.fromARGB(240, 80, 80, 82),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = false;
  bool _isVisible = true;

  var controller = ListTransactionController();
  var saldoGeral = 0.0;
  var receitaSaldo = 0.0;
  var despesaSaldo = 0.0;
  var listaRecentes = <ListTransaction>[];

  Future<void> recuperaDados() async {
    setState(() {
      _isLoading = true;
    });
    saldoGeral = await controller.getSaldo();
    receitaSaldo = await controller.saldoReceitaDespesa(isReceita: true);
    despesaSaldo = await controller.saldoReceitaDespesa(isReceita: false);
    listaRecentes = await controller.findByRecent();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    recuperaDados();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      body: RefreshIndicator(
        backgroundColor: Colors.grey.shade800,
        color: const Color(0XFFFF8A00),
        onRefresh: () {
          return Future.delayed(const Duration(seconds: 1), () {
            setState(() {
              _isLoading = true;
              recuperaDados();
            });
          });
        },
        child: SingleChildScrollView(
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
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                              Text(
                                'Theodoro',
                                style: TextStyle(
                                    fontSize: 24, color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: (() {
                                  setState(() {
                                    _isVisible = !_isVisible;
                                  });
                                }),
                                icon: Icon(_isVisible
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
                          SaldoContainer(
                              isLoading: _isLoading,
                              isVisible: _isVisible,
                              saldo: saldoGeral),
                          SizedBox(
                            height: mediaQuery.height * 0.02843,
                            width: 0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: ReceitaDespesaContainer(
                                isLoading: _isLoading,
                                isVisible: _isVisible,
                                saldo: receitaSaldo,
                                isReceita: true,
                              )),
                              SizedBox(
                                height: 0,
                                width: mediaQuery.width * 0.008,
                              ),
                              Expanded(
                                child: ReceitaDespesaContainer(
                                  isLoading: _isLoading,
                                  isVisible: _isVisible,
                                  saldo: despesaSaldo,
                                  isReceita: false,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: mediaQuery.height * 0.02843,
                            width: 0,
                          ),
                          CadastrarTransacaoButton(callback: recuperaDados()),
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
                      onPressed: () {
                        Navigator.of(context).pushNamed('/listTransaction');
                      },
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
                child: ListTransactionView(
                    isLoading: false,
                    isVisible: _isVisible,
                    lista: listaRecentes),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
