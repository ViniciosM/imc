import 'dart:convert';
import 'dart:io';

import 'package:imc/failure.dart';
import 'package:imc/pessoa.dart';

void main(List<String> arguments) {
  print('------------ CALCULADORA IMC ------------ ');
  Future.delayed(Duration(seconds: 2));

  print('Informe o seu nome:');
  var lineNome = stdin.readLineSync(encoding: utf8);
  String nome = lineNome ?? "";

  try {
    print('Informe o seu peso:');
    var linePeso = stdin.readLineSync(encoding: utf8);
    double peso = double.parse(linePeso ?? "0");

    print('Informe a sua altura:');
    var lineAltura = stdin.readLineSync(encoding: utf8);
    double altura = double.parse(lineAltura ?? "0");

    Pessoa pessoa = Pessoa(nome: nome, peso: peso, altura: altura);
    print('Calculando o Índice de Massa Corportal de $nome ...');
    Future.delayed(Duration(seconds: 2));
    print('...');
    Future.delayed(Duration(seconds: 2));

    double imcResultado = pessoa.calcularIMC(peso: peso, altura: altura);

    if (imcResultado < 16) {
      print('RESULTADO: $imcResultado [MAGREZA GRAVE]');
    } else if (imcResultado >= 16 && imcResultado < 17) {
      print('RESULTADO: $imcResultado [MAGREZA MODERADA]');
    } else if (imcResultado >= 17 && imcResultado < 18.5) {
      print('RESULTADO: $imcResultado [MAGREZA LEVE]');
    } else if (imcResultado >= 18.5 && imcResultado < 25) {
      print('RESULTADO: $imcResultado [SAUDÁVEL]');
    } else if (imcResultado > 25 && imcResultado < 30) {
      print('RESULTADO: $imcResultado [SOBREPESO]');
    } else if (imcResultado >= 30 && imcResultado < 35) {
      print('RESULTADO: $imcResultado [OBESIDADE GRAU I]');
    } else if (imcResultado >= 35 && imcResultado < 40) {
      print('RESULTADO: $imcResultado [OBESIDADE GRAU II - SEVERA]');
    } else if (imcResultado >= 40) {
      print('RESULTADO: $imcResultado [OBESIDADE GRAU III - MÓRBIDA]');
    }
  } on FormatException {
    print('Valor inválido');
    exit(0);
  } catch (e) {
    Failure(message: 'Ocorreu um erro');
  }
}
