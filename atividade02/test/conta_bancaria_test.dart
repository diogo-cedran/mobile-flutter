import 'package:test/test.dart';
import '../lib/models/conta_bancaria.dart';

void main() {
  group('ContaBancaria', () {
    test('Deve iniciar com o saldo correto', () {
      ContaBancaria<double> conta = ContaBancaria(1000.0);
      expect(conta.obterSaldo(), 1000.0);
    });

    test('Deve permitir depositar valores', () {
      ContaBancaria<double> conta = ContaBancaria(1000.0);
      conta.depositar(500.0);
      expect(conta.obterSaldo(), 1500.0);
    });

    test('Deve permitir sacar valores se saldo suficiente', () {
      ContaBancaria<double> conta = ContaBancaria(1000.0);
      conta.sacar(200.0);
      expect(conta.obterSaldo(), 800.0);
    });

    test('Não deve permitir saque se saldo insuficiente', () {
      ContaBancaria<double> conta = ContaBancaria(1000.0);
      conta.sacar(1200.0);
      expect(conta.obterSaldo(), 1000.0);
    });
  });
}
