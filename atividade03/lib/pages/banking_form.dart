import 'package:flutter/material.dart';

class BankingForm extends StatefulWidget {
  final Function(String) adicionarTransacao;

  BankingForm(this.adicionarTransacao);

  @override
  _BankingFormState createState() => _BankingFormState();
}

class _BankingFormState extends State<BankingForm> {
  final _controller = TextEditingController();

  void _submitForm() {
    final textoInserido = _controller.text;
    if (textoInserido.isEmpty) {
      return;
    }
    widget.adicionarTransacao(textoInserido);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Descrição da Transação'),
              controller: _controller,
              onSubmitted: (_) => _submitForm(),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Adicionar Transação'),
            ),
          ],
        ),
      ),
    );
  }
}
