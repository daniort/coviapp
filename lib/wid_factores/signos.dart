import 'package:flutter/material.dart';

class Signos extends StatefulWidget {
  @override
  _SignosState createState() => _SignosState();
}

class _SignosState extends State<Signos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Signos y Síntomas'),
        ),
        body: Container(
          child: Center(child: Text('data')),
        ),
      
    );
  }
}
