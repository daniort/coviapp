import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xff19535f),
      backgroundColor: Color(0xffdadad9),
      appBar: AppBar(
        title: Text('Mas Información'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Container(
            height: ((MediaQuery.of(context).size.height) * 1.4),
            width: ((MediaQuery.of(context).size.width)),
            decoration: BoxDecoration(
              color: Color(0xfff0f3f5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                   padding: const EdgeInsets.only(
                      top: 70.0, left: 10.0, right: 10.0, bottom: 10.0),
                  child: Container(
                    width: ((MediaQuery.of(context).size.width) * 0.4),
                    child: Image.asset("lib/assets/images/logotrans.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 5.0, left: 10.0, right: 10.0, bottom: 10.0),
                  child: Center(
                    child: Text(
                        'Herramienta de orientación sanitaria, recomendaciones y auto diagnóstico personal para COVID-2019.',
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: Colors.blueGrey, fontSize: 16.0)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Container(
                    height: ((MediaQuery.of(context).size.height) * 0.05),
                    child: Center(
                      child: Text('Desarrollada por:',
                          style: TextStyle(
                              color: Colors.blueGrey, fontSize: 15.0)),
                    ),
                  ),
                ),
                Container(
                  width: ((MediaQuery.of(context).size.width) * 0.7),
                  child: Image.asset("lib/assets/images/logocoz.png"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Container(
                    width: ((MediaQuery.of(context).size.width) * 0.7),
                    child: Image.asset("lib/assets/images/logolabsol.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Container(
                    height: ((MediaQuery.of(context).size.height) * 0.05),
                    child: Center(
                      child: Text('Bajo Licencia GPL 3.0',
                          style: TextStyle(
                              color: Color(0xff19535f), fontSize: 15.0)),
                    ),
                  ),
                ),
                Padding(
                   padding: const EdgeInsets.only(
                      top: 70.0, left: 10.0, right: 10.0, bottom: 10.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Center(
                            child: Text(
                          'Project Manager',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Center(
                    child: Text('Manuel Haro',
                        style:
                            TextStyle(color: Colors.blueGrey, fontSize: 15.0)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Center(
                            child: Text(
                          'Desarrolladores',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Center(
                    child: Text('Juan José Pelaez Villegas',
                        style:
                            TextStyle(color: Colors.blueGrey, fontSize: 15.0)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Center(
                    child: Text('Daniel Ortiz Castro',
                        style:
                            TextStyle(color: Colors.blueGrey, fontSize: 15.0)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Center(
                            child: Text(
                          'Asesores Médicos',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Center(
                    child: Text('Sandy Sierra',
                        style:
                            TextStyle(color: Colors.blueGrey, fontSize: 15.0)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Center(
                    child: Text('Manuel Escobar',
                        style:
                            TextStyle(color: Colors.blueGrey, fontSize: 15.0)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Center(
                    child: Text('Eduardo Gamez',
                        style:
                            TextStyle(color: Colors.blueGrey, fontSize: 15.0)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Center(
                    child: Text('Bruno Reimers',
                        style:
                            TextStyle(color: Colors.blueGrey, fontSize: 15.0)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Center(
                    child: Text('José Casillas',
                        style:
                            TextStyle(color: Colors.blueGrey, fontSize: 15.0)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
