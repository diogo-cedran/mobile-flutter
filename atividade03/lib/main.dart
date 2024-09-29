import 'package:flutter/material.dart';
import 'pages/banking_form.dart';
import 'pages/banking_list.dart';

void main() {
  runApp(BankingApp());
}

class BankingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicação Bancária',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BankingHome(),
    );
  }
}

class BankingHome extends StatefulWidget {
  @override
  _BankingHomeState createState() => _BankingHomeState();
}

class _BankingHomeState extends State<BankingHome> {
  final List<String> _transacoes = [];

  void _adicionarTransacao(String transacao) {
    setState(() {
      _transacoes.add(transacao);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplicação Bancária'),
      ),
      body: Column(
        children: [
          BankingForm(_adicionarTransacao),
          Expanded(
            child: BankingList(_transacoes),
          ),
        ],
      ),
    );
  }
}
