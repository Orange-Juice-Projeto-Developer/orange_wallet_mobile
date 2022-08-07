import 'package:flutter/material.dart';
import 'package:orange_wallet_mobile/controller/list_transaction_controller.dart';
import '../global/convert.dart';

class SaldoContainer extends StatefulWidget {
  const SaldoContainer({Key? key, required this.isVisible}) : super(key: key);
  final bool isVisible;

  @override
  State<SaldoContainer> createState() => _SaldoContainerState();
}

class _SaldoContainerState extends State<SaldoContainer> {
  double saldoController = 0.0;
  double saldo = 0.0;

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      saldoController = await ListTransactionController().getSaldo();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    setState(() {
      saldo = saldoController;
    });

    return Container(
      height: mediaQuery.height * 0.11729,
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
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'R\$  ',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                Visibility(
                  visible: widget.isVisible,
                  replacement: const Text('*******',
                  style: TextStyle(fontSize: 32, color: Colors.white)),
                  child: Text(
                    Convert.currency(valor: saldo),
                    style: const TextStyle(fontSize: 32, color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Image.asset(
                      isAntiAlias: true,
                      width: 44,
                      height: 44,
                      alignment: Alignment.topCenter,
                      fit: BoxFit.contain,
                      'assets/images/Dinheiro-Transparente.png'),
                ),
                const SizedBox(
                  width: 44,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// FutureBuilder(
//             future: saldoController,
//             builder: (_, snapshot) {
//               if (snapshot.hasData &&
//                   snapshot.connectionState == ConnectionState.done) {
//                 saldo = snapshot.data as double;
//                 return Text(
//                   Convert.currency(valor: saldo),
//                   style: const TextStyle(fontSize: 32, color: Colors.white),
//                 );
//               } else if (snapshot.hasError) {
//                 return const Text('Erro');
//               } else {
//                 return const Text('Loading...',
//                     style: TextStyle(fontSize: 32, color: Colors.white));
//               }
//             });
