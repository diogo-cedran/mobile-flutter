import 'package:flutter/material.dart';
import '../models/transacao.dart';

class FormularioTransacao extends StatefulWidget {
  final Function(Transacao) onSubmit;
  final Transacao? transacaoExistente;

  FormularioTransacao({required this.onSubmit, this.transacaoExistente});

  @override
  _FormularioTransacaoState createState() => _FormularioTransacaoState();
}

class _FormularioTransacaoState extends State<FormularioTransacao> {
  final _descricaoController = TextEditingController();
  final _valorController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.transacaoExistente != null) {
      _descricaoController.text = widget.transacaoExistente!.descricao;
      _valorController.text = widget.transacaoExistente!.valor.toString();
    }
  }

  void _submitForm() {
    final descricao = _descricaoController.text;
    final valor = double.tryParse(_valorController.text);

    if (descricao.isEmpty || valor == null || valor <= 0) {
      return;
    }

    final transacao = Transacao(descricao: descricao, valor: valor);
    widget.onSubmit(transacao);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.transacaoExistente != null ? 'Editar Transação' : 'Nova Transação'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _descricaoController,
              decoration: InputDecoration(labelText: 'Descrição'),
            ),
            TextField(
              controller: _valorController,
              decoration: InputDecoration(labelText: 'Valor'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text(widget.transacaoExistente != null ? 'Salvar' : 'Adicionar'),
            )
          ],
        ),
      ),
    );
  }
}
