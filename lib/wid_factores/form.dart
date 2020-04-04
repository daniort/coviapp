import 'package:flutter/material.dart';

class Encuesta extends StatefulWidget {
  @override
  _EncuestaState createState() => _EncuestaState();
}

class _EncuestaState extends State<Encuesta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff19535f),
      appBar: AppBar(
        title: Text('Encuestas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
                  child: Container(
            child: Text('data'),
          ),
        ),
      ),
    );
  }
}
