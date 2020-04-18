import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covi/bloc/autenticacion_bloc/bloc.dart';
import 'package:covi/bloc/simple_bloc_delegate.dart';
import 'package:covi/menu_lateral/menu_wid.dart';
import 'package:covi/bloc/registro/eserepo.dart';
import 'package:covi/wid_factores/enlaces.dart';
import 'package:covi/wid_factores/factores.dart';
import 'package:covi/wid_factores/recomendaciones.dart';
import 'package:covi/wid_factores/saveImagen.dart';
import 'package:covi/wid_factores/signos.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();

  final UserRepository userRepository = UserRepository();
  runApp(BlocProvider(
    create: (context) =>
        AuthenticationBloc(userRepository: userRepository)..add(AppStarted()),
    child: MyApp(userRepository: userRepository),
  ));
}

class MyApp extends StatelessWidget {
  final UserRepository _userRepository;
  MyApp({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);
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
      home: MyHomePage(
          title: 'Flutter Demo Home Page', userRepository: _userRepository),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final UserRepository _userRepository;
  MyHomePage({UserRepository userRepository, this.title})
      : _userRepository = userRepository;

  final String title;

  @override
  _MyHomePageState createState() =>
      _MyHomePageState(userRepository: _userRepository);
}

final _scaffoldKe = GlobalKey<ScaffoldState>();

class _MyHomePageState extends State<MyHomePage> {
  final UserRepository _userRepository;

