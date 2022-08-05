import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:orange_wallet_mobile/controller/list_transaction_controller.dart';

import '../models/category.dart';

class CadastrarTransacaoButton extends StatefulWidget {
  const CadastrarTransacaoButton({Key? key}) : super(key: key);

  @override
  State<CadastrarTransacaoButton> createState() =>
      _CadastrarTransacaoButtonState();
}

class _CadastrarTransacaoButtonState extends State<CadastrarTransacaoButton> {
  bool _receita = true;
  TextEditingController dataController = TextEditingController();
  TextEditingController valueController = TextEditingController();
  String categoryController = '';
  TextEditingController titleController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    dataController.dispose();
    valueController.dispose();
    titleController.dispose();
    typeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    var connection = ListTransactionController();

    DropdownButtonFormField<String> dropdownCategory() {
      if (_receita) {
        return DropdownButtonFormField<String>(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Valor não pode ser nulo';
              }
            },
            dropdownColor: Colors.grey[800],
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0XFFFF8A00))),
              isDense: true,
              filled: true,
              hintText: 'Selecione a categoria',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8)),
            ),
            items: const [
              DropdownMenuItem(
                value: 'Salário',
                child: Text('Salário'),
              ),
              DropdownMenuItem(
                value: '13º Salário',
                child: Text('13º Salário'),
              ),
              DropdownMenuItem(
                value: 'Aluguéis',
                child: Text('Aluguéis'),
              ),
              DropdownMenuItem(
                value: 'Férias',
                child: Text('Férias'),
              ),
              DropdownMenuItem(
                value: 'Renda extra',
                child: Text('Renda extra'),
              ),
              DropdownMenuItem(
                value: 'Renda de Investimento',
                child: Text('Renda de investimento'),
              ),
              DropdownMenuItem(
                value: 'Rendimentos bancários',
                child: Text('Rendimentos bancários'),
              ),
            ],
            onChanged: (valueSelected) {
              categoryController = valueSelected ?? '';
            });
      } else {
        return DropdownButtonFormField<String>(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Valor não pode ser nulo';
            }
          },
          dropdownColor: Colors.grey[800],
          decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0XFFFF8A00))),
            isDense: true,
            filled: true,
            hintText: 'Selecione a categoria',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(8)),
          ),
          onChanged: (value) {
            categoryController = value ?? '';
          },
          items: const [
            DropdownMenuItem(
              value: 'Alimentação',
              child: Text('Alimentação'),
            ),
            DropdownMenuItem(
              value: 'Combustível',
              child: Text('Combustível'),
            ),
            DropdownMenuItem(
              value: 'Despesas pessoais',
              child: Text('Despesas pessoais'),
            ),
            DropdownMenuItem(
              value: 'Educação',
              child: Text('Educação'),
            ),
            DropdownMenuItem(
              value: 'Empréstimos',
              child: Text('Empréstimos'),
            ),
            DropdownMenuItem(
              value: 'Estacionamento',
              child: Text('Estacionamento'),
            ),
            DropdownMenuItem(
              value: 'Farmácia',
              child: Text('Farmácia'),
            ),
            DropdownMenuItem(
              value: 'Internet',
              child: Text('Internet'),
            ),
            DropdownMenuItem(
              value: 'IPVA',
              child: Text('IPVA'),
            ),
            DropdownMenuItem(
              value: 'Lazer',
              child: Text('Lazer'),
            ),
            DropdownMenuItem(
              value: 'Livros',
              child: Text('Livros'),
            ),
            DropdownMenuItem(
              value: 'Manutenção veicular',
              child: Text('Manutenção veicular'),
            ),
            DropdownMenuItem(
              value: 'Moradia',
              child: Text('Moradia'),
            ),
            DropdownMenuItem(
              value: 'Pets',
              child: Text('Pets'),
            ),
            DropdownMenuItem(
              value: 'Presentes',
              child: Text('Presentes'),
            ),
            DropdownMenuItem(
              value: 'Saúde',
              child: Text('Saúde'),
            ),
            DropdownMenuItem(
              value: 'Seguro',
              child: Text('Seguro'),
            ),
            DropdownMenuItem(
              value: 'Stream',
              child: Text('Stream'),
            ),
            DropdownMenuItem(
              value: 'Tecnologia',
              child: Text('Tecnologia'),
            ),
            DropdownMenuItem(
              value: 'Telefonia',
              child: Text('Telefonia'),
            ),
            DropdownMenuItem(
              value: 'Transporte',
              child: Text('Transporte'),
            ),
            DropdownMenuItem(
              value: 'Vestuário',
              child: Text('Vestuário'),
            ),
            DropdownMenuItem(
              value: 'Viagens',
              child: Text('Viagens'),
            ),
          ],
        );
      }
    }

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
                            height: 20,
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
                            height: 20,
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
                          dropdownCategory(),
                          const SizedBox(
                            height: 20,
                            width: 0,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              'Transação',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Form(
                              key: formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 80,
                                    child: TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Valor não pode ser nulo';
                                        }
                                      },
                                      controller: titleController,
                                      cursorColor: const Color(0XFFFF8A00),
                                      decoration: InputDecoration(
                                        errorBorder: null,
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0XFFFF8A00))),
                                        isDense: true,
                                        filled: true,
                                        hintText:
                                            'Escreva aqui o título da sua transação',
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
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 6.0),
                                              child: Text(
                                                'Valor',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 80,
                                              child: TextFormField(
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly,
                                                  TextInputMask(
                                                      mask: '9+,99',
                                                      placeholder: '0',
                                                      maxPlaceHolders: 3,
                                                      reverse: true)
                                                ],
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Valor não pode ser nulo';
                                                  }
                                                },
                                                controller: valueController,
                                                cursorColor:
                                                    const Color(0XFFFF8A00),
                                                keyboardType:
                                                    const TextInputType
                                                            .numberWithOptions(
                                                        decimal: true),
                                                decoration: InputDecoration(
                                                  focusedBorder:
                                                      const OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Color(
                                                                  0XFFFF8A00))),
                                                  isDense: true,
                                                  filled: true,
                                                  hintText: 'R\$ 0,00',
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Colors.grey),
                                                  ),
                                                  disabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Colors.grey),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  border: OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color:
                                                                  Colors.grey),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                ),
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 6.0),
                                              child: Text(
                                                'Data',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 80,
                                              child: TextFormField(
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Valor não pode ser nulo';
                                                  }
                                                },
                                                cursorColor:
                                                    const Color(0XFFFF8A00),
                                                controller: dataController,
                                                keyboardType:
                                                    TextInputType.none,
                                                onTap: () async {
                                                  DateTime? date =
                                                      await showDatePicker(
                                                    builder: (context, child) {
                                                      return Theme(
                                                          data:
                                                              Theme.of(context)
                                                                  .copyWith(
                                                            dialogBackgroundColor:
                                                                Colors.black,
                                                            colorScheme: const ColorScheme.light(
                                                                primary: Color(
                                                                    0XFF383838),
                                                                onPrimary:
                                                                    Colors
                                                                        .white,
                                                                onSurface:
                                                                    Colors
                                                                        .white),
                                                          ),
                                                          child: child!);
                                                    },
                                                    locale: const Locale(
                                                        'pt', 'BR'),
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
                                                  focusedBorder:
                                                      const OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Color(
                                                                  0XFFFF8A00))),
                                                  focusColor:
                                                      const Color(0XFFFF8A00),
                                                  isDense: true,
                                                  filled: true,
                                                  hintText: '01/01/2020',
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Colors.grey),
                                                  ),
                                                  disabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Colors.grey),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  border: OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color:
                                                                  Colors.grey),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                    width: 0,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(24),
                                        ),
                                        fixedSize: Size(mediaQuery.width, 48),
                                        primary: const Color(0XFFFF8A00)),
                                    onPressed: () async {
                                      if (_receita) {
                                        typeController.text = 'Receita';
                                      } else {
                                        typeController.text = 'Despesa';
                                      }

                                      var validate =
                                          formKey.currentState?.validate() ??
                                              false;

                                      if (validate) {
                                        bool response = await connection.saveData(
                                            title: titleController.text,
                                            value: valueController.text,
                                            category: Category(
                                                categoryName:
                                                    categoryController,
                                                categoryType:
                                                    typeController.text),
                                            date:
                                                '${dataController.text.split('/').reversed.join('-')}T00:17:54.575Z');

                                        if (response = true) {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                Dialog savedDialog = Dialog(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  child: Container(
                                                    height: 216,
                                                    width: 390,
                                                    decoration:
                                                        const BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius
                                                                        .circular(
                                                                            30)),
                                                            gradient: LinearGradient(
                                                                begin: Alignment
                                                                    .topCenter,
                                                                end: Alignment
                                                                    .bottomCenter,
                                                                colors: [
                                                                  Color(
                                                                      0XFF2F2F2F),
                                                                  Color(
                                                                      0XFF131313),
                                                                ])),
                                                    child: Column(
                                                      children: [
                                                        Align(
                                                          alignment: Alignment
                                                              .topRight,
                                                          child: IconButton(
                                                              onPressed: () {
                                                                Navigator.popUntil(
                                                                    context,
                                                                    ModalRoute
                                                                        .withName(
                                                                            '/'));
                                                              },
                                                              icon: const Icon(
                                                                  Icons.close,
                                                                  color: Colors
                                                                      .white)),
                                                        ),
                                                        const SizedBox(
                                                          height: 8,
                                                        ),
                                                        const Text(
                                                          'Transação cadastrada',
                                                          style: TextStyle(
                                                              fontSize: 24),
                                                        ),
                                                        const Text(
                                                          'com sucesso',
                                                          style: TextStyle(
                                                              fontSize: 24),
                                                        ),
                                                        const SizedBox(
                                                          height: 32,
                                                        ),
                                                        ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                                  fixedSize:
                                                                      const Size(
                                                                          241, 48),
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            24),
                                                                  ),
                                                                  primary:
                                                                      const Color(
                                                                          0XFFFF8A00)),
                                                          onPressed: () {
                                                            Navigator.popUntil(
                                                                context,
                                                                ModalRoute
                                                                    .withName(
                                                                        '/'));
                                                            dataController
                                                                .clear();
                                                            typeController
                                                                .clear();
                                                            valueController
                                                                .clear();
                                                            titleController
                                                                .clear();
                                                          },
                                                          child: const Text(
                                                            'OK',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                                return savedDialog;
                                              });
                                        } else {
                                          const SnackBar(
                                              content: Text(
                                                  'Falha de conexão. Tente novamente mais tarde.'));
                                        }
                                      } else {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              Dialog savedDialog = Dialog(
                                                backgroundColor:
                                                    Colors.transparent,
                                                child: Container(
                                                  height: 216,
                                                  width: 390,
                                                  decoration:
                                                      const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          30)),
                                                          gradient: LinearGradient(
                                                              begin: Alignment
                                                                  .topCenter,
                                                              end: Alignment
                                                                  .bottomCenter,
                                                              colors: [
                                                                Color(
                                                                    0XFF2F2F2F),
                                                                Color(
                                                                    0XFF131313),
                                                              ])),
                                                  child: Column(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            Alignment.topRight,
                                                        child: IconButton(
                                                            onPressed: () {
                                                              Navigator.popUntil(
                                                                  context,
                                                                  ModalRoute
                                                                      .withName(
                                                                          '/'));
                                                            },
                                                            icon: const Icon(
                                                                Icons.close,
                                                                color: Colors
                                                                    .white)),
                                                      ),
                                                      const SizedBox(
                                                        height: 8,
                                                      ),
                                                      const Text(
                                                        'Preencha os dados',
                                                        style: TextStyle(
                                                            fontSize: 24),
                                                      ),
                                                      const Text(
                                                        'necessários',
                                                        style: TextStyle(
                                                            fontSize: 24),
                                                      ),
                                                      const SizedBox(
                                                        height: 32,
                                                      ),
                                                      ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                fixedSize:
                                                                    const Size(
                                                                        241,
                                                                        48),
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              24),
                                                                ),
                                                                primary:
                                                                    const Color(
                                                                        0XFFFF8A00)),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: const Text(
                                                          'OK',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                              return savedDialog;
                                            });
                                      }
                                    },
                                    child: const Text(
                                      'CADASTRAR',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                  ),
                                ],
                              )),
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
