import 'package:flutter/material.dart';

class CadastrarTransacaoButton extends StatefulWidget {
  const CadastrarTransacaoButton({Key? key}) : super(key: key);

  @override
  State<CadastrarTransacaoButton> createState() =>
      _CadastrarTransacaoButtonState();
}

class _CadastrarTransacaoButtonState extends State<CadastrarTransacaoButton> {
  bool _receita = true;
  TextEditingController dataController = TextEditingController();

  @override
  void dispose() {
    dataController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(mediaQuery.width, mediaQuery.height * .05687),
        primary: const Color(0XFFFF8A00),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      onPressed: () {
        showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (BuildContext context) {
              return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Wrap(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      height: mediaQuery.height * 0.7,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(40),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0XFF131313),
                            Color(0xFF2F2F2F),
                          ],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Center(
                              child: Container(
                                height: 6,
                                width: mediaQuery.width / 2,
                                decoration: BoxDecoration(
                                  color: const Color(0XFF616161),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 32,
                            width: 0,
                          ),
                          const Text(
                            'Cadastrar transação',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(
                            width: 0,
                            height: 32,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 8, left: 12.0, right: 12, bottom: 8),
                            width: mediaQuery.width,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(14)),
                                        primary: _receita
                                            ? const Color(0XFFAEFE49)
                                            : Colors.black),
                                    onPressed: () {
                                      if (!_receita) {
                                        setState(() {
                                          _receita = true;
                                        });
                                      }
                                    },
                                    icon: Icon(Icons.arrow_circle_up_outlined,
                                        color: _receita
                                            ? Colors.black
                                            : Colors.white,
                                        size: 23),
                                    label: Text(
                                      'Receita',
                                      style: TextStyle(
                                          color: _receita
                                              ? Colors.black
                                              : Colors.white),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(14)),
                                        primary: _receita
                                            ? Colors.black
                                            : const Color(0XFFFF523A)),
                                    onPressed: () {
                                      if (_receita) {
                                        setState(() {
                                          _receita = false;
                                        });
                                      }
                                    },
                                    icon: Icon(
                                      Icons.arrow_circle_down_outlined,
                                      color: _receita
                                          ? Colors.white
                                          : Colors.black,
                                      size: 23,
                                    ),
                                    label: Text(
                                      'Despesa',
                                      style: TextStyle(
                                          color: _receita
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 27,
                            width: 0,
                          ),
                          const Text(
                            'Transação',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          TextFormField(
                            cursorColor: const Color(0XFFFF8A00),
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0XFFFF8A00))),
                              isDense: true,
                              filled: true,
                              hintText:
                                  'Escreva aqui o título da sua transação',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                            width: 0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 6.0),
                                      child: Text(
                                        'Valor',
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      cursorColor: const Color(0XFFFF8A00),
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0XFFFF8A00))),
                                        isDense: true,
                                        filled: true,
                                        hintText: 'R\$ 0,00',
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: const BorderSide(
                                              color: Colors.grey),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 0,
                                width: 17.49,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 6.0),
                                      child: Text(
                                        'Data',
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      cursorColor: const Color(0XFFFF8A00),
                                      controller: dataController,
                                      keyboardType: TextInputType.none,
                                      onTap: () async {
                                        DateTime? date = await showDatePicker(
                                          builder: (context, child) {
                                            return Theme(
                                                data:
                                                    Theme.of(context).copyWith(
                                                  dialogBackgroundColor:
                                                      Colors.black,
                                                  colorScheme:
                                                      const ColorScheme.light(
                                                          primary:
                                                              Color(0XFF383838),
                                                          onPrimary:
                                                              Colors.white,
                                                          onSurface:
                                                              Colors.white),
                                                ),
                                                child: child!);
                                          },
                                          locale: const Locale('pt', 'BR'),
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2020),
                                          lastDate: DateTime.now(),
                                        );
                                        dataController.text = date
                                                ?.toString()
                                                .substring(0, 10)
                                                .split('-')
                                                .reversed
                                                .join('/') ??
                                            '';
                                      },
                                      decoration: InputDecoration(
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0XFFFF8A00))),
                                        focusColor: const Color(0XFFFF8A00),
                                        isDense: true,
                                        filled: true,
                                        hintText: '01/01/2020',
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: const BorderSide(
                                              color: Colors.grey),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 27,
                            width: 0,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              'Categoria',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          DropdownButtonFormField<String>(
                            dropdownColor: const Color(0XFF383838),
                            isDense: true,
                            items: const [
                              DropdownMenuItem(
                                value: 'carro',
                                child: Text(
                                  'Combustível',
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'compras',
                                child: Text(
                                  'Mantimentos',
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'alimento',
                                child: Text(
                                  'Alimentação',
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'essenciais',
                                child: Text(
                                  'Água/Luz/Internet/Telefone',
                                ),
                              ),
                            ],
                            onChanged: (String? value) {},
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0XFFFF8A00))),
                              isDense: true,
                              filled: true,
                              hintText: 'Selecione a categoria',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                          const SizedBox(
                            height: 27,
                            width: 0,
                          ),
                          const SizedBox(
                            height: 20,
                            width: 0,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                fixedSize: Size(mediaQuery.width, 48),
                                primary: const Color(0XFFFF8A00)),
                            onPressed: () {},
                            child: const Text(
                              'CADASTRAR',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              });
            });
      },
      icon: const Icon(
        Icons.add_circle_outline,
        color: Colors.black,
      ),
      label: const Text(
        'Cadastrar Transação',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}