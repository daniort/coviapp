import 'package:flutter/material.dart';

class Factores extends StatefulWidget {
  @override
  _FactoresState createState() => _FactoresState();
}

class _FactoresState extends State<Factores> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Factores de Riesgo'),
        ),
        body: Container(
          child: Center(child: Text('data')),
        ),
      
    );
  }
}
