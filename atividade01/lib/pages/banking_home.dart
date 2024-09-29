import 'package:flutter/material.dart';

class BankingHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Conta Bancária'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: <Widget>[
          Card(
            child: ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text('Saldo em Conta'),
              subtitle: Text('R\$ 7.000,00'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.attach_money),
              title: Text('Última Transação'),
              subtitle: Text('R\$ 200,00 - Saque'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.credit_card),
              title: Text('Cartão de Crédito'),
              subtitle: Text('Limite Disponível: R\$ 1.500,00'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('Investimentos'),
              subtitle: Text('R\$ 50.000,00'),
            ),
          ),
        ],
      ),
    );
  }
}
