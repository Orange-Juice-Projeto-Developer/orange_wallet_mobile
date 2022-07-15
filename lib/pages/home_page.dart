import 'package:flutter/material.dart';
import 'package:orange_wallet_mobile/models/cadastrar_transacao_button.dart';
import 'package:orange_wallet_mobile/models/notification_button.dart';
import 'package:orange_wallet_mobile/models/receita_despesa_container.dart';
import 'package:orange_wallet_mobile/models/saldo_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: mediaQuery.height / 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Olá,',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Text(
                        'Theodoro',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      NotificationButton(),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.black,
                          backgroundImage: NetworkImage(
                              'https://www.araujopolicastro.com.br/wp-content/uploads/2014/08/theodoro-arajo-v21.png'),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  height: mediaQuery.height / 2.5,
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
                      const SaldoContainer(),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: CadastrarTransacaoButton(),
                        ),
                      ),
                      Row(
                        children: const [
                          Expanded(
                              child: ReceitaDespesaContainer(isReceita: true)),
                          Expanded(
                              child: ReceitaDespesaContainer(isReceita: false)),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
