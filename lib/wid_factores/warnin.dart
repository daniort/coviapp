import 'package:covi/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Warnin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff0d2a31),
        borderRadius: BorderRadius.circular(30.0),
      ),
      width: MediaQuery.of(context).size.width,
      height: (MediaQuery.of(context).size.height) * 0.53,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Center(
                child: Text(
                  'Resultado',
                  style: GoogleFonts.doHyeon(
                      color: Color(0xffffffff), fontSize: 20.0),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFffffff),
              child: Center(
                child: Container(
                  //width: queryData.size.width * 0.75,
                  width: MediaQuery.of(context).size.width * 0.75,

                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            'Cuidate',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff0d2a31), fontSize: 18.0),
                          ),
                        ),
                        Text(
                          'Los signos no son de la enfermedad Covid-19',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xff0d2a31), fontSize: 15.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              color: Color(0xffd7c9aa),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      child: Container(
                        height: ((MediaQuery.of(context).size.height) * .10),
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
                                  ((MediaQuery.of(context).size.width) * .20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0)),
                                color: Color(0xff0d2a31),
                              ),
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.home,
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
                                        child: Text('Quedate en Casa',
                                            style: GoogleFonts.doHyeon(
                                                color: Color(0xff0d2a31),
                                                fontSize: 18.0)),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          'Ayuda a combatir el Coronavirus',
                                          style: TextStyle(
                                            color: Color(0xff136f63),
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
                        print('recomendaciones');
                      },
                      child: Container(
                        height: ((MediaQuery.of(context).size.height) * .10),
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
                                  ((MediaQuery.of(context).size.width) * .20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0)),
                                color: Color(0xff0d2a31),
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
                                        child: Text('Recomendaciones',
                                            style: GoogleFonts.doHyeon(
                                                color: Color(0xff0d2a31),
                                                fontSize: 18.0)),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          'Para ver las recomendaciones presiona aquí.',
                                          style: TextStyle(
                                            color: Color(0xff136f63),
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
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () => {
                Navigator.pop(context),
                Navigator.pop(context),
              
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xff0d2a31),
                ),
                child: Center(
                  child: Text(
                    'Aceptar y Salir',
                    style: GoogleFonts.doHyeon(
                        color: Color(0xffffffff), fontSize: 20.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Urgencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff92140c),
        borderRadius: BorderRadius.circular(30.0),
      ),
      width: MediaQuery.of(context).size.width,
      height: (MediaQuery.of(context).size.height) * 0.56,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Center(
                child: Text(
                  'Resultado',
                  style: GoogleFonts.doHyeon(
                      color: Color(0xffffffff), fontSize: 20.0),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFffffff),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'Atención Inmediata',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff0d2a31), fontSize: 18.0),
                          ),
                        ),
                        Text(
                          'Se le recomienda atención inmediata a Área de Urgencias.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xff0d2a31), fontSize: 15.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              color: Color(0xffd7c9aa),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        launch('tel:911');
                      },
                      child: Container(
                        height: ((MediaQuery.of(context).size.height) * .10),
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
                                  ((MediaQuery.of(context).size.width) * .20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0)),
                                color: Color(0xff92140c),
                              ),
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.phoneSquare,
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
                                                fontSize: 18.0)),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          'Para llamar puede presionar aquí',
                                          style: TextStyle(
                                            //backgroundColor: Colors.purple,
                                            color: Color(0xff5b2333),
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
                        launch('tel:8000044800');
                      },
                      child: Container(
                        height: ((MediaQuery.of(context).size.height) * .12),
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
                                  ((MediaQuery.of(context).size.width) * .20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0)),
                                color: Color(0xff92140c),
                              ),
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.phoneSquare,
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
                                                fontSize: 18.0)),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          'Línea de Unidad de Intelegencia Epidemiológica. \nPara Llamar presione aquí',
                                          style: TextStyle(
                                            //backgroundColor: Colors.purple,
                                            color: Color(0xff5b2333),
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
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () => {
                Navigator.pop(context),
                Navigator.pop(context),
               // Navigator.push(
                 // context,
                  //MaterialPageRoute(
//    builder: (context) => MyHomePage(),
                  //),
                //),
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xff0d2a31),
                ),
                child: Center(
                  child: Text(
                    'Aceptar y Salir',
                    style: GoogleFonts.doHyeon(
                        color: Color(0xffffffff), fontSize: 20.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Sospecha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff92140c),
        borderRadius: BorderRadius.circular(30.0),
      ),
      width: MediaQuery.of(context).size.width,
      height: (MediaQuery.of(context).size.height) * 0.56,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Center(
                child: Text(
                  'Resultado',
                  style: GoogleFonts.doHyeon(
                      color: Color(0xffffffff), fontSize: 20.0),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFffffff),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            'Sospechoso',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff0d2a31), fontSize: 18.0),
                          ),
                        ),
                        Text(
                          'Se le recomienda llamar a Urgencias o acudir al centro médico mas cercano.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xff0d2a31), fontSize: 15.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              color: Color(0xffd7c9aa),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        launch('tel:911');
                      },
                      child: Container(
                        height: ((MediaQuery.of(context).size.height) * .10),
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
                                  ((MediaQuery.of(context).size.width) * .20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0)),
                                color: Color(0xff92140c),
                              ),
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.phoneSquare,
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
                                                fontSize: 18.0)),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          'Para llamar puede presionar aquí',
                                          style: TextStyle(
                                            //backgroundColor: Colors.purple,
                                            color: Color(0xff5b2333),
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
                        launch('tel:8000044800');
                      },
                      child: Container(
                        height: ((MediaQuery.of(context).size.height) * .12),
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
                                  ((MediaQuery.of(context).size.width) * .20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0)),
                                color: Color(0xff92140c),
                              ),
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.phoneSquare,
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
                                                fontSize: 18.0)),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          'Línea de Unidad de Intelegencia Epidemiológica. \nPara Llamar presione aquí',
                                          style: TextStyle(
                                            //backgroundColor: Colors.purple,
                                            color: Color(0xff5b2333),
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
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () => {
                 Navigator.pop(context),
                Navigator.pop(context),
              
                
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xff0d2a31),
                ),
                child: Center(
                  child: Text(
                    'Aceptar y Salir',
                    style: GoogleFonts.doHyeon(
                        color: Color(0xffffffff), fontSize: 20.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
