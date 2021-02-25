import 'package:flutter/src/widgets/editable_text.dart';

class CalculoImc {
  CalculoImc();

  double calcularImc(_controllerIdade, _controllerAltura, _resultadoConsulta,
      _controllerPeso,
      double resultado, idade, peso, altura) {
    if ((_controllerIdade.text.isNotEmpty || idade > 0)
        && (_controllerAltura.text.isNotEmpty)
        && (_controllerPeso.text.isNotEmpty || peso > 0)) {
      //calculo
      // Cálculo do índice de massa corporal = peso (quilos) ÷ altura² (metros)
      resultado = peso / (altura * altura);

      //Leitura do diagnostico
      if (double.parse(resultado.toStringAsFixed(1)) < 16.0) {
        _resultadoConsulta = "Baixo peso muito grave";
      } else if (double.parse(resultado.toStringAsFixed(1)) >= 16.0
          && resultado < 16.99) {
        _resultadoConsulta = "Baixo peso grave";
      } else if (double.parse(resultado.toStringAsFixed(1)) >= 17.0
          && resultado < 18.49) {
        // Baixo peso = entre 17 e 18,49 kg/m²
        _resultadoConsulta = "Baixo peso";
      } else if (double.parse(resultado.toStringAsFixed(1)) >= 18.50
          && resultado < 24.99) {
        //Peso normal = entre 18,50 e 24,99 kg/m²
        _resultadoConsulta = "Peso Normal";
      } else if (double.parse(resultado.toStringAsFixed(1)) >= 25.0
          && resultado < 29.99) {
        //Sobrepeso = entre 25 e 29,99 kg/m²
        _resultadoConsulta = " Sobrepeso";
      } else if (double.parse(resultado.toStringAsFixed(1)) >= 30.0
          && resultado < 34.99) {
        //Obesidade grau I = entre 30 e 34,99 kg/m²
        _resultadoConsulta = "Obesidade grau I";
      } else if (double.parse(resultado.toStringAsFixed(1)) >= 35.0
          && resultado < 39.99) {
        //Obesidade grau II = entre 35 e 39,99 kg/m²
        _resultadoConsulta = " Obesidade grau II";
      } else if (double.parse(resultado.toStringAsFixed(1)) >= 40.0) {
        //Obesidade grau III (obesidade mórbida) = maior que 40 kg/m²
        _resultadoConsulta = "Obesidade mórbida";
      } else {

         resultado = 0.0;
      }
    }
  }
}
