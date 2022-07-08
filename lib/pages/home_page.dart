import 'package:flutter/material.dart';
import 'package:orange_wallet_mobile/models/notification_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                  height: mediaQuery.height / 3.85,
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
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                  child: Container(
                    height: 99,
                    decoration: BoxDecoration(
                      color: const Color(0XFF383838),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 16.0,
                        left: 8,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              'Seu saldo atual é de',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ),
                          Row(
                            children: const [
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'R\$  ',
                                      style: TextStyle(
                                          fontSize: 24, color: Colors.white),
                                    ),
                                    TextSpan(
                                      text: '8050,00',
                                      style: TextStyle(
                                          fontSize: 32, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Icon(
                                Icons.visibility_off_outlined,
                                color: Colors.white,
                              ),
                              // Aguardando ver sobre vetores ou baixar o baratinho de dinheiro
                              // Spacer()

                              //COLOCAR AQUI O CODIGO DO DINHEIROS
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    heightFactor: 3.8,
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(mediaQuery.width, 48),
                        primary: const Color(0XFFFF8A00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: Colors.black,
                      ),
                      label: const Text(
                        'Cadastrar Transação',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
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
