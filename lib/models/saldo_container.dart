import 'package:flutter/material.dart';

class SaldoContainer extends StatefulWidget {
  const SaldoContainer({Key? key}) : super(key: key);

  @override
  State<SaldoContainer> createState() => _SaldoContainerState();
}

class _SaldoContainerState extends State<SaldoContainer> {
  bool saldoVisible = false;
  double saldo = 8050.50;
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                                text: saldoVisible
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
                      IconButton(
                        onPressed: (() {
                          saldoVisible = !saldoVisible;
                          setState(() {});
                        }),
                        icon: Icon(saldoVisible
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined),
                        color: Colors.white,
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
      ),
    );
  }
}
