import 'package:covi/bloc/login_bloc/bloc.dart';
import 'package:covi/bloc/login_form.dart';
import 'package:covi/bloc/registro/eserepo.dart';
import 'package:covi/menu_lateral/login.dart';
import 'package:covi/wid_factores/enlaces.dart';
import 'package:covi/wid_factores/factores.dart';
import 'package:covi/wid_factores/form.dart';
import 'package:covi/wid_factores/info.dart';
import 'package:covi/wid_factores/recomendaciones.dart';
import 'package:covi/wid_factores/signos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Menu extends StatelessWidget {
  final UserRepository _userRepository;

  Menu({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

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
                          elevation: (queryData.size.height),
                          backgroundColor: Color.fromRGBO(0, 0, 0, 0),
                          context: context,
                          builder: (context) {
                            return LoginScreen(userRepository: _userRepository);
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

class LoginScreen extends StatelessWidget {
  final UserRepository _userRepository;

  LoginScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            width: queryData.size.width,
            height: (queryData.size.height) * .9,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Center(
              child: BlocProvider<LoginBloc>(
                create: (context) => LoginBloc(userRepository: _userRepository),
                child: LoginForm(userRepository: _userRepository),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
