import 'package:flutter/material.dart';

enum ReceitaCategories {
  decimoTerceiroSalario,
  alugueis,
  ferias,
  rendaInvestimentos,
  rendaExtra,
  rendimentosBancarios,
  salario,
}

enum DespesaCategories {
  alimentacao,
  combustivel,
  despesasPessoais,
  educacao,
  emprestimos,
  estacionamento,
  farmacia,
  internet,
  ipva,
  lazer,
  livros,
  manutencaoVeiculo,
  moradia,
  pets,
  presentes,
  saude,
  seguro,
  streams,
  tecnologia,
  telefonia,
  transporte,
  vestuario,
  viagens,
}

class CategoryDropdown extends StatefulWidget {
  final bool isReceita;
  // final String controller;
  const CategoryDropdown({Key? key, required this.isReceita}) : super(key: key);

  @override
  State<CategoryDropdown> createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  var currentValue;
  @override
  Widget build(BuildContext context) {
    if (widget.isReceita) {
      return DropdownButtonFormField<ReceitaCategories>(
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
              value: ReceitaCategories.salario,
              child: Text('Salário'),
            ),
            DropdownMenuItem(
              value: ReceitaCategories.decimoTerceiroSalario,
              child: Text('13º Salário'),
            ),
            DropdownMenuItem(
              value: ReceitaCategories.alugueis,
              child: Text('Aluguéis'),
            ),
            DropdownMenuItem(
              value: ReceitaCategories.ferias,
              child: Text('Férias'),
            ),
            DropdownMenuItem(
              value: ReceitaCategories.rendaExtra,
              child: Text('Renda extra'),
            ),
            DropdownMenuItem(
              value: ReceitaCategories.rendaInvestimentos,
              child: Text('Renda de investimento'),
            ),
            DropdownMenuItem(
              value: ReceitaCategories.rendimentosBancarios,
              child: Text('Rendimentos Bancários'),
            ),
          ],
          onChanged: (valueSelected) {
            currentValue = valueSelected;
          });
    } else {
      return DropdownButtonFormField<DespesaCategories>(
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
          currentValue = value;
        },
        items: const [
          DropdownMenuItem(
            value: DespesaCategories.alimentacao,
            child: Text('Alimentação'),
          ),
          DropdownMenuItem(
            value: DespesaCategories.combustivel,
            child: Text('Combustível'),
          ),
          DropdownMenuItem(
            value: DespesaCategories.despesasPessoais,
            child: Text('Despesas pessoais'),
          ),
          DropdownMenuItem(
            value: DespesaCategories.educacao,
            child: Text('Educação'),
          ),
          DropdownMenuItem(
            value: DespesaCategories.emprestimos,
            child: Text('Empréstimos'),
          ),
          DropdownMenuItem(
            value: DespesaCategories.estacionamento,
            child: Text('Estacionamento'),
          ),
          DropdownMenuItem(
            value: DespesaCategories.farmacia,
            child: Text('Farmácia'),
          ),
          DropdownMenuItem(
            value: DespesaCategories.internet,
            child: Text('Internet'),
          ),
          DropdownMenuItem(
            value: DespesaCategories.ipva,
            child: Text('IPVA'),
          ),
          DropdownMenuItem(
            value: DespesaCategories.lazer,
            child: Text('Lazer'),
          ),
          DropdownMenuItem(
            value: DespesaCategories.livros,
            child: Text('Livros'),
          ),
          DropdownMenuItem(
            value: DespesaCategories.manutencaoVeiculo,
            child: Text('Manutenção veicular'),
          ),
          DropdownMenuItem(
            value: DespesaCategories.moradia,
            child: Text('Moradia'),
          ),
          DropdownMenuItem(
            value: DespesaCategories.pets,
            child: Text('Pets'),
          ),
          DropdownMenuItem(
            value: DespesaCategories.presentes,
            child: Text('Presentes'),
          ),
          DropdownMenuItem(
            value: DespesaCategories.saude,
            child: Text('Saúde'),
          ),
          DropdownMenuItem(
            value: DespesaCategories.seguro,
            child: Text('Seguro'),
          ),
          DropdownMenuItem(
            value: DespesaCategories.streams,
            child: Text('Streams'),
          ),
          DropdownMenuItem(
            value: DespesaCategories.tecnologia,
            child: Text('Tecnologia'),
          ),
          DropdownMenuItem(
            value: DespesaCategories.telefonia,
            child: Text('Telefonia'),
          ),
          DropdownMenuItem(
            value: DespesaCategories.transporte,
            child: Text('Transporte'),
          ),
          DropdownMenuItem(
            value: DespesaCategories.vestuario,
            child: Text('Vestuário'),
          ),
          DropdownMenuItem(
            value: DespesaCategories.viagens,
            child: Text('Viagens'),
          ),
        ],
      );
    }
  }
}
