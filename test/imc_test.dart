import 'package:imc/pessoa.dart';
import 'package:test/test.dart';

void main() {
  group('IMC', () {
    test('Cálculo IMC deve ser menor que 25', () {
      Pessoa pessoa = Pessoa(nome: 'Fulano', peso: 67, altura: 170);

      expect(pessoa.calcularIMC(peso: pessoa.peso, altura: pessoa.altura),
          lessThan(25));
    });

    test('Cálculo IMC deve ser maior que 30', () {
      Pessoa pessoa = Pessoa(nome: 'Fulano', peso: 110, altura: 1.80);

      expect(pessoa.calcularIMC(peso: pessoa.peso, altura: pessoa.altura),
          greaterThan(30));
    });
  });
}
