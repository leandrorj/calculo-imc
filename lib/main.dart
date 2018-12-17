import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _textInfo = "Informe seus dados!";

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  void _resetFields(){
    setState(() {
      FocusScope.of(context).requestFocus(FocusNode()); //desabilita o focus
      _textInfo = "Informe seus dados!";
      weightController.clear();
      heightController.clear();


    });

  }

  void _calculate(){
    setState(() {
      double peso = double.parse(weightController.text);
      double altura = double.parse(heightController.text) / 100;
      double imc = peso / (altura * altura);

      if(imc < 16.6){
        _textInfo = "Abaixo do Peso (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 18.6 && imc < 24.9){
        _textInfo = "Peso ideal (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 24.9 && imc < 29.9){
        _textInfo = "Levemente acima do peso (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 29.9 && imc < 34.9){
        _textInfo = "Obesidade Grau I (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 34.9 && imc < 39.9){
        _textInfo = "Obesidade Grau II (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 40){
        _textInfo = "Obesidade Grau III (${imc.toStringAsPrecision(4)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _resetFields();
            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding:
            EdgeInsets.only(left: 10.0, top: 0.0, right: 10.0, bottom: 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.person_outline, size: 120.0, color: Colors.green),
              Padding(
                padding: EdgeInsets.only(
                    left: 0.0, top: 10.0, right: 0.0, bottom: 10.0),
                child: Text(
                  _textInfo,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green, fontSize: 25.0),
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Peso (Kg)",
                    labelStyle: TextStyle(color: Colors.green)),
                controller: weightController,
                autofocus: false,
                validator: (value) {
                  if(value.isEmpty){
                    return "Insira seu Peso!";
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Altura (cm)",
                    labelStyle: TextStyle(color: Colors.green)),
                controller: heightController,
                autofocus: false,
                validator: (value) {
                  if(value.isEmpty){
                    return "Insira sua altura!";
                  }
                },
              ),
              Container(
                padding: EdgeInsets.only(
                    left: 0.0, top: 10.0, right: 0.0, bottom: 0.0),
                height: 60.0,
                child: RaisedButton(
                  onPressed: (){
                    if(_formKey.currentState.validate()){
                      _calculate();
                    }
                  },
                  child: Text(
                    "Calcular",
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                  ),
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
