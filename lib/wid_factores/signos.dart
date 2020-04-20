import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Signos extends StatefulWidget {
  @override
  _SignosState createState() => _SignosState();
}

class _SignosState extends State<Signos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff19535f),
        appBar: AppBar(
          title: Text('Signos y Síntomas'),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0)),
              //  color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    child: Container(
                      height: ((MediaQuery.of(context).size.height) * .25),
                      width: ((MediaQuery.of(context).size.width)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xfff0f3f5),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height:
                                ((MediaQuery.of(context).size.height) * .05),
                            decoration: BoxDecoration(
                              color: Color(0xff92140c),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                  'Atención Inmediata a Área de Urgencias',
                                  style: GoogleFonts.doHyeon(
                                      color: Color(0xfff0f3f5),
                                      fontSize: 18.0)),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width:
                                    ((MediaQuery.of(context).size.width) * .20),
                                height: ((MediaQuery.of(context).size.height) *
                                    .10),
                                decoration: BoxDecoration(
                                  color: Color(0xff0d2a31),
                                ),
                                child: Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.heartBroken,
                                    color: Color(0xfff0f3f5),
                                    size: 40.0,
                                  ),
                                ),
                              ),
                              Container(
                                width:
                                    ((MediaQuery.of(context).size.width) * .60),
                                height: ((MediaQuery.of(context).size.height) *
                                    .10),
                                color: Color(0xfff0f3f5),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 10.0),
                                          child: Text('Dolor Torácico.',
                                              style: GoogleFonts.doHyeon(
                                                  color: Color(0xff0d2a31),
                                                  fontSize: 20.0)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          'Sensación de opresión en el área del pecho',
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
                          Row(
                            children: <Widget>[
                              Container(
                                width:
                                    ((MediaQuery.of(context).size.width) * .20),
                                height: ((MediaQuery.of(context).size.height) *
                                    .10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10.0)),
                                  color: Color(0xff0d2a31),
                                ),
                                child: Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.lungs,
                                    color: Color(0xfff0f3f5),
                                    size: 40.0,
                                  ),
                                ),
                              ),
                              Container(
                                width:
                                    ((MediaQuery.of(context).size.width) * .60),
                                height: ((MediaQuery.of(context).size.height) *
                                    .10),
                                color: Color(0xfff0f3f5),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 10.0),
                                          child: Text('Dificultad Respiratoria',
                                              style: GoogleFonts.doHyeon(
                                                  color: Color(0xff0d2a31),
                                                  fontSize: 20.0)),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            'Sensación de falta de aire.',
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
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    child: Container(
                      height: ((MediaQuery.of(context).size.height)),
                      width: ((MediaQuery.of(context).size.width)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xfff0f3f5),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height:
                                ((MediaQuery.of(context).size.height) * .05),
                            decoration: BoxDecoration(
                              color: Color(0xff92140c),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                            ),
                            child: Center(
                              child: Text('Caso Sospechoso',
                                  style: GoogleFonts.doHyeon(
                                      color: Color(0xfff0f3f5),
                                      fontSize: 18.0)),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width:
                                    ((MediaQuery.of(context).size.width) * .20),
                                height: ((MediaQuery.of(context).size.height) *
                                    .05),
                                decoration: BoxDecoration(
                                  color: Color(0xffd7c9aa),
                                ),
                                child: Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.plus,
                                    color: Color(0xff0d2a31),
                                    size: 20.0,
                                  ),
                                ),
                              ),
                              Container(
                                width:
                                    ((MediaQuery.of(context).size.width) * .60),
                                height: ((MediaQuery.of(context).size.height) *
                                    .05),
                                color: Color(0xfff0f3f5),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 10.0),
                                          child: Text(
                                              'Al menos 2 de los siguientes:',
                                              style: GoogleFonts.doHyeon(
                                                  color: Color(0xff0d2a31),
                                                  fontSize: 17.0)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width:
                                    ((MediaQuery.of(context).size.width) * .20),
                                height: ((MediaQuery.of(context).size.height) *
                                    .08),
                                decoration: BoxDecoration(
                                  color: Color(0xff0d2a31),
                                ),
                                child: Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.thermometerEmpty,
                                    color: Color(0xfff0f3f5),
                                    size: 30.0,
                                  ),
                                ),
                              ),
                              Container(
                                width:
                                    ((MediaQuery.of(context).size.width) * .60),
                                height: ((MediaQuery.of(context).size.height) *
                                    .08),
                                color: Color(0xfff0f3f5),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 10.0),
                                          child: Text('Fiebre >38.3°C',
                                              style: GoogleFonts.doHyeon(
                                                  color: Color(0xff0d2a31),
                                                  fontSize: 20.0)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width:
                                    ((MediaQuery.of(context).size.width) * .20),
                                height: ((MediaQuery.of(context).size.height) *
                                    .08),
                                decoration: BoxDecoration(
                                  color: Color(0xff0d2a31),
                                ),
                                child: Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.solidFrown,
                                    color: Color(0xfff0f3f5),
                                    size: 30.0,
                                  ),
                                ),
                              ),
                              Container(
                                width:
                                    ((MediaQuery.of(context).size.width) * .60),
                                height: ((MediaQuery.of(context).size.height) *
                                    .08),
                                color: Color(0xfff0f3f5),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 10.0),
                                          child: Text('Dolor de Cabeza ',
                                              style: GoogleFonts.doHyeon(
                                                  color: Color(0xff0d2a31),
                                                  fontSize: 20.0)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width:
                                    ((MediaQuery.of(context).size.width) * .20),
                                height: ((MediaQuery.of(context).size.height) *
                                    .08),
                                decoration: BoxDecoration(
                                  color: Color(0xff0d2a31),
                                ),
                                child: Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.headSideCough,
                                    color: Color(0xfff0f3f5),
                                    size: 30.0,
                                  ),
                                ),
                              ),
                              Container(
                                width:
                                    ((MediaQuery.of(context).size.width) * .60),
                                height: ((MediaQuery.of(context).size.height) *
                                    .08),
                                color: Color(0xfff0f3f5),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 10.0),
                                          child: Text('Tos',
                                              style: GoogleFonts.doHyeon(
                                                  color: Color(0xff0d2a31),
                                                  fontSize: 20.0)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width:
                                    ((MediaQuery.of(context).size.width) * .20),
                                height: ((MediaQuery.of(context).size.height) *
                                    .05),
                                decoration: BoxDecoration(
                                  color: Color(0xffd7c9aa),
                                ),
                                child: Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.plus,
                                    color: Color(0xff0d2a31),
                                    size: 20.0,
                                  ),
                                ),
                              ),
                              Container(
                                width:
                                    ((MediaQuery.of(context).size.width) * .60),
                                height: ((MediaQuery.of(context).size.height) *
                                    .05),
                                color: Color(0xfff0f3f5),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 10.0),
                                          child: Text(
                                              'Al menos 1 de los siguientes:',
                                              style: GoogleFonts.doHyeon(
                                                  color: Color(0xff0d2a31),
                                                  fontSize: 17.0)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width:
                                    ((MediaQuery.of(context).size.width) * .20),
                                height: ((MediaQuery.of(context).size.height) *
                                    .08),
                                decoration: BoxDecoration(
                                  color: Color(0xff0d2a31),
                                ),
                                child: Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.walking,
                                    color: Color(0xfff0f3f5),
                                    size: 30.0,
                                  ),
                                ),
                              ),
                              Container(
                                width:
                                    ((MediaQuery.of(context).size.width) * .60),
                                height: ((MediaQuery.of(context).size.height) *
                                    .08),
                                color: Color(0xfff0f3f5),
                                child: Center(
                                  child: Stack(
                                    children: <Widget>[
                                      ListTile(
                                        title: Text('Mialgia:',
                                            style: GoogleFonts.doHyeon(
                                                color: Color(0xff0d2a31),
                                                fontSize: 18.0)),
                                        subtitle: Text('Dolor muscular',
                                            style: TextStyle(
                                                color: Color(0xff0d2a31),
                                                fontSize: 16.0)),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width:
                                    ((MediaQuery.of(context).size.width) * .20),
                                height: ((MediaQuery.of(context).size.height) *
                                    .08),
                                decoration: BoxDecoration(
                                  color: Color(0xff0d2a31),
                                ),
                                child: Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.solidHandSpock,
                                    color: Color(0xfff0f3f5),
                                    size: 30.0,
                                  ),
                                ),
                              ),
                              Container(
                                width:
                                    ((MediaQuery.of(context).size.width) * .60),
                                height: ((MediaQuery.of(context).size.height) *
                                    .08),
                                color: Color(0xfff0f3f5),
                                child: Center(
                                  child: Stack(
                                    children: <Widget>[
                                      ListTile(
                                        title: Text('Artralgia:',
                                            style: GoogleFonts.doHyeon(
                                                color: Color(0xff0d2a31),
                                                fontSize: 18.0)),
                                        subtitle: Text(
                                            'Dolor en articulaciones.',
                                            style: TextStyle(
                                                color: Color(0xff0d2a31),
                                                fontSize: 16.0)),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width:
                                    ((MediaQuery.of(context).size.width) * .20),
                                height: ((MediaQuery.of(context).size.height) *
                                    .08),
                                decoration: BoxDecoration(
                                  color: Color(0xff0d2a31),
                                ),
                                child: Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.fire,
                                    color: Color(0xfff0f3f5),
                                    size: 30.0,
                                  ),
                                ),
                              ),
                              Container(
                                width:
                                    ((MediaQuery.of(context).size.width) * .60),
                                height: ((MediaQuery.of(context).size.height) *
                                    .08),
                                color: Color(0xfff0f3f5),
                                child: Center(
                                  child: Stack(
                                    children: <Widget>[
                                      ListTile(
                                        title: Text('Odinofagia:',
                                            style: GoogleFonts.doHyeon(
                                                color: Color(0xff0d2a31),
                                                fontSize: 18.0)),
                                        subtitle: Text(
                                            'Dolor/ardor de garganta.',
                                            style: TextStyle(
                                                color: Color(0xff0d2a31),
                                                fontSize: 16.0)),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width:
                                    ((MediaQuery.of(context).size.width) * .20),
                                height: ((MediaQuery.of(context).size.height) *
                                    .08),
                                decoration: BoxDecoration(
                                  color: Color(0xff0d2a31),
                                ),
                                child: Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.boxTissue,
                                    color: Color(0xfff0f3f5),
                                    size: 30.0,
                                  ),
                                ),
                              ),
                              Container(
                                width:
                                    ((MediaQuery.of(context).size.width) * .60),
                                height: ((MediaQuery.of(context).size.height) *
                                    .08),
                                color: Color(0xfff0f3f5),
                                child: Center(
                                  child: Stack(
                                    children: <Widget>[
                                      ListTile(
                                        title: Text('Rinorrea:',
                                            style: GoogleFonts.doHyeon(
                                                color: Color(0xff0d2a31),
                                                fontSize: 18.0)),
                                        subtitle: Text('Escurrimiento nasal.',
                                            style: TextStyle(
                                                color: Color(0xff0d2a31),
                                                fontSize: 16.0)),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width:
                                    ((MediaQuery.of(context).size.width) * .20),
                                height: ((MediaQuery.of(context).size.height) *
                                    .08),
                                decoration: BoxDecoration(
                                  color: Color(0xff0d2a31),
                                ),
                                child: Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.eye,
                                    color: Color(0xfff0f3f5),
                                    size: 30.0,
                                  ),
                                ),
                              ),
                              Container(
                                width:
                                    ((MediaQuery.of(context).size.width) * .60),
                                height: ((MediaQuery.of(context).size.height) *
                                    .08),
                                color: Color(0xfff0f3f5),
                                child: Center(
                                  child: Stack(
                                    children: <Widget>[
                                      ListTile(
                                        title: Text('Conjuntivitis:',
                                            style: GoogleFonts.doHyeon(
                                                color: Color(0xff0d2a31),
                                                fontSize: 18.0)),
                                        subtitle: Text('Ojos rojos, llorosos.',
                                            style: TextStyle(
                                                color: Color(0xff0d2a31),
                                                fontSize: 16.0)),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width:
                                    ((MediaQuery.of(context).size.width) * .20),
                                height: ((MediaQuery.of(context).size.height) *
                                    .05),
                                decoration: BoxDecoration(
                                  color: Color(0xffd7c9aa),
                                ),
                                child: Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.plus,
                                    color: Color(0xff0d2a31),
                                    size: 20.0,
                                  ),
                                ),
                              ),
                              Container(
                                width:
                                    ((MediaQuery.of(context).size.width) * .60),
                                height: ((MediaQuery.of(context).size.height) *
                                    .05),
                                color: Color(0xfff0f3f5),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 10.0),
                                          child: Text(
                                              'Al menos 1 de los siguientes:',
                                              style: GoogleFonts.doHyeon(
                                                  color: Color(0xff0d2a31),
                                                  fontSize: 17.0)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width:
                                    ((MediaQuery.of(context).size.width) * .20),
                                height: ((MediaQuery.of(context).size.height) *
                                    .08),
                                decoration: BoxDecoration(
                                  color: Color(0xff0d2a31),
                                ),
                                child: Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.suitcaseRolling,
                                    color: Color(0xfff0f3f5),
                                    size: 30.0,
                                  ),
                                ),
                              ),
                              Container(
                                width:
                                    ((MediaQuery.of(context).size.width) * .70),
                                height: ((MediaQuery.of(context).size.height) *
                                    .08),
                                color: Color(0xfff0f3f5),
                                child: Center(
                                  child: Stack(
                                    children: <Widget>[
                                      ListTile(
                                        title: Text(
                                            'Viaje o estancia a países con transmisión local comunitaria de COVID-19.',
                                            style: TextStyle(
                                                color: Color(0xff0d2a31),
                                                fontSize: 14.0)),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width:
                                    ((MediaQuery.of(context).size.width) * .20),
                                height: ((MediaQuery.of(context).size.height) *
                                    .08),
                                decoration: BoxDecoration(
                                  color: Color(0xff0d2a31),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10.0),
                                  ),
                                ),
                                child: Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.users,
                                    color: Color(0xfff0f3f5),
                                    size: 30.0,
                                  ),
                                ),
                              ),
                              Container(
                                width:
                                    ((MediaQuery.of(context).size.width) * .70),
                                height: ((MediaQuery.of(context).size.height) *
                                    .08),
                                color: Color(0xfff0f3f5),
                                child: Center(
                                  child: Stack(
                                    children: <Widget>[
                                      ListTile(
                                        title: Text(
                                            'Haber estado en contacto con un caso confirmado o bajo investigación a COVID-19.',
                                            style: TextStyle(
                                                color: Color(0xff0d2a31),
                                                fontSize: 14.0)),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
