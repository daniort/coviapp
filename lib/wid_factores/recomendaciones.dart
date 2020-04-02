import 'package:flutter/material.dart';

class Recomendaciones extends StatefulWidget {
  @override
  _RecomendacionesState createState() => _RecomendacionesState();
}

class _RecomendacionesState extends State<Recomendaciones> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Recomendaciones'),
        ),
        body: Container(
          child: Center(child: Text('data')),
        ),
      
    );
  }
}
