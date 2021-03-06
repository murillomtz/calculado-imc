import 'package:flutter/material.dart';
import 'package:massa_corporal_flutter/ui/calculoImc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controllerIdade = new TextEditingController();
  final TextEditingController _controllerAltura = new TextEditingController();
  final TextEditingController _controllerPeso = new TextEditingController();
  double resultado = 0.0;
  String _resultadoFinal = "";
  String _resultadoConsulta = "";

  /*
   Baixo peso muito grave = abaixo de 16 kg/m²
Baixo peso grave = entre 16 e 16,99 kg/m²
Baixo peso = entre 17 e 18,49 kg/m²
Peso normal = entre 18,50 e 24,99 kg/m²
Sobrepeso = entre 25 e 29,99 kg/m²
Obesidade grau I = entre 30 e 34,99 kg/m²
Obesidade grau II = entre 35 e 39,99 kg/m²
Obesidade grau III (obesidade mórbida) = maior que 40 kg/m²
   */

  void _calcularIMC() {
    setState(() {
      int idade = int.parse(_controllerIdade.text);
      double altura = double.parse(_controllerAltura.text);
      double peso = double.parse(_controllerPeso.text);

      if ((_controllerIdade.text.isNotEmpty || idade > 0) &&
          (_controllerAltura.text.isNotEmpty) &&
          (_controllerPeso.text.isNotEmpty || peso > 0)) {
        //calculo
        // Cálculo do índice de massa corporal = peso (quilos) ÷ altura² (metros)
        resultado = peso / (altura * altura);

        //Leitura do diagnostico
        if (double.parse(resultado.toStringAsFixed(1)) < 16.0) {
          _resultadoConsulta = "Baixo peso muito grave";
        } else if (double.parse(resultado.toStringAsFixed(1)) >= 16.0 &&
            resultado < 16.99) {
          _resultadoConsulta = "Baixo peso grave";
        } else if (double.parse(resultado.toStringAsFixed(1)) >= 17.0 &&
            resultado < 18.49) {
          // Baixo peso = entre 17 e 18,49 kg/m²
          _resultadoConsulta = "Baixo peso";
        } else if (double.parse(resultado.toStringAsFixed(1)) >= 18.50 &&
            resultado < 24.99) {
          //Peso normal = entre 18,50 e 24,99 kg/m²
          _resultadoConsulta = "Peso Normal";
        } else if (double.parse(resultado.toStringAsFixed(1)) >= 25.0 &&
            resultado < 29.99) {
          //Sobrepeso = entre 25 e 29,99 kg/m²
          _resultadoConsulta = " Sobrepeso";
        } else if (double.parse(resultado.toStringAsFixed(1)) >= 30.0 &&
            resultado < 34.99) {
          //Obesidade grau I = entre 30 e 34,99 kg/m²
          _resultadoConsulta = "Obesidade grau I";
        } else if (double.parse(resultado.toStringAsFixed(1)) >= 35.0 &&
            resultado < 39.99) {
          //Obesidade grau II = entre 35 e 39,99 kg/m²
          _resultadoConsulta = " Obesidade grau II";
        } else if (double.parse(resultado.toStringAsFixed(1)) >= 40.0) {
          //Obesidade grau III (obesidade mórbida) = maior que 40 kg/m²
          _resultadoConsulta = "Obesidade mórbida";
        } else {
          resultado = 0.0;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("IMC"),
        backgroundColor: Colors.purple,
      ),
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(2.0),
          children: [
            Image.asset('assets/imc.png', height: 75.0, width: 75.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                //margin: const EdgeInsets.all(3.0),
                alignment: Alignment.center,
                color: Colors.purple.shade50,
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _controllerIdade,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Idade",
                        hintText: "0",
                        icon: Icon(Icons.person),
                      ),
                    ),

                    TextField(
                      controller: _controllerAltura,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Altura",
                        hintText: "0.0",
                        icon: Icon(Icons.accessibility_new),
                      ),
                    ),

                    TextField(
                      controller: _controllerPeso,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Peso",
                        hintText: "Kg",
                        icon: Icon(Icons.assessment_outlined),
                        //icon: Icons.person,
                      ),
                    ),

                    //BOTÃO
                    Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          color: Colors.purple,
                          onPressed: _calcularIMC,
                          child: const Text('Calcular',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${resultado.toStringAsFixed(2)}",
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontSize: 19.9),
                ),
                Text("${_resultadoConsulta}",
                    style: TextStyle(
                        color: Colors.pinkAccent,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        fontSize: 19.9))
              ],
            )
          ],
        ),
      ),
    );
  }
}
