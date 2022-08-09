import 'package:flutter/material.dart';
import '../global/convert.dart';

class SaldoContainer extends StatelessWidget {
  const SaldoContainer(
      {Key? key,
      required this.isVisible,
      required this.saldo,
      required this.isLoading})
      : super(key: key);
  final bool isVisible;
  final bool isLoading;
  final double saldo;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    Widget _buildText() {
        return Column(
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
                  visible: isVisible,
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
        );
      }

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
        child: _buildText(),
      ),
    );
  }
}