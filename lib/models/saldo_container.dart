import 'package:flutter/material.dart';

class SaldoContainer extends StatelessWidget {
  const SaldoContainer({Key? key, required this.isVisible}) : super(key: key);
  final bool isVisible;
  final double saldo = 5999.94;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
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
            StatefulBuilder(
              builder: ((context, setState) {
                return Row(
                  children: [
                    SizedBox(
                      width: 170,
                      height: 38,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: 'R\$  ',
                              style: TextStyle(
                                  fontSize: 24, color: Colors.white),
                            ),
                            TextSpan(
                              text: isVisible
                                  ? saldo
                                      .toStringAsFixed(2)
                                      .replaceAll('.', ',')
                                  : '*******',
                              style: const TextStyle(
                                  fontSize: 32, color: Colors.white),
                            ),
                          ],
                        ),
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
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
