import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Recomendaciones extends StatefulWidget {
  @override
  _RecomendacionesState createState() => _RecomendacionesState();
}

class _RecomendacionesState extends State<Recomendaciones> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdadad9),
      appBar: AppBar(
        title: Text('Recomendaciones'),
      ),
      body: Container(
        child: Center(
            child: Column(
          children: <Widget>[
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
                        width: ((MediaQuery.of(context).size.width) * .20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0)),
                          color: Color(0xff38786a),
                        ),
                        child: Center(
                          child: FaIcon(
                            FontAwesomeIcons.bell,
                            color: Color(0xfff0f3f5),
                            size: 50.0,
                          ),
                        ),
                      ),
                      Container(
                        width: ((MediaQuery.of(context).size.width) * .60),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text('Notificación Inmediata',
                                      style: GoogleFonts.doHyeon(
                                          color: Color(0xff38786a),
                                          fontSize: 20.0)),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                                              child: Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    'Ayuda a frenar el coronavirus',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color(0xff0b7a75),
                                      fontSize: 12.0,
                                    ),
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
                onTap: () {
                  launch('https://covid-19.cozcyt.gob.mx/prevencion/');
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
                        width: ((MediaQuery.of(context).size.width) * .20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0)),
                          color: Color(0xff38786a),
                        ),
                        child: Center(
                          child: FaIcon(
                            FontAwesomeIcons.houseUser,
                            color: Color(0xfff0f3f5),
                            size: 50.0,
                          ),
                        ),
                      ),
                      Container(
                        width: ((MediaQuery.of(context).size.width) * .60),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text('No Salgas de Casa',
                                      style: GoogleFonts.doHyeon(
                                          color: Color(0xff38786a),
                                          fontSize: 20.0)),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    'Ayuda a frenar el coronavirus',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color(0xff0b7a75),
                                      fontSize: 12.0,
                                    ),
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
                onTap: () {
                  launch('https://www.who.int/es/emergencies/diseases/novel-coronavirus-2019/advice-for-public');
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
                        width: ((MediaQuery.of(context).size.width) * .20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0)),
                          color: Color(0xff38786a),
                        ),
                        child: Center(
                          child: FaIcon(
                            FontAwesomeIcons.handsWash,
                            color: Color(0xfff0f3f5),
                            size: 50.0,
                          ),
                        ),
                      ),
                      Container(
                        width: ((MediaQuery.of(context).size.width) * .60),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text('Medidas de Higiene',
                                      style: GoogleFonts.doHyeon(
                                          color: Color(0xff38786a),
                                          fontSize: 20.0)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Text(
                                  'Informate sobre las medidas de Higiene aquí',
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
