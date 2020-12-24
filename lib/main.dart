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
            onPressed: () {
              print('Hello people!!!');
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 12.0,
          right: 12.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(
              Icons.person_outline,
              size: 160.0,
              color: Colors.yellow[800],
            ),
            TextField(
              keyboardType: TextInputType.number,
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
            TextField(
              keyboardType: TextInputType.number,
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
                  onPressed: () {},
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
              'Info',
              style: TextStyle(
                color: Colors.yellow[800],
                fontSize: 24.0,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
