import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:covi/wid_factores/enlaces.dart';
import 'package:covi/wid_factores/factores.dart';
import 'package:covi/wid_factores/form.dart';
import 'package:covi/wid_factores/info.dart';
import 'package:covi/wid_factores/recomendaciones.dart';
import 'package:covi/wid_factores/saveImagen.dart';
import 'package:covi/wid_factores/signos.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COVID AutoDx',
      theme: ThemeData(
          //primaryColor: Color(0xffED6A5A),
          primaryColor: Color(0xff212D40),
          //secondaryHeaderColor: Color(0xffca3c25),
          appBarTheme: AppBarTheme(
            color: Color(0xffED6A5A),
          )),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

final _scaffoldKe = GlobalKey<ScaffoldState>();

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _nameController;
  String nombre;
  String correo;

  void initState() {
    _passwordController = TextEditingController();
    _emailController = TextEditingController();
    _nameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      key: _scaffoldKe,
      backgroundColor: Color(0xffdadad9),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Text('COVID AutoDx'),
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
                background: Image.asset(
                  "lib/assets/images/3703626.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () => {
                      if (nombre == null)
                        {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (context) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xffe3e3e3),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                    ),
                                  ),
                                  height: (MediaQuery.of(context).size.height) *
                                      0.95,
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Form(
                                      child: ListView(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              child: Center(
                                                child: Text(
                                                  'Iniciar sesión',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.blueGrey,
                                                      fontSize: 20),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border(
                                                  top: BorderSide(
                                                      color: Colors.grey)),
                                            ),
                                          ),
                                          TextField(
                                            controller: _emailController,
                                            maxLength: 30,
                                            decoration: InputDecoration(
                                                icon: Icon(Icons.email),
                                                labelText: 'Email'),
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            //autovalidate: true,
                                            autocorrect: false,
                                          ),
                                          TextField(
                                            controller: _passwordController,
                                            maxLength: 10,
                                            decoration: InputDecoration(
                                                icon: Icon(Icons.lock),
                                                labelText: 'Contraseña'),
                                            obscureText: true,
                                            //autovalidate: true,
                                            autocorrect: false,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: <Widget>[
                                                Container(
                                                  child: RaisedButton(
                                                    color: Color(0xffd7c9aa),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.0),
                                                    ),
                                                    onPressed: () {
                                                      String _email;

                                                      String _error;
                                                      String _nombre;
                                                      if (_emailController.text
                                                              .isNotEmpty &&
                                                          _passwordController
                                                              .text
                                                              .isNotEmpty) {
                                                        _email =
                                                            _emailController
                                                                .text;
                                                        var bytes = utf8.encode(
                                                            _passwordController
                                                                .text); // data being hashed
                                                        var _pass =
                                                            sha1.convert(bytes);
                                                        print('xcvbnm');
                                                        print(_pass);

                                                        try {
                                                          Firestore.instance
                                                              .collection(
                                                                  'usuarios')
                                                              .where("email",
                                                                  isEqualTo:
                                                                      "$_email")
                                                              .snapshots()
                                                              .listen(
                                                                (data) => data
                                                                    .documents
                                                                    .forEach(
                                                                        (doc) {
                                                                  if (_pass
                                                                          .toString() ==
                                                                      doc["pass"]) {
                                                                    print(
                                                                        'correo y contraseña bien');
                                                                    setState(
                                                                        () {
                                                                      nombre = doc[
                                                                          'nombre'];
                                                                      correo =
                                                                          _email;
                                                                    });
                                                                    _emailController
                                                                        .clear();
                                                                    _passwordController
                                                                        .clear();
                                                                    Navigator.pop(
                                                                        context);
                                                                    Navigator
                                                                        .push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                        builder: (context) => Encuesta(
                                                                            email:
                                                                                correo,
                                                                            name:
                                                                                nombre),
                                                                      ),
                                                                    );
                                                                  } else {
                                                                    _passwordController
                                                                        .clear();
                                                                    _scaffoldKe
                                                                        .currentState
                                                                        .showSnackBar(
                                                                            SnackBar(
                                                                      content: Text(
                                                                          'Contraseña Incorrecta'),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              1500),
                                                                      backgroundColor:
                                                                          Color(
                                                                              0xff0d0d0d),
                                                                    ));
                                                                    print(
                                                                        'contraseña incorrecta');
                                                                  }
                                                                }),
                                                              );
                                                        } catch (e) {
                                                          _scaffoldKe
                                                              .currentState
                                                              .showSnackBar(
                                                                  SnackBar(
                                                            content: Text(
                                                                'Correo incorrecto'),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    1500),
                                                            backgroundColor:
                                                                Color(
                                                                    0xff0d0d0d),
                                                          ));
                                                          _error =
                                                              "Correo incorrecto";
                                                        }
                                                      }
                                                    },
                                                    child: Text('Ingresar'),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          8.0, 0, 8.0, 0),
                                                  child: InkWell(
                                                    onTap: () => {
                                                      Navigator.pop(context),
                                                      showModalBottomSheet(
                                                          context: context,
                                                          isScrollControlled:
                                                              true,
                                                          builder: (context) {
                                                            return Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xffe3e3e3),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          30),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          30),
                                                                ),
                                                              ),
                                                              height: (MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height) *
                                                                  0.95,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            10.0),
                                                                child: Form(
                                                                  child:
                                                                      ListView(
                                                                    children: <
                                                                        Widget>[
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(8.0),
                                                                        child:
                                                                            Container(
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Text(
                                                                              'Registrate',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(color: Colors.blueGrey, fontSize: 20),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          border:
                                                                              Border(top: BorderSide(color: Colors.grey)),
                                                                        ),
                                                                      ),
                                                                      TextField(
                                                                        controller:
                                                                            _nameController,
                                                                        maxLength:
                                                                            30,
                                                                        decoration: InputDecoration(
                                                                            icon:
                                                                                Icon(Icons.person),
                                                                            labelText: 'Nombre Completo'),
                                                                        keyboardType:
                                                                            TextInputType.emailAddress,
                                                                        inputFormatters: [
                                                                          BlacklistingTextInputFormatter(
                                                                              RegExp("[0-9]")),
                                                                        ],
                                                                        //autovalidate: true,
                                                                        autocorrect:
                                                                            false,
                                                                      ),
                                                                      TextField(
                                                                        controller:
                                                                            _emailController,
                                                                        maxLength:
                                                                            50,
                                                                        decoration: InputDecoration(
                                                                            icon:
                                                                                Icon(Icons.email),
                                                                            labelText: 'Email'),
                                                                        keyboardType:
                                                                            TextInputType.emailAddress,
                                                                        //autovalidate: true,
                                                                        autocorrect:
                                                                            false,
                                                                      ),
                                                                      TextField(
                                                                        controller:
                                                                            _passwordController,
                                                                        maxLength:
                                                                            10,
                                                                        decoration: InputDecoration(
                                                                            icon:
                                                                                Icon(Icons.lock),
                                                                            labelText: 'Contraseña'),
                                                                        obscureText:
                                                                            true,
                                                                        //autovalidate: true,
                                                                        autocorrect:
                                                                            false,
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.all(10),
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.stretch,
                                                                          children: <
                                                                              Widget>[
                                                                            Padding(
                                                                              padding: const EdgeInsets.all(8.0),
                                                                              child: InkWell(
                                                                                onTap: () {
                                                                                  String _namer;
                                                                                  String _emailr;
                                                                                  String _passr;
                                                                                  if (_nameController.text.isNotEmpty) {
                                                                                    _namer = _nameController.text.toUpperCase();
                                                                                    if (_emailController.text.isNotEmpty) {
                                                                                      _emailr = _emailController.text;
                                                                                      if (_passwordController.text.isNotEmpty) {
                                                                                        var bytes = utf8.encode(_passwordController.text); // data being hashed
                                                                                        var _passr = sha1.convert(bytes);
                                                                                        Firestore.instance.collection('usuarios').document().setData({
                                                                                          'nombre': '$_namer',
                                                                                          'email': '$_emailr',
                                                                                          'pass': '$_passr'
                                                                                        });
                                                                                        setState(() {
                                                                                          nombre = _nameController.text.toUpperCase();
                                                                                          correo = _emailController.text.toUpperCase();
                                                                                        });
                                                                                        Navigator.pop(context);
                                                                                        Navigator.push(
                                                                                          context,
                                                                                          MaterialPageRoute(builder: (context) => Encuesta(email: correo, name: nombre)),
                                                                                        );
                                                                                      }
                                                                                    }
                                                                                  }

                                                                                  _emailController.clear();
                                                                                  _passwordController.clear();
                                                                                  _nameController.clear();
                                                                                },
                                                                                child: Container(
                                                                                  width: MediaQuery.of(context).size.width,
                                                                                  height: ((MediaQuery.of(context).size.height) * .08),
                                                                                  decoration: BoxDecoration(
                                                                                      borderRadius: BorderRadius.only(
                                                                                        bottomRight: Radius.circular(10.0),
                                                                                        bottomLeft: Radius.circular(10.0),
                                                                                      ),
                                                                                      color: Color(0xffd7c9aa)),
                                                                                  child: Center(
                                                                                    child: Text(
                                                                                      'Registrarse',
                                                                                      style: GoogleFonts.doHyeon(color: Color(0xff000000), fontSize: 18.0),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(top: 8.0),
                                                                              child: Container(
                                                                                child: Center(
                                                                                  child: Text(
                                                                                    'Tu correo es para poder asociarla a la encuesta y poder tener contacto contigo de ser necesario.',
                                                                                    textAlign: TextAlign.center,
                                                                                    style: TextStyle(color: Colors.grey),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }),
                                                    },
                                                    child: Container(
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Color(0xffd7c9aa),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      25.0)),
                                                      child: Center(
                                                        child: Text(
                                                          'Crear Cuenta',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff000000),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                        top: BorderSide(
                                                            color:
                                                                Colors.grey)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0),
                                                  child: InkWell(
                                                    onTap: () => {
                                                      Navigator.pop(context),
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              Encuesta(
                                                                  email: 'null',
                                                                  name: 'null'),
                                                        ),
                                                      ),
                                                    },
                                                    child: Container(
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Color(0xffd7c9aa),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      25.0)),
                                                      child: Center(
                                                        child: Text(
                                                          'Continuar como Anónimo',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff000000),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                          top: BorderSide(
                                                              color:
                                                                  Colors.grey)),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0),
                                                  child: Container(
                                                    child: Center(
                                                      child: Text(
                                                        'Tu correo es para poder asociarla a la encuesta y poder tener contacto contigo de ser necesario.',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            color: Colors.grey),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        }
                      else
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Encuesta(email: correo, name: nombre),
                            ),
                          ),
                        }
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
                              color: Color(0xff38786a),
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
                                              color: Color(0xff0b7a75),
                                              fontSize: 20.0)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      'Contesta una encuesta para poder tener una idea de nuestros habitantes',
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
                              color: Color(0xff38786a),
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
                                              color: Color(0xff38786a),
                                              fontSize: 18.0)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      'Infórmate sobre los factores de riesgo aquí',
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
                              color: Color(0xff38786a),
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
                                              color: Color(0xff0b7a75),
                                              fontSize: 18.0)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      'Infórmate sobre como identificar Signos y Síntomas aquí',
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
                              color: Color(0xff38786a),
                            ),
                            child: Center(
                              child: FaIcon(
                                FontAwesomeIcons.handsWash,
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
                                              color: Color(0xff38786a),
                                              fontSize: 18.0)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      'Infórmate sobre lo que debes hacer aquí',
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
                              color: Color(0xff38786a),
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
                                              color: Color(0xff38786a),
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
                                      color: Color(0xff364156),
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
                                        style: TextStyle(
                                            color: Color(0xff364156),
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
                            color: Color(0xff364156),
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
                                  dotBgColor: Color(0xff212D40),
                                  animationDuration:
                                      const Duration(milliseconds: 1000),
                                  autoplayDuration: Duration(seconds: 15),
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
                                                      return Align(
                                                         alignment:
                                                            Alignment.topCenter,
                                                        child: Padding(padding: EdgeInsets.only(bottom: 20.0),
                                                        child: snapshot.data),
                                                      );
                                                    if (snapshot
                                                            .connectionState ==
                                                        ConnectionState.waiting)
                                                      return Align(
                                                        alignment:
                                                            Alignment.topCenter,
                                                        child:  Padding(padding: EdgeInsets.only(bottom: 20.0),
                                                          child: Image.asset(
                                                            "lib/assets/images/logocovid.png",
                                                            fit: BoxFit.contain,
                                                          ),)
                                                        
                                                      );
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
                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topRight: Radius
                                                                      .circular(
                                                                          30.0)),
                                                          color: Color.fromRGBO(
                                                              33, 45, 64, 0.99),
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
                                                                  child: Container(
                                                                      width: ((MediaQuery.of(context).size.width) * 0.90),
                                                                      decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.only(topRight: Radius.circular(30.0)),
                                                                      ),
                                                                      child: FutureBuilder(
                                                                        future: getData(
                                                                            context,
                                                                            item['titulo']),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          if (snapshot.connectionState ==
                                                                              ConnectionState.done)
                                                                            return snapshot.data;
                                                                          if (snapshot.connectionState ==
                                                                              ConnectionState.waiting)
                                                                            return Text(' ');
                                                                          return CircularProgressIndicator();
                                                                        },
                                                                      )),
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
                                                                                BorderRadius.only(topRight: Radius.circular(30.0)),
                                                                          ),
                                                                          child:
                                                                              FutureBuilder(
                                                                            future:
                                                                                getData(context, item['subtitulo']),
                                                                            builder:
                                                                                (context, snapshot) {
                                                                              if (snapshot.connectionState == ConnectionState.done)
                                                                                return snapshot.data;
                                                                              if (snapshot.connectionState == ConnectionState.waiting)
                                                                                return Text(' ');
                                                                              return CircularProgressIndicator();
                                                                            },
                                                                          )),
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
                                                                                BorderRadius.only(topRight: Radius.circular(30.0)),
                                                                          ),
                                                                          child:
                                                                              FutureBuilder(
                                                                            future:
                                                                                getData(context, item['fecha']),
                                                                            builder:
                                                                                (context, snapshot) {
                                                                              if (snapshot.connectionState == ConnectionState.done)
                                                                                return snapshot.data;
                                                                              if (snapshot.connectionState == ConnectionState.waiting)
                                                                                return Text(' ');
                                                                              return CircularProgressIndicator();
                                                                            },
                                                                          )),
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
                                                                                BorderRadius.only(topRight: Radius.circular(30.0)),
                                                                          ),
                                                                          child:
                                                                              FutureBuilder(
                                                                            future:
                                                                                getDataCuerpo(context, item['cuerpo']),
                                                                            builder:
                                                                                (context, snapshot) {
                                                                              if (snapshot.connectionState == ConnectionState.done)
                                                                                return snapshot.data;
                                                                              if (snapshot.connectionState == ConnectionState.waiting)
                                                                                return Text(' ');
                                                                              return CircularProgressIndicator();
                                                                            },
                                                                          )),
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
                                                                        SaveFile()
                                                                            .save(item['imagen']);
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
                                                                        Navigator.pop(
                                                                            context);
                                                                        _scaffoldKe
                                                                            .currentState
                                                                            .showSnackBar(SnackBar(
                                                                          content:
                                                                              Text('No se pudo Guardar la Imagen'),
                                                                          duration:
                                                                              Duration(milliseconds: 1500),
                                                                          backgroundColor:
                                                                              Color(0xff0d0d0d),
                                                                        ));
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
                                                      33, 45, 64, 0.90),
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
                                                      style: TextStyle(
                                                          color: Colors.blue,
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
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(color: Color(0xff212D40)),
          child: new ListView(
            children: <Widget>[
              Container(
                child: UserAccountsDrawerHeader(
                  accountName: Text("Bienvenidos a \nCOVID AutoDx"),
                  currentAccountPicture: FittedBox(
                      fit: BoxFit.contain,
                      child: Image.asset(
                        "lib/assets/images/logocirculoo.png",
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0),
                    child: InkWell(
                      onTap: () => {
                        Navigator.pop(context),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Factores(),
                          ),
                        ),
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border(top: BorderSide(color: Color(0xff212D40))),
                        ),
                        child: ListTile(
                            title: Text(
                              'Factores de Riesgo',
                              style: TextStyle(
                                color: Color(0xfff0f3f5),
                              ),
                            ),
                            leading: FaIcon(
                              FontAwesomeIcons.exclamation,
                              color: Color(0xfff0f3f5),
                              //size: 30.0,
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                    child: InkWell(
                      onTap: () => {
                        Navigator.pop(context),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Signos(),
                          ),
                        ),
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border(top: BorderSide(color: Color(0xff212D40))),
                        ),
                        child: ListTile(
                            title: Text(
                              'Signos y Síntomas',
                              style: TextStyle(color: Color(0xfff0f3f5)),
                            ),
                            leading: FaIcon(
                              FontAwesomeIcons.headSideVirus,
                              color: Color(0xfff0f3f5),
                              //size: 30.0,
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                    child: InkWell(
                      onTap: () => {
                        Navigator.pop(context),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Recomendaciones(),
                          ),
                        ),
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border(top: BorderSide(color: Color(0xff212D40))),
                        ),
                        child: ListTile(
                          title: Text(
                            'Recomendaciones',
                            style: TextStyle(
                              color: Color(0xfff0f3f5),
                            ),
                          ),
                          leading: FaIcon(
                            FontAwesomeIcons.stream,
                            color: Color(0xfff0f3f5),
                            //size: 30.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                    child: InkWell(
                      onTap: () => {
                        Navigator.pop(context),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Enlaces(),
                          ),
                        ),
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border(top: BorderSide(color: Color(0xff212D40))),
                        ),
                        child: ListTile(
                            title: Text(
                              'Enlaces Prioritarios',
                              style: TextStyle(
                                color: Color(0xfff0f3f5),
                              ),
                            ),
                            leading: FaIcon(
                              FontAwesomeIcons.mobileAlt,
                              color: Color(0xfff0f3f5),
                              //size: 30.0,
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                    child: InkWell(
                      onTap: () => {
                        if (nombre == null)
                          {
                            Navigator.pop(context),
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xffe3e3e3),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30),
                                      ),
                                    ),
                                    height:
                                        (MediaQuery.of(context).size.height) *
                                            0.95,
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Form(
                                        child: ListView(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                child: Center(
                                                  child: Text(
                                                    'Iniciar sesión',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.blueGrey,
                                                        fontSize: 20),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                border: Border(
                                                    top: BorderSide(
                                                        color: Colors.grey)),
                                              ),
                                            ),
                                            TextField(
                                              controller: _emailController,
                                              maxLength: 30,
                                              decoration: InputDecoration(
                                                  icon: Icon(Icons.email),
                                                  labelText: 'Email'),
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              //autovalidate: true,
                                              autocorrect: false,
                                            ),
                                            TextField(
                                              controller: _passwordController,
                                              maxLength: 10,
                                              decoration: InputDecoration(
                                                  icon: Icon(Icons.lock),
                                                  labelText: 'Contraseña'),
                                              obscureText: true,
                                              //autovalidate: true,
                                              autocorrect: false,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: <Widget>[
                                                  Container(
                                                    child: RaisedButton(
                                                      color: Color(0xffd7c9aa),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30.0),
                                                      ),
                                                      onPressed: () {
                                                        String _email;
                                                        String _pass;
                                                        String _error;
                                                        String _nombre;
                                                        if (_emailController
                                                                .text
                                                                .isNotEmpty &&
                                                            _passwordController
                                                                .text
                                                                .isNotEmpty) {
                                                          _email =
                                                              _emailController
                                                                  .text;
                                                          _pass =
                                                              _passwordController
                                                                  .text;
                                                          try {
                                                            Firestore.instance
                                                                .collection(
                                                                    'usuarios')
                                                                .where("email",
                                                                    isEqualTo:
                                                                        "$_email")
                                                                .snapshots()
                                                                .listen(
                                                                  (data) => data
                                                                      .documents
                                                                      .forEach(
                                                                          (doc) {
                                                                    if (_pass ==
                                                                        doc["pass"]) {
                                                                      print(
                                                                          'correo y contraseña bien');
                                                                      setState(
                                                                          () {
                                                                        nombre =
                                                                            doc['nombre'];
                                                                        correo =
                                                                            _email;
                                                                      });
                                                                      _emailController
                                                                          .clear();
                                                                      _passwordController
                                                                          .clear();
                                                                      Navigator.pop(
                                                                          context);
                                                                      Navigator
                                                                          .push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                          builder: (context) => Encuesta(
                                                                              email: correo,
                                                                              name: nombre),
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      _passwordController
                                                                          .clear();
                                                                      _scaffoldKe
                                                                          .currentState
                                                                          .showSnackBar(
                                                                              SnackBar(
                                                                        content:
                                                                            Text('Contraseña Incorrecta'),
                                                                        duration:
                                                                            Duration(milliseconds: 1500),
                                                                        backgroundColor:
                                                                            Color(0xff0d0d0d),
                                                                      ));
                                                                      print(
                                                                          'contraseña incorrecta');
                                                                    }
                                                                  }),
                                                                );
                                                          } catch (e) {
                                                            _scaffoldKe
                                                                .currentState
                                                                .showSnackBar(
                                                                    SnackBar(
                                                              content: Text(
                                                                  'Correo incorrecto'),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      1500),
                                                              backgroundColor:
                                                                  Color(
                                                                      0xff0d0d0d),
                                                            ));
                                                            _error =
                                                                "Correo incorrecto";
                                                          }
                                                        }
                                                      },
                                                      child: Text('Ingresar'),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .fromLTRB(
                                                        8.0, 0, 8.0, 0),
                                                    child: InkWell(
                                                      onTap: () => {
                                                        Navigator.pop(context),
                                                        showModalBottomSheet(
                                                            context: context,
                                                            isScrollControlled:
                                                                true,
                                                            builder: (context) {
                                                              return Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xffe3e3e3),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            30),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            30),
                                                                  ),
                                                                ),
                                                                height: (MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height) *
                                                                    0.95,
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              10.0),
                                                                  child: Form(
                                                                    child:
                                                                        ListView(
                                                                      children: <
                                                                          Widget>[
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child:
                                                                              Container(
                                                                            child:
                                                                                Center(
                                                                              child: Text(
                                                                                'Registrate',
                                                                                textAlign: TextAlign.center,
                                                                                style: TextStyle(color: Colors.blueGrey, fontSize: 20),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            border:
                                                                                Border(top: BorderSide(color: Colors.grey)),
                                                                          ),
                                                                        ),
                                                                        TextField(
                                                                          controller:
                                                                              _nameController,
                                                                          maxLength:
                                                                              30,
                                                                          decoration: InputDecoration(
                                                                              icon: Icon(Icons.person),
                                                                              labelText: 'Nombre Completo'),
                                                                          inputFormatters: [
                                                                            BlacklistingTextInputFormatter(RegExp("[0-9]")),
                                                                          ],
                                                                          keyboardType:
                                                                              TextInputType.emailAddress,
                                                                          //autovalidate: true,
                                                                          autocorrect:
                                                                              false,
                                                                        ),
                                                                        TextField(
                                                                          controller:
                                                                              _emailController,
                                                                          maxLength:
                                                                              50,
                                                                          decoration: InputDecoration(
                                                                              icon: Icon(Icons.email),
                                                                              labelText: 'Email'),
                                                                          keyboardType:
                                                                              TextInputType.emailAddress,
                                                                          //autovalidate: true,
                                                                          autocorrect:
                                                                              false,
                                                                        ),
                                                                        TextField(
                                                                          controller:
                                                                              _passwordController,
                                                                          maxLength:
                                                                              10,
                                                                          decoration: InputDecoration(
                                                                              icon: Icon(Icons.lock),
                                                                              labelText: 'Contraseña'),
                                                                          obscureText:
                                                                              true,
                                                                          //autovalidate: true,
                                                                          autocorrect:
                                                                              false,
                                                                        ),
                                                                        Padding(
                                                                          padding:
                                                                              EdgeInsets.all(10),
                                                                          child:
                                                                              Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.stretch,
                                                                            children: <Widget>[
                                                                              Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: InkWell(
                                                                                  onTap: () {
                                                                                    String _namer;
                                                                                    String _emailr;
                                                                                    String _passr;
                                                                                    if (_nameController.text.isNotEmpty) {
                                                                                      _namer = _nameController.text.toUpperCase();
                                                                                      if (_emailController.text.isNotEmpty) {
                                                                                        _emailr = _emailController.text;
                                                                                        if (_passwordController.text.isNotEmpty) {
                                                                                          _passr = _passwordController.text;
                                                                                          Firestore.instance.collection('usuarios').document().setData({
                                                                                            'nombre': '$_namer',
                                                                                            'email': '$_emailr',
                                                                                            'pass': '$_passr'
                                                                                          });
                                                                                          setState(() {
                                                                                            nombre = _nameController.text.toUpperCase();
                                                                                            correo = _emailController.text.toUpperCase();
                                                                                          });
                                                                                          Navigator.pop(context);
                                                                                          Navigator.push(
                                                                                            context,
                                                                                            MaterialPageRoute(builder: (context) => Encuesta(email: correo, name: nombre)),
                                                                                          );
                                                                                        }
                                                                                      }
                                                                                    }

                                                                                    _emailController.clear();
                                                                                    _passwordController.clear();
                                                                                    _nameController.clear();
                                                                                  },
                                                                                  child: Container(
                                                                                    width: MediaQuery.of(context).size.width,
                                                                                    height: ((MediaQuery.of(context).size.height) * .08),
                                                                                    decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.only(
                                                                                          bottomRight: Radius.circular(10.0),
                                                                                          bottomLeft: Radius.circular(10.0),
                                                                                        ),
                                                                                        color: Color(0xffd7c9aa)),
                                                                                    child: Center(
                                                                                      child: Text(
                                                                                        'Registrarse',
                                                                                        style: GoogleFonts.doHyeon(color: Color(0xff000000), fontSize: 18.0),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsets.only(top: 8.0),
                                                                                child: Container(
                                                                                  child: Center(
                                                                                    child: Text(
                                                                                      'Tu correo es para poder asociarla a la encuesta y poder tener contacto contigo de ser necesario.',
                                                                                      textAlign: TextAlign.center,
                                                                                      style: TextStyle(color: Colors.grey),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }),
                                                      },
                                                      child: Container(
                                                        height: 40,
                                                        decoration: BoxDecoration(
                                                            color: Color(
                                                                0xffd7c9aa),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25.0)),
                                                        child: Center(
                                                          child: Text(
                                                            'Crear Cuenta',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xff000000),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                          top: BorderSide(
                                                              color:
                                                                  Colors.grey)),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0),
                                                    child: InkWell(
                                                      onTap: () => {
                                                        Navigator.pop(context),
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                Encuesta(
                                                                    email:
                                                                        'null',
                                                                    name:
                                                                        'null'),
                                                          ),
                                                        ),
                                                      },
                                                      child: Container(
                                                        height: 40,
                                                        decoration: BoxDecoration(
                                                            color: Color(
                                                                0xffd7c9aa),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25.0)),
                                                        child: Center(
                                                          child: Text(
                                                            'Continuar como Anónimo',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xff000000),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        border: Border(
                                                            top: BorderSide(
                                                                color: Colors
                                                                    .grey)),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0),
                                                    child: Container(
                                                      child: Center(
                                                        child: Text(
                                                          'Tu correo es para poder asociarla a la encuesta y poder tener contacto contigo de ser necesario.',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          }
                        else
                          {
                            Navigator.pop(context),
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Encuesta(email: correo, name: nombre),
                              ),
                            ),
                          }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border(top: BorderSide(color: Color(0xff212D40))),
                        ),
                        child: ListTile(
                            title: Text(
                              'Encuestas',
                              style: TextStyle(
                                color: Color(0xfff0f3f5),
                              ),
                            ),
                            leading: FaIcon(
                              FontAwesomeIcons.clipboardList,
                              color: Color(0xfff0f3f5),
                              //size: 30.0,
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                    child: InkWell(
                      onTap: () => {
                        Navigator.pop(context),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Info(),
                          ),
                        ),
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border(top: BorderSide(color: Color(0xff11151C))),
                        ),
                        child: ListTile(
                            title: Text(
                              'Más Información',
                              style: TextStyle(
                                color: Color(0xfff0f3f5),
                              ),
                            ),
                            leading: FaIcon(
                              FontAwesomeIcons.infoCircle,
                              color: Color(0xfff0f3f5),
                              //size: 30.0,
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
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
    m = Image.asset(
                  "lib/assets/images/long.png",
                  fit: BoxFit.cover,
                );
    
  }
  return m;
}

Future<Widget> getData(BuildContext context, String item) async {
  Text m;
  if (item != null) {
    m = Text(
      '$item',
      style:GoogleFonts.doHyeon(color: Color(0xfff0f3f5), fontSize: 15.0),
    );
  } else {
    m = Text(' ');
  }
  return m;
}


Future<Widget> getDataCuerpo(BuildContext context, String item) async {
  Text m;
  if (item != null) {
    m = Text(
      '$item',
      style: TextStyle(color: Color(0xfff0f3f5), fontSize: 13.0),
      textAlign: TextAlign.justify,
    );
  } else {
    m = Text(' ');
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
