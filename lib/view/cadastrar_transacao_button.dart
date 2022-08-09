import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:orange_wallet_mobile/controller/list_category_controller.dart';
import '../models/category.dart';

class CadastrarTransacaoButton extends StatefulWidget {
  const CadastrarTransacaoButton({Key? key, required this.callback})
      : super(key: key);
  final Future<void> callback;

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
  List<Category> receitaCategory = [];
  List<Category> despesaCategory = [];

  @override
  void dispose() {
    dataController.dispose();
    valueController.dispose();
    titleController.dispose();
    typeController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    ListCategoryController()
        .findByType('Receita')
        .then((value) => receitaCategory = value);
    ListCategoryController()
        .findByType('Despesa')
        .then((value) => despesaCategory = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var connection = ListCategoryController();

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
            items: List.generate(
                receitaCategory.length,
                (index) => DropdownMenuItem(
                      value: receitaCategory[index].id.toString(),
                      child: Text(receitaCategory[index].categoryName ?? ''),
                    )),
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
          items: List.generate(
              despesaCategory.length,
              (index) => DropdownMenuItem(
                    value: despesaCategory[index].id.toString(),
                    child: Text(despesaCategory[index].categoryName ?? ''),
                  )),
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
                          Form(
                              key: formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                        bool response =
                                            await connection.saveData(
                                          title: titleController.text,
                                          value: valueController.text
                                              .replaceAll(',', '.'),
                                          category:
                                              int.parse(categoryController),
                                          date:
                                              '${dataController.text.split('/').reversed.join('-')}T${DateTime.now().toString().substring(11, 23)}Z',
                                        );

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
                                                                widget.callback;
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
