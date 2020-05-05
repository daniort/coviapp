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
      backgroundColor: Color(0xffdadad9),
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
                         launch('tel:911');
                      },
                      child: Container(
                        height: ((MediaQuery.of(context).size.height) * .15),
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
                                color: Color(0xff38786a),
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
                                                color: Color(0xff38786a),
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
                        height: ((MediaQuery.of(context).size.height) * .15),
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
                                color: Color(0xff38786a),
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
                                                color: Color(0xff38786a),
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

                   Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: (){
                         launch('https://www.paho.org/mex/');
                         //customLaunch('tel:' + data['oficina']);
                      },
                      child: Container(
                        height: ((MediaQuery.of(context).size.height) * .15),
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
                                color: Color(0xff38786a),
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
                                        child: Text('Organización Panamericana de la Salud en México',
                                            style: TextStyle(
                                                color: Color(0xff38786a),
                                                fontSize: 17.0,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        'Obten más información en el Sitio Web dando clic aquí',
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
                         launch('https://ddi.sutd.edu.sg/portfolio/items/448588');
                         //customLaunch('tel:' + data['oficina']);
                      },
                      child: Container(
                        height: ((MediaQuery.of(context).size.height) * .15),
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
                                color: Color(0xff38786a),
                              ),
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.signal,
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
                                        child: Text('Monitoreo predictivo de COVID-19',
                                            style: TextStyle(
                                                color: Color(0xff38786a),
                                                fontSize: 17.0,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),

                                     Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                          child: Text(
                                        'Para ir a la gráfica da clic aquí',
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
                      onTap: (){
                         launch('https://www.arcgis.com/apps/opsdashboard/index.html#/85320e2ea5424dfaaa75ae62e5c06e61');
                      
                      },
                      child: Container(
                        height: ((MediaQuery.of(context).size.height) * .15),
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
                                color: Color(0xff38786a),
                              ),
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.chartPie,
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
                                        child: Text('Conteo Global de COVID-19',
                                            style: TextStyle(
                                                color: Color(0xff38786a),
                                                fontSize: 17.0,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),

                                     Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                          child: Text(
                                        'Para ir a la web da clic aquí',
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
            ],
          )),
        ),
      
    );
  }
}
