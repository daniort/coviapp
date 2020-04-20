import 'package:covi/wid_factores/enlaces.dart';
import 'package:covi/wid_factores/factores.dart';
import 'package:covi/wid_factores/form.dart';
import 'package:covi/wid_factores/info.dart';
import 'package:covi/wid_factores/recomendaciones.dart';
import 'package:covi/wid_factores/signos.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _nameController;

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
    return Drawer(
      child: Container(
        decoration: BoxDecoration(color: Color(0xff0d2a31)),
        child: new ListView(
          children: <Widget>[
            Container(
              child: UserAccountsDrawerHeader(
                accountName: Text("Bienvenida"),
                accountEmail: Text("A nuestra aplicacion"),
                currentAccountPicture:
                    CircleAvatar(backgroundColor: Color(0xfff0f3f5)),
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
                            Border(top: BorderSide(color: Color(0xff19535f))),
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
                            Border(top: BorderSide(color: Color(0xff19535f))),
                      ),
                      child: ListTile(
                          title: Text(
                            'Signos y Sintomas',
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
                            Border(top: BorderSide(color: Color(0xff19535f))),
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
                            Border(top: BorderSide(color: Color(0xff19535f))),
                      ),
                      child: ListTile(
                          title: Text(
                            'Enlaces prioritarios',
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
                                  (MediaQuery.of(context).size.height) * 0.95,
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
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                ),
                                                onPressed: () {
                                                  String _email;
                                                  String _pass;
                                                  if (_emailController
                                                      .text.isNotEmpty) {
                                                    _email =
                                                        _emailController.text;
                                                    Firestore.instance
                                                        .collection('usuarios')
                                                        .document()
                                                        .get()
                                                        .then((DocumentSnapshot
                                                            ds) {
                                                      _email = ds['email'];
                                                    });
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
                                                  showModalBottomSheet(
                                                      context: context,
                                                      isScrollControlled: true,
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
                                                                  .circular(30),
                                                              topRight: Radius
                                                                  .circular(30),
                                                            ),
                                                          ),
                                                          height: (MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height) *
                                                              0.95,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10.0),
                                                            child: Form(
                                                              child: ListView(
                                                                children: <
                                                                    Widget>[
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child:
                                                                        Container(
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Text(
                                                                          'Registrate',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: TextStyle(
                                                                              color: Colors.blueGrey,
                                                                              fontSize: 20),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      border: Border(
                                                                          top: BorderSide(
                                                                              color: Colors.grey)),
                                                                    ),
                                                                  ),
                                                                  TextField(
                                                                    controller:
                                                                        _nameController,
                                                                    maxLength:
                                                                        30,
                                                                    decoration: InputDecoration(
                                                                        icon: Icon(Icons
                                                                            .person),
                                                                        labelText:
                                                                            'Nombre(s)'),
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .emailAddress,
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
                                                                        icon: Icon(Icons
                                                                            .email),
                                                                        labelText:
                                                                            'Email'),
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .emailAddress,
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
                                                                        icon: Icon(Icons
                                                                            .lock),
                                                                        labelText:
                                                                            'Contraseña'),
                                                                    obscureText:
                                                                        true,
                                                                    //autovalidate: true,
                                                                    autocorrect:
                                                                        false,
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            10),
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .stretch,
                                                                      children: <
                                                                          Widget>[
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () {
                                                                              String _name;
                                                                              String _email;
                                                                              String _pass;
                                                                              if (_nameController.text.isNotEmpty) {
                                                                                _name = _nameController.text.toUpperCase();
                                                                                print(_name);
                                                                                if (_emailController.text.isNotEmpty) {
                                                                                  _email = _emailController.text;
                                                                                  print(_email);
                                                                                  if (_passwordController.text.isNotEmpty) {
                                                                                    _pass = _passwordController.text;
                                                                                    print(_pass);
                                                                                    Firestore.instance.collection('usuarios').document().setData({
                                                                                      'nombre': '$_name',
                                                                                      'email': '$_email',
                                                                                      'pass': '$_pass'
                                                                                    });
                                                                                    Navigator.pop(context);
                                                                                    Navigator.push(
                                                                                      context,
                                                                                      MaterialPageRoute(
                                                                                        builder: (context) => Encuesta(),
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                                }
                                                                              }
                                                                              _passwordController.clear();
                                                                              _emailController.clear();
                                                                              _nameController.clear();
                                                                            },
                                                                            child:
                                                                                Container(
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
                                                                          padding:
                                                                              const EdgeInsets.only(top: 8.0),
                                                                          child:
                                                                              Container(
                                                                            child:
                                                                                Center(
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
                                                      color: Color(0xffd7c9aa),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25.0)),
                                                  child: Center(
                                                    child: Text(
                                                      'Crear Cuenta',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff000000),
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
                                                        color: Colors.grey)),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: InkWell(
                                                onTap: () => {
                                                  Navigator.pop(context),
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          Encuesta(),
                                                    ),
                                                  ),
                                                },
                                                child: Container(
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                      color: Color(0xffd7c9aa),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25.0)),
                                                  child: Center(
                                                    child: Text(
                                                      'Continuar como Anónimo',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff000000),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                      top: BorderSide(
                                                          color: Colors.grey)),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Container(
                                                child: Center(
                                                  child: Text(
                                                    'Tu correo es para poder asociarla a la encuesta y poder tener contacto contigo de ser necesario.',
                                                    textAlign: TextAlign.center,
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
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border:
                            Border(top: BorderSide(color: Color(0xff19535f))),
                      ),
                      child: ListTile(
                          title: Text(
                            'Encuesta',
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
                            Border(top: BorderSide(color: Color(0xff19535f))),
                      ),
                      child: ListTile(
                          title: Text(
                            'Mas informacion',
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
    );
  }
}
