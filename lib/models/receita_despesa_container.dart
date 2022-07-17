import 'package:flutter/material.dart';

class ReceitaDespesaContainer extends StatelessWidget {
  final bool isReceita;
  final bool isVisible;
  const ReceitaDespesaContainer(
      {Key? key, required this.isReceita, required this.isVisible})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    const double saldoReceita = 12000.06;
    const double saldoDespesa = 6000.12;
    return Container(
      // padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(
              isReceita ? 'Receita' : 'Despesa',
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
          Row(
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'R\$  ',
                      style: TextStyle(
                          fontSize: 16,
                          color: isReceita
                              ? const Color(0XFFDCFFA4)
                              : const Color(0XFFFFCAA4)),
                    ),
                    TextSpan(
                      text: _receitaOuDespesa(
                        isReceita,
                        isVisible,
                        saldoReceita,
                        saldoDespesa,
                      ).toString().replaceAll('.', ','),
                      style: TextStyle(
                          fontSize: 18,
                          color: isReceita
                              ? const Color(0XFFDCFFA4)
                              : const Color(0XFFFFCAA4)),
                    ),
                  ],
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
            ],
          )
        ]),
      ),
    );
  }

  String _receitaOuDespesa(
      bool isReceita, bool isVisible, double receita, double despesa) {
    String retorno = '';
    if (isVisible == true) {
      if (isReceita == true) {
        final receitaString = receita.toString();
        retorno = receitaString;
      } else if (isReceita == false) {
        final despesaString = despesa.toString();
        retorno = despesaString;
      }
    } else {
      retorno = '*******';
    }
    return retorno;
  }
}
