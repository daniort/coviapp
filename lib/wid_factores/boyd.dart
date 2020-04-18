import 'package:covi/wid_factores/saveImagen.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:io';

class Noticias extends StatefulWidget {
  @override
  _NoticiasState createState() => _NoticiasState();
}

class _NoticiasState extends State<Noticias> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
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
                      child: StreamBuilder<QuerySnapshot>(
                        stream: Firestore.instance
                            .collection('noticias')
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError)
                            return Text('Error: ${snapshot.error}');
                          if (snapshot.connectionState ==
                              ConnectionState.active) {
                            List<DocumentSnapshot> docs =
                                snapshot.data.documents;

                            return Carousel(
                              dotBgColor: Color(0xff0d2a31),
                              animationDuration:
                                  const Duration(milliseconds: 2050),
                              images: [
                                for (var item in docs)
                                  Stack(
                                    children: <Widget>[
                                      new Container(
                                        height: ((MediaQuery.of(context)
                                            .size
                                            .height)),
                                        width: ((MediaQuery.of(context)
                                            .size
                                            .width)),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(30.0)),
                                        ),
                                        child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: ClipRRect(
                                            child: FutureBuilder(
                                              future: getImage(
                                                  context, item['imagen']),
                                              builder: (context, snapshot) {
                                                if (snapshot.connectionState ==
                                                    ConnectionState.done)
                                                  return snapshot.data;
                                                if (snapshot.connectionState ==
                                                    ConnectionState.waiting)
                                                  return Image.asset(
                                                      "lib/assets/images/3664282.png");
                                                return CircularProgressIndicator();
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: new InkWell(
                                          onTap: () => {
                                            showModalBottomSheet(
                                                backgroundColor: Color.fromRGBO(
                                                    0, 0, 0, 0.0),
                                                context: context,
                                                isScrollControlled: true,
                                                builder: (context) {
                                                  var _t = item['titulo'] + " ";
                                                  var _s =
                                                      item['subtitulo'] + " ";
                                                  var _f = item['fecha'] + " ";
                                                  var _c = item['cuerpo'] + " ";
                                                  return Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(
                                                                      30.0)),
                                                      color: Color.fromRGBO(
                                                          13, 42, 49, 0.99),
                                                    ),
                                                    width: queryData.size.width,
                                                    height:
                                                        ((MediaQuery.of(context)
                                                                .size
                                                                .height) *
                                                            0.78),
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        children: <Widget>[
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 8.0,
                                                                    top: 8.0),
                                                            child: Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Container(
                                                                width: ((MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width) *
                                                                    0.90),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius.only(
                                                                          topRight:
                                                                              Radius.circular(30.0)),
                                                                ),
                                                                child: Text(
                                                                    "$_t",
                                                                    style: GoogleFonts.doHyeon(
                                                                        color: Color(
                                                                            0xfff0f3f5),
                                                                        fontSize:
                                                                            17.0)),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 8.0),
                                                            child: Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius.only(
                                                                          topRight:
                                                                              Radius.circular(30.0)),
                                                                ),
                                                                child: Text(
                                                                    '$_s',
                                                                    style: GoogleFonts.doHyeon(
                                                                        color: Color(
                                                                            0xfff0f3f5),
                                                                        fontSize:
                                                                            15.0)),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 8.0),
                                                            child: Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius.only(
                                                                          topRight:
                                                                              Radius.circular(30.0)),
                                                                ),
                                                                child: Text(
                                                                    'Publicado: $_f',
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xfff0f3f5),
                                                                        fontSize:
                                                                            10.0)),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 10.0,
                                                                    top: 8.0,
                                                                    right:
                                                                        10.0),
                                                            child: Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius.only(
                                                                          topRight:
                                                                              Radius.circular(30.0)),
                                                                ),
                                                                child: Text(
                                                                    '$_c',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .justify,
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xfff0f3f5),
                                                                      fontSize:
                                                                          14.0,
                                                                    )),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 10.0,
                                                                    top: 8.0,
                                                                    right:
                                                                        10.0),
                                                            child: Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: InkWell(
                                                                onTap: () {
                                                                  try {
                                                                    SaveFile()
                                                                        .save(item[
                                                                            'imagen']);
                                                                    //ALERT
                                                                    showModalBottomSheet(
                                                                        backgroundColor: Color.fromRGBO(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        context:
                                                                            context,
                                                                        isScrollControlled:
                                                                            true,
                                                                        builder:
                                                                            (context) {
                                                                          return Padding(
                                                                              padding: const EdgeInsets.only(top: 8.0, bottom: 30.0, left: 70.0, right: 70.0),
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: Color.fromRGBO(0, 0, 0, 0.5),
                                                                                  borderRadius: BorderRadius.circular(5),
                                                                                ),
                                                                                width: 20,
                                                                                height: MediaQuery.of(context).size.height * 0.05,
                                                                                child: Center(
                                                                                  child: Text(
                                                                                    'Imagen Guardada',
                                                                                    style: TextStyle(
                                                                                      color: Color(0xff0d2a31),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ));
                                                                        });
                                                                  } on Error catch (e) {
                                                                    print(
                                                                        'Error has occured while saving');
                                                                    throw 'Error has occured while saving';
                                                                  }
                                                                },
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.only(
                                                                            topRight:
                                                                                Radius.circular(30.0)),
                                                                  ),
                                                                  child: Text(
                                                                      'Descargar Imagen...',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .justify,
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .blue,
                                                                        fontSize:
                                                                            14.0,
                                                                      )),
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                }),
                                          },
                                          child: Container(
                                            height: ((MediaQuery.of(context)
                                                    .size
                                                    .height) *
                                                .23),
                                            width: ((MediaQuery.of(context)
                                                .size
                                                .width)),
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  13, 42, 49, 0.90),
                                              borderRadius: BorderRadius.only(
                                                  topRight:
                                                      Radius.circular(30.0)),
                                            ),
                                            child: ListTile(
                                              title: Text(item['titulo'],
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
                                      ),
                                    ],
                                  ),
                              ],
                            );
                          }
                        },
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

Future<Widget> getImage(BuildContext context, String item) async {
  Image m;
  if (item != null) {
    var path = "noticias/$item";
    final ref = FirebaseStorage.instance.ref().child('$path');
    var url = await ref.getDownloadURL();
    m = Image.network(url.toString());
  } else {
    m = Image.asset("lib/assets/images/3664282.png");
  }
  return m;
}

class FireStorageService extends ChangeNotifier {
  FireStorageService._();
  FireStorageService();
  static Future<dynamic> loadImage(BuildContext context, String image) {
    throw ("Platform not found");
  }
}
