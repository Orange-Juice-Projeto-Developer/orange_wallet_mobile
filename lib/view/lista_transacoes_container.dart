import 'package:flutter/material.dart';
import 'package:orange_wallet_mobile/global/convert.dart';

class ListaTransacoesContainer extends StatelessWidget {
  final String dataTransacao;
  final String tituloTransacao;
  final String isReceita;
  final bool isVisible;
  final double valorTransacao;
  final bool isFirst;
  final bool isLast;
  final bool isLoading;

  const ListaTransacoesContainer(
      {Key? key,
      required this.isVisible,
      required this.valorTransacao,
      required this.tituloTransacao,
      required this.dataTransacao,
      required this.isReceita,
      required this.isFirst,
      required this.isLast,
      required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildText() {
      return Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Image.asset(
              isAntiAlias: true,
              width: 30,
              height: 30,
              alignment: Alignment.topCenter,
              fit: BoxFit.contain,
              isReceita == 'Receita'
                  ? 'assets/images/Salario.png'
                  : 'assets/images/Alimentacao.png',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 8.0, left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tituloTransacao,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 9,
                  width: 0,
                ),
                Text(
                  Convert.date(date: dataTransacao),
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Text(
            isReceita == 'Receita' ? '+ R\$ ' : '- R\$ ',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: isReceita == 'Receita'
                    ? const Color(0XFFDCFFA4)
                    : const Color(0XFFFFCAA4)),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              isVisible ? Convert.currency(valor: valorTransacao) : '*******',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: isReceita == 'Receita'
                      ? const Color(0XFFDCFFA4)
                      : const Color(0XFFFFCAA4)),
            ),
          ),
          const SizedBox(
            width: 8,
            height: 0,
          )
        ],
      );
    }

    final mediaQuery = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      child: Container(
        height: mediaQuery.height * 0.09004,
        decoration: BoxDecoration(
          color: const Color(0XFF383838),
          borderRadius: isFirst
              ? const BorderRadius.vertical(top: Radius.circular(15))
              : isLast
                  ? const BorderRadius.vertical(bottom: Radius.circular(15))
                  : null,
        ),
        child: _buildText(),
      ),
    );
  }
}
