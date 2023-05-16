import 'package:imc/failure.dart';

class Pessoa {
  final String nome;
  final double peso;
  final double altura;

  Pessoa({required this.nome, required this.peso, required this.altura});

  double calcularIMC({required double peso, required double altura}) {
    try {
      double calculoIMC = peso / (altura * altura);
      print(calculoIMC);
      if (calculoIMC.isInfinite) {
        throw Failure(message: 'Erro: Valor infinito');
      }
      return calculoIMC;
    } catch (e) {
      throw Failure(message: 'Erro ao realizar cálculo IMC');
    }
  }
}
