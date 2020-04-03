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
                              onTap: () => {
                                showModalBottomSheet(
                                    //elevation: (queryData.size.height) * 0.8,
                                    backgroundColor:
                                        Color.fromRGBO(0, 0, 0, 0.0),
                                    //shape:
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return ModalNoti();
                                    }),
                              },
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

class ModalNoti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(30.0)),
        color: Color.fromRGBO(13, 42, 49, 0.99),
      ),
      //color: Colors.amber),
      width: queryData.size.width,
      height: ((MediaQuery.of(context).size.height) * 0.78),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: ((MediaQuery.of(context).size.width) * 0.90),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(30.0)),
                  ),
                  child: Text(
                      'CONFIRMA SECTOR SALUD ESTATAL OTROS TRES CASOS POSITIVOS DE CORONAVIRUS EN ZACATECAS',
                      style: GoogleFonts.doHyeon(
                          color: Color(0xfff0f3f5), fontSize: 17.0)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(30.0)),
                  ),
                  child: Text('La propuesta metodológica y operativa',
                      style: GoogleFonts.doHyeon(
                          color: Color(0xfff0f3f5), fontSize: 15.0)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(30.0)),
                  ),
                  child: Text('Publicado: 12/04/2020',
                      style:
                          TextStyle(color: Color(0xfff0f3f5), fontSize: 10.0)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 8.0, right: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(30.0)),
                  ),
                  child: Text(
                      "Se presenta una propuesta metodológico-operativa para establecer el modelo de atención de la Cuarta Transformación –Atención Primaria de Salud Integral e Integrado México (APS-I Mx)— en las entidades federativas. Se describe en qué consiste la APS-I y su trayectoria histórica durante cuatro décadas y alinea la actual versión mexicana con el documento de la Comisión de Alto Nivel de la Organización Panamericana de la Salud (OPS). \n\nLos resultados del levantamiento junto con el trabajo del grupo interinstitucional para la transformación del Primer Nivel de Atención (PNA) llevan a proponer el establecimiento de Distritos de Salud (DS) en sustitución de las jurisdicciones sanitarias. \n\nDa clik en la imagen o descárgalo en http://bit.ly/2v7pCVc",
                      textAlign: TextAlign.justify,
                      style: TextStyle(                        
                        color: Color(0xfff0f3f5),
                        fontSize: 14.0,
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
