import 'package:flutter/material.dart';

class Enlaces extends StatefulWidget {
  @override
  _EnlacesState createState() => _EnlacesState();
}

class _EnlacesState extends State<Enlaces> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Enlaces Prioritarios'),
        ),
        body: Container(
          child: Center(child: Text('data')),
        ),
      
    );
  }
}
