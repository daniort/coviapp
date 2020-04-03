
import 'package:covi/menu_lateral/menu_wid.dart';
import 'package:covi/wid_factores/boyd.dart';
import 'package:covi/wid_factores/enlaces.dart';
import 'package:covi/wid_factores/factores.dart';
import 'package:covi/wid_factores/recomendaciones.dart';
import 'package:covi/wid_factores/signos.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff0d2a31),
        secondaryHeaderColor: Color(0xff38786a),
        accentColor: Colors.green,
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff19535f),
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: Text('Covid Report'),
                //backgroundColor:  Color(0xff19535f),
                expandedHeight: 200.0,
                floating: true,
                pinned: true,
                snap: false,
                flexibleSpace: FlexibleSpaceBar(
                    stretchModes: <StretchMode>[
                      StretchMode.zoomBackground,
                      StretchMode.blurBackground,
                      StretchMode.fadeTitle,
                    ],
                    //title: Text('Covid Report'),
                    centerTitle: false,
                    background: Image.network(
                      "https://image.freepik.com/free-photo/3d-render-conceptual-pandemic-epidemic-virus-medical-health-vaccine-research-microscopic-magnification-green-corona-virus-2019-ncov-outbreak-forms-like-sars-mers-can-be-lethal_166094-85.jpg",
                      fit: BoxFit.cover,
                    )),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Factores(),
                          ),
                        ),
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
                                  ((MediaQuery.of(context).size.width) * .20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0)),
                                color: Color(0xff0d2a31),
                              ),
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.exclamation,
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
                                        child: Text('Factores de Riesgo',
                                            style: GoogleFonts.doHyeon(
                                                color: Color(0xff0d2a31),
                                                fontSize: 20.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        'Informate sobre los factores de Riesgo aquí',
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
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Signos(),
                          ),
                        ),
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
                                  ((MediaQuery.of(context).size.width) * .20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0)),
                                color: Color(0xff0d2a31),
                              ),
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.headSideVirus,
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
                                        child: Text('Signos y Síntomas',
                                            style: GoogleFonts.doHyeon(
                                                color: Color(0xff0d2a31),
                                                fontSize: 20.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        'Informate sobre como identificar Signos y Síntomas aquí',
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
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Recomendaciones(),
                          ),
                        ),
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
                                  ((MediaQuery.of(context).size.width) * .20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0)),
                                color: Color(0xff0d2a31),
                              ),
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.stream,
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
                                                fontSize: 20.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        'Informate sobre lo que debes hacer auí',
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
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Enlaces(),
                          ),
                        ),
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
                                  ((MediaQuery.of(context).size.width) * .20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0)),
                                color: Color(0xff0d2a31),
                              ),
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.mobileAlt,
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
                                        child: Text('Enlaces Prioritarios',
                                            style: GoogleFonts.doHyeon(
                                                color: Color(0xff0d2a31),
                                                fontSize: 20.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        'Enlaces que te pueden ayudar e informar aquí',
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
<<<<<<< HEAD
                ),
              ]),
            )
          ];
        },
        body: Noticias(),
      ),
=======
                ]),
              )
            ];
          },
          body: Container(
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
                    padding:
                        EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
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
                                        ((MediaQuery.of(context).size.width) *
                                            .20),
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
                            child: Center(
                                child: Text(
                              'data',
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
>>>>>>> 2a1617b0ca4a29dca4d15da7610f23e58fa6a6e6
      drawer: Menu(),
    );
  }
}
