import 'package:flutter/material.dart';
import '../controller/list_transaction_controller.dart';
import '../global/convert.dart';

class ReceitaDespesaContainer extends StatelessWidget {
  final bool isReceita;
  final bool isVisible;

  const ReceitaDespesaContainer(
      {Key? key, required this.isReceita, required this.isVisible})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    double saldo = 0;
    var controller =
        ListTransactionController().saldoReceitaDespesa(isReceita: isReceita);

    return FutureBuilder(
        future: controller,
        builder: (_, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            saldo = snapshot.data as double;
          }
          return Container(
            height: mediaQuery.height * 0.08412,
            decoration: BoxDecoration(
              color: const Color(0XFF383838),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 12.0,
                left: 8,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        isReceita ? 'Receita' : 'Despesa',
                        style:
                            const TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                    Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                      Text(
                        'R\$  ',
                        style: TextStyle(
                            fontSize: 16,
                            color: isReceita
                                ? const Color(0XFFDCFFA4)
                                : const Color(0XFFFFCAA4)),
                      ),
                      Text(
                        isVisible ? Convert.currency(valor: saldo) : '*******',
                        style: TextStyle(
                          fontSize: 18,
                          color: isReceita
                              ? const Color(0XFFDCFFA4)
                              : const Color(0XFFFFCAA4),
                        ),
                      ),
                      const Spacer(),
                      Align(
                        alignment: const Alignment(2, 1),
                        heightFactor: 0.5,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Image.asset(
                              isAntiAlias: true,
                              width: 30,
                              height: 30,
                              alignment: Alignment.topCenter,
                              fit: BoxFit.fill,
                              isReceita
                                  ? 'assets/images/Receita.png'
                                  : 'assets/images/Despesa.png'),
                        ),
                      ),
                    ]),
                  ]),
            ),
          );
        });
  }
}
