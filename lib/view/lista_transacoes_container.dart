import 'package:flutter/material.dart';
import 'package:orange_wallet_mobile/global/convert.dart';
import 'package:orange_wallet_mobile/view/loading/shimmer_loading.dart';

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
      if (isLoading) {
        return ShimmerLoading(isLoading: isLoading,
          child: Row(
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 8.0, left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 129,
                      height: 19,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    const SizedBox(
                      height: 9,
                      width: 0,
                    ),
                    Container(
                      width: 47,
                      height: 14,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 108,
                  height: 19,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              const SizedBox(
                width: 8,
                height: 0,
              )
            ],
          ),
        );
      } else {
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
