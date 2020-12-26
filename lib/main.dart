import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _weightController = TextEditingController();
  TextEditingController _heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = 'Informe os seus dados';

  void _resetFields() {
    _weightController.text = '';
    _heightController.text = '';

    setState(() {
      _infoText = 'Informe os seus dados';
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(_weightController.text);
      double height = double.parse(_heightController.text) / 100;

      double imc = weight / (height * height);

      if (imc < 18.6) {
        _infoText = 'Abaixo do peso (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText = 'Peso ideal (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText = 'Levemente acima do peso (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText = 'Obesidade grau I (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText = 'Obesidade grau II (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoText = 'Obesidade grau III (${imc.toStringAsPrecision(3)})';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora IMC'),
        centerTitle: true,
        backgroundColor: Colors.yellow[800],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetFields,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 12.0,
          right: 12.0,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.person_outline,
                size: 160.0,
                color: Colors.yellow[800],
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _weightController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Insira seu peso.';
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Peso (Kg)',
                  labelStyle: TextStyle(
                    color: Colors.yellow[800],
                  ),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.yellow[800],
                  fontSize: 24.0,
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _heightController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Insira sua altura';
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Altura (cm)',
                  labelStyle: TextStyle(
                    color: Colors.yellow[800],
                  ),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.yellow[800],
                  fontSize: 24.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 16.0,
                  bottom: 16.0,
                ),
                child: Container(
                  height: 48.0,
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _calculate();
                      }
                    },
                    child: Text(
                      'Calcular',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                      ),
                    ),
                    color: Colors.yellow[800],
                  ),
                ),
              ),
              Text(
                _infoText,
                style: TextStyle(
                  color: Colors.yellow[800],
                  fontSize: 24.0,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
