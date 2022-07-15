import 'package:flutter/material.dart';

class ReceitaDespesaContainer extends StatelessWidget {
  final bool isReceita;
  const ReceitaDespesaContainer({Key? key, required this.isReceita})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
      child: Container(
        // padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
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
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(
                  isReceita ? 'Receita' : 'Despesa',
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
              StatefulBuilder(
                builder: ((context, setState) {
                  return Row(
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
                              text: '5.000,00',
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
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
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
