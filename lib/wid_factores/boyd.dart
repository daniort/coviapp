import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Noticias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0)),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 15,
            child: Container(
              width: ((MediaQuery.of(context).size.width)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0)),
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
                              ),
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.inbox,
                                  color: Color(0xff19535f),
                                  size: 30.0,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text('Información Reciente',
                                    style: GoogleFonts.doHyeon(
                                        color: Color(0xff19535f),
                                        fontSize: 20.0)),
                              ),
                            ),
                          ],
                        ),
                      )),
                  Expanded(
                    flex: 7,
                    child: Container(
                      width: ((MediaQuery.of(context).size.width)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30.0),
                        ),
                        color: Color(0xff19535f),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: ((MediaQuery.of(context).size.height)),
                            width: ((MediaQuery.of(context).size.width)),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30.0)),
                            ),
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(200.0)),
                                child: Image.network(
                                  'https://www.gob.mx/cms/uploads/image/file/571435/Documento-Definitivo-Distritos-de-Salud-_1_-1.jpg',
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: InkWell(
                              child: Container(
                                height: ((MediaQuery.of(context).size.height) *
                                    .15),
                                width: ((MediaQuery.of(context).size.width)),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(13, 42, 49, 0.90),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30.0)),
                                ),
                                child: ListTile(
                                  title: Text(
                                      'CONFIRMA SECTOR SALUD ESTATAL OTROS TRES CASOS POSITIVOS DE CORONAVIRUS EN ZACATECAS',
                                      style: GoogleFonts.doHyeon(
                                          color: Color(0xfff0f3f5),
                                          fontSize: 17.0)),
                                  subtitle: Text('Leer Más...',
                                      style: GoogleFonts.doHyeon(
                                          color: Color(0xfff0f3f9),
                                          fontSize: 15.0)),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