  _MyHomePageState({Key key, @required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      key: _scaffoldKe,
      backgroundColor: Color(0xff19535f),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Text('Covid Report'),
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
                      showModalBottomSheet(
                          backgroundColor: Color.fromRGBO(0, 0, 0, 0),
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return LoginScreen(userRepository: _userRepository);
                          }),
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
                            width: ((MediaQuery.of(context).size.width) * .20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0)),
                              color: Color(0xff0d2a31),
                            ),
                            child: Center(
                              child: FaIcon(
                                FontAwesomeIcons.list,
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
                                      child: Text('Encuesta',
                                          style: GoogleFonts.doHyeon(
                                              color: Color(0xff0d2a31),
                                              fontSize: 20.0)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      'Contesta una encuesta para poder tener una idea de nuestro habitantes',
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
                          builder: (context) => Factores(),
                        ),
                      ),
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
                            width: ((MediaQuery.of(context).size.width) * .20),
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
                                size: 30.0,
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
                                      child: Text('Factores de Riesgo',
                                          style: GoogleFonts.doHyeon(
                                              color: Color(0xff0d2a31),
                                              fontSize: 18.0)),
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
                            width: ((MediaQuery.of(context).size.width) * .20),
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
                                size: 30.0,
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
                                      child: Text('Signos y Síntomas',
                                          style: GoogleFonts.doHyeon(
                                              color: Color(0xff0d2a31),
                                              fontSize: 18.0)),
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
                            width: ((MediaQuery.of(context).size.width) * .20),
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
                                size: 30.0,
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
                                      child: Text('Recomendaciones',
                                          style: GoogleFonts.doHyeon(
                                              color: Color(0xff0d2a31),
                                              fontSize: 18.0)),
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
                            width: ((MediaQuery.of(context).size.width) * .20),
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
                                size: 30.0,
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
                                      child: Text('Enlaces Prioritarios',
                                          style: GoogleFonts.doHyeon(
                                              color: Color(0xff0d2a31),
                                              fontSize: 18.0)),
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
                                  width: ((MediaQuery.of(context).size.width) *
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
                                                  topRight:
                                                      Radius.circular(30.0)),
                                            ),
                                            child: FittedBox(
                                              fit: BoxFit.contain,
                                              child: ClipRRect(
                                                child: FutureBuilder(
                                                  future: getImage(
                                                      context, item['imagen']),
                                                  builder: (context, snapshot) {
                                                    if (snapshot
                                                            .connectionState ==
                                                        ConnectionState.done)
                                                      return snapshot.data;
                                                    if (snapshot
                                                            .connectionState ==
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
                                                    backgroundColor:
                                                        Color.fromRGBO(
                                                            0, 0, 0, 0.0),
                                                    context: context,
                                                    isScrollControlled: true,
                                                    builder: (context) {
                                                      var _t =
                                                          item['titulo'] + " ";
                                                      var _s =
                                                          item['subtitulo'] +
                                                              " ";
                                                      var _f =
                                                          item['fecha'] + " ";
                                                      var _c =
                                                          item['cuerpo'] + " ";
                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topRight: Radius
                                                                      .circular(
                                                                          30.0)),
                                                          color: Color.fromRGBO(
                                                              13, 42, 49, 0.99),
                                                        ),
                                                        width: queryData
                                                            .size.width,
                                                        height: ((MediaQuery.of(
                                                                    context)
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
                                                                        left:
                                                                            8.0,
                                                                        top:
                                                                            8.0),
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  child:
                                                                      Container(
                                                                    width: ((MediaQuery.of(context)
                                                                            .size
                                                                            .width) *
                                                                        0.90),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.only(
                                                                              topRight: Radius.circular(30.0)),
                                                                    ),
                                                                    child: Text(
                                                                        "$_t",
                                                                        style: GoogleFonts.doHyeon(
                                                                            color:
                                                                                Color(0xfff0f3f5),
                                                                            fontSize: 17.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            8.0),
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.only(
                                                                              topRight: Radius.circular(30.0)),
                                                                    ),
                                                                    child: Text(
                                                                        '$_s',
                                                                        style: GoogleFonts.doHyeon(
                                                                            color:
                                                                                Color(0xfff0f3f5),
                                                                            fontSize: 15.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            8.0),
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.only(
                                                                              topRight: Radius.circular(30.0)),
                                                                    ),
                                                                    child: Text(
                                                                        'Publicado: $_f',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Color(0xfff0f3f5),
                                                                            fontSize: 10.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                        .only(
                                                                    left: 10.0,
                                                                    top: 8.0,
                                                                    right:
                                                                        10.0),
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.only(
                                                                              topRight: Radius.circular(30.0)),
                                                                    ),
                                                                    child: Text(
                                                                        '$_c',
                                                                        textAlign:
                                                                            TextAlign
                                                                                .justify,
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Color(0xfff0f3f5),
                                                                          fontSize:
                                                                              14.0,
                                                                        )),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                        .only(
                                                                    left: 10.0,
                                                                    top: 8.0,
                                                                    right:
                                                                        10.0),
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  child:
                                                                      InkWell(
                                                                    onTap: () {
                                                                      try {
                                                                        Navigator.pop(
                                                                            context);
                                                                        _scaffoldKe
                                                                            .currentState
                                                                            .showSnackBar(SnackBar(
                                                                          content:
                                                                              Text('Imagen Guardada en el Dispositivo'),
                                                                          duration:
                                                                              Duration(milliseconds: 1500),
                                                                          backgroundColor:
                                                                              Color(0xff0d0d0d),
                                                                        ));
                                                                      } on Error catch (e) {
                                                                        print(
                                                                            'Error has occured while saving');
                                                                        //row 'Error has occured while saving';
                                                                      }
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.only(topRight: Radius.circular(30.0)),
                                                                      ),
                                                                      child: Text(
                                                                          'Descargar Imagen...',
                                                                          textAlign: TextAlign
                                                                              .justify,
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.blue,
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
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  30.0)),
                                                ),
                                                child: ListTile(
                                                  title: Text(item['titulo'],
                                                      style:
                                                          GoogleFonts.doHyeon(
                                                              color: Color(
                                                                  0xfff0f3f5),
                                                              fontSize: 17.0)),
                                                  subtitle: Text('Leer Más...',
                                                      style:
                                                          GoogleFonts.doHyeon(
                                                              color: Color(
                                                                  0xfff0f3f9),
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
        ),
      ),
      drawer: Menu(
        userRepository: _userRepository,
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
