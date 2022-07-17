import 'package:flutter/material.dart';

class ListaTransacoesContainer extends StatelessWidget {
  final String dataTransacao;
  final String categoriaTransacao;
  final bool isReceita;
  final bool isVisible;
  final double valorTransacao;

  const ListaTransacoesContainer(
      {Key? key,
      required this.isVisible,
      required this.valorTransacao,
      required this.categoriaTransacao,
      required this.dataTransacao,
      required this.isReceita})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        height: mediaQuery.height * 0.09004,
        decoration: BoxDecoration(
          color: const Color(0XFF383838),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Image.asset(
                isAntiAlias: true,
                width: 30,
                height: 30,
                alignment: Alignment.topCenter,
                fit: BoxFit.contain,
                isReceita
                    ? 'assets/images/Salario.png'
                    : 'assets/images/Combustivel.png',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 8.0, left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    categoriaTransacao,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 9,
                    width: 0,
                  ),
                  Text(
                    dataTransacao,
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: isReceita ? '+ R\$ ' : '- R\$ ',
                    style: TextStyle(
                        fontSize: 14,
                        color: isReceita
                            ? const Color(0XFFDCFFA4)
                            : const Color(0XFFFFCAA4)),
                  ),
                  TextSpan(
                    text: isVisible
                        ? valorTransacao.toStringAsFixed(2).replaceAll('.', ',')
                        : '*******',
                    style: TextStyle(
                        fontSize: 16,
                        color: isReceita
                            ? const Color(0XFFDCFFA4)
                            : const Color(0XFFFFCAA4)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 8,
              height: 0,
            )
          ],
        ),
      ),
    );
  }
}
