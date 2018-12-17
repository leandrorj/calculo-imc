import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding:
            EdgeInsets.only(left: 10.0, top: 0.0, right: 10.0, bottom: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.person_outline, size: 120.0, color: Colors.green),
            Padding(
              padding: EdgeInsets.only(left: 0.0, top: 10.0, right: 0.0, bottom: 10.0),
              child: Text(
                "Info",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25.0),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Peso (Kg)",
                  labelStyle: TextStyle(color: Colors.green)),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Altura (cm)",
                  labelStyle: TextStyle(color: Colors.green)),
            ),
            Container(
              padding: EdgeInsets.only(left: 0.0, top: 10.0, right: 0.0, bottom: 0.0),
              height: 60.0,
              child: RaisedButton(
                onPressed: () {},
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
    );
  }
}
