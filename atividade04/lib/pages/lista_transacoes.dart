import 'package:flutter/material.dart';
import '../models/transacao.dart';
import 'formulario_transacao.dart';

class ListaTransacoes extends StatefulWidget {
  @override
  _ListaTransacoesState createState() => _ListaTransacoesState();
}

class _ListaTransacoesState extends State<ListaTransacoes> {
  final List<Transacao> _transacoes = [];

  void _adicionarTransacao(Transacao transacao) {
    setState(() {
      _transacoes.add(transacao);
    });
  }

  void _editarTransacao(int index, Transacao transacao) {
    setState(() {
      _transacoes[index] = transacao;
    });
  }

  void _removerTransacao(int index) {
    setState(() {
      _transacoes.removeAt(index);
    });
  }

  void _abrirFormulario({Transacao? transacao, int? index}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FormularioTransacao(
          onSubmit: (transacaoEditada) {
            if (index == null) {
              _adicionarTransacao(transacaoEditada);
            } else {
              _editarTransacao(index, transacaoEditada);
            }
          },
          transacaoExistente: transacao,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Transações'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _abrirFormulario(),
          ),
        ],
      ),
      body: _transacoes.isEmpty
          ? Center(
              child: Text(
                'Nenhuma transação adicionada ainda.',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: _transacoes.length,
              itemBuilder: (ctx, index) {
                return Card(
                  child: ListTile(
                    title: Text(_transacoes[index].descricao),
                    subtitle: Text('R\$ ${_transacoes[index].valor.toStringAsFixed(2)}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () => _abrirFormulario(transacao: _transacoes[index], index: index),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => _removerTransacao(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _abrirFormulario(),
        child: Icon(Icons.add),
      ),
    );
  }
}
