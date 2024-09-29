import 'package:flutter/material.dart';

class BankingList extends StatelessWidget {
  final List<String> transacoes;

  BankingList(this.transacoes);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transacoes.length,
      itemBuilder: (ctx, index) {
        return Card(
          child: ListTile(
            title: Text(transacoes[index]),
          ),
        );
      },
    );
  }
}
