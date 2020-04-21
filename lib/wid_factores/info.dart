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
      backgroundColor: Color(0xff19535f),
      appBar: AppBar(
        title: Text('Mas Información'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: ((MediaQuery.of(context).size.height)),
          width: ((MediaQuery.of(context).size.width)),
          decoration: BoxDecoration(
            color: Color(0xfff0f3f5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  height: ((MediaQuery.of(context).size.height) * 0.05),
                  child: Center(
                    child: Text('Desarrollada por:',
                        style: GoogleFonts.doHyeon(
                            color: Colors.blueGrey, fontSize: 18.0)),
                  ),
                ),
              ),
              Container(
                height: ((MediaQuery.of(context).size.height) * 0.2),
                child: Image.asset("lib/assets/images/upsz-1-1.jpg"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Container(
                  height: ((MediaQuery.of(context).size.height) * 0.05),
                  child: Center(
                    child: Text('Bajo Licencia GPL 3.0',
                        style: GoogleFonts.doHyeon(
                            color: Color(0xff19535f), fontSize: 18.0)),
                  ),
                ),
              ),
               Padding(
                padding: const EdgeInsets.only(top:10.0,bottom: 5.0),
                 child: Center(
                    child: Text('Project Manager:',
                        style: GoogleFonts.doHyeon(
                            color:  Colors.blueGrey, fontSize: 14.0)),
                  ),
              
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                 child: Center(
                    child: Text('Manuel Haro',
                        style: GoogleFonts.doHyeon(
                            color:  Colors.blueGrey, fontSize: 18.0)),
                  ),
              
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Center(
                  child: Text('Desarrolladores:',
                      style: GoogleFonts.doHyeon(
                          color: Colors.blueGrey, fontSize: 14.0)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Center(
                  child: Text('Juan José Pelaez Villegas',
                      style: GoogleFonts.doHyeon(
                          color: Colors.blueGrey, fontSize: 18.0)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Center(
                  child: Text('Daniel Ortiz Castro',
                      style: GoogleFonts.doHyeon(
                          color: Colors.blueGrey, fontSize: 18.0)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Center(
                  child: Text('Asesores Médicos:',
                      style: GoogleFonts.doHyeon(
                          color: Colors.blueGrey, fontSize: 14.0)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Center(
                  child: Text('Sandy Sierra',
                      style: GoogleFonts.doHyeon(
                          color: Colors.blueGrey, fontSize: 18.0)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Center(
                  child: Text('Manuel Escobar',
                      style: GoogleFonts.doHyeon(
                          color: Colors.blueGrey, fontSize: 18.0)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Center(
                  child: Text('Eduardo Gamez',
                      style: GoogleFonts.doHyeon(
                          color: Colors.blueGrey, fontSize: 18.0)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                 child: Center(
                    child: Text('Bruno Reimers',
                        style: GoogleFonts.doHyeon(
                            color:  Colors.blueGrey, fontSize: 18.0)),
                  ),
              
              ),


            ],
          ),
        ),
      ),
    );
  }
}
