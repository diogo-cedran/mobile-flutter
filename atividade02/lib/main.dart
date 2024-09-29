import 'models/conta_bancaria.dart';

void main() {
  
  ContaBancaria<double> minhaConta = ContaBancaria(1000.0);
  
  minhaConta.depositar(500.0);
  minhaConta.sacar(200.0);

  print('Saldo atual: R\$ ${minhaConta.obterSaldo()}');
}
