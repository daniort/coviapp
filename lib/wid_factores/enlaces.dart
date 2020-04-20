import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';  

class Enlaces extends StatefulWidget {
  @override
  _EnlacesState createState() => _EnlacesState();
}

class _EnlacesState extends State<Enlaces> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff19535f),
        appBar: AppBar(
          title: Text('Enlaces Prioritarios'),
        ),
       body: Container(
          child: Center(child: Column(
            children: <Widget>[
              Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: (){
                         launch('https://www.saludzac.gob.mx/home/');
                         //customLaunch('tel:' + data['oficina']);
                      },
                      child: Container(
                        height: ((MediaQuery.of(context).size.height) * .25),
                        width: ((MediaQuery.of(context).size.width)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [Color(0xfff0f3f5), Color(0xffffffff)],
                          ),
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width:
                                  ((MediaQuery.of(context).size.width) * .25),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0)),
                                color: Color(0xff0d2a31),
                              ),
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.globe,
                                  color: Color(0xfff0f3f5),
                                  size: 50.0,
                                ),
                              ),
                            ),
                            Container(
                              width:
                                  ((MediaQuery.of(context).size.width) * .60),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Text('Secretaría de Salud del Estado de Zacatecas',
                                            style: GoogleFonts.doHyeon(
                                                color: Color(0xff0d2a31),
                                                fontSize: 20.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        'Obten mas infromacion en el Sitio Web dando clic aquí',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Color(0xff0b7a75),
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                       onTap: (){
                         launch('tel:911');
                      },
                      child: Container(
                        height: ((MediaQuery.of(context).size.height) * .25),
                        width: ((MediaQuery.of(context).size.width)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [Color(0xfff0f3f5), Color(0xffffffff)],
                          ),
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width:
                                  ((MediaQuery.of(context).size.width) * .25),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0)),
                                color: Color(0xff0d2a31),
                              ),
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.ambulance,
                                  color: Color(0xfff0f3f5),
                                  size: 50.0,
                                ),
                              ),
                            ),
                            Container(
                              width:
                                  ((MediaQuery.of(context).size.width) * .60),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Text('Llame al 911',
                                            style: GoogleFonts.doHyeon(
                                                color: Color(0xff0d2a31),
                                                fontSize: 20.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5.0),
                                      child: Text(
                                        'Llame a emergencias dando clic aquí',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Color(0xff0b7a75),
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                       onTap: (){
                         launch('tel:8000044800');
                      },
                      child: Container(
                        height: ((MediaQuery.of(context).size.height) * .25),
                        width: ((MediaQuery.of(context).size.width)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [Color(0xfff0f3f5), Color(0xffffffff)],
                          ),
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width:
                                  ((MediaQuery.of(context).size.width) * .25),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0)),
                                color: Color(0xff0d2a31),
                              ),
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.phoneAlt,
                                  color: Color(0xfff0f3f5),
                                  size: 50.0,
                                ),
                              ),
                            ),
                            Container(
                              width:
                                  ((MediaQuery.of(context).size.width) * .60),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Text('Llame al 800-00-44-800',
                                            style: GoogleFonts.doHyeon(
                                                color: Color(0xff0d2a31),
                                                fontSize: 20.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        'Línea de Unidad de Intelegencia Epidemiológica. \nPara Llamar presione aquí',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Color(0xff0b7a75),
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
            ],
          )),
        ),
      
    );
  }
}
