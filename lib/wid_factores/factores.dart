import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Factores extends StatefulWidget {
  @override
  _FactoresState createState() => _FactoresState();
}

class _FactoresState extends State<Factores> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdadad9),
      appBar: AppBar(
        title: Text('Factores de Riesgo'),
      ),
      body: Container(
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                          width: ((MediaQuery.of(context).size.width) * .25),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0)),
                            color: Color(0xff38786a),
                          ),
                          child: Center(
                            child: FaIcon(
                              FontAwesomeIcons.circle,
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
                                    child: Text('Ser Mayor de 65 Años',
                                        style: TextStyle(
                                            color: Color(0xff38786a),
                                            fontSize: 18.0)),
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
                padding: const EdgeInsets.all(8.0),
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
                          width: ((MediaQuery.of(context).size.width) * .25),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0)),
                            color: Color(0xff38786a),
                          ),
                          child: Center(
                            child: FaIcon(
                              FontAwesomeIcons.circle,
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
                                    child: Text('Cáncer',
                                        style: TextStyle(
                                            color: Color(0xff38786a),
                                            fontSize: 18.0)),
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
                padding: const EdgeInsets.all(8.0),
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
                          width: ((MediaQuery.of(context).size.width) * .25),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0)),
                            color: Color(0xff38786a),
                          ),
                          child: Center(
                            child: FaIcon(
                              FontAwesomeIcons.circle,
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
                                    child: Text('Cardiovascular',
                                        style: TextStyle(
                                            color: Color(0xff38786a),
                                            fontSize: 18.0)),
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
                padding: const EdgeInsets.all(8.0),
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
                          width: ((MediaQuery.of(context).size.width) * .25),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0)),
                            color: Color(0xff38786a),
                          ),
                          child: Center(
                            child: FaIcon(
                              FontAwesomeIcons.circle,
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
                                    child: Text('Diabetes 1 y 2',
                                        style: TextStyle(
                                            color: Color(0xff38786a),
                                            fontSize: 18.0)),
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
                padding: const EdgeInsets.all(8.0),
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
                          width: ((MediaQuery.of(context).size.width) * .25),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0)),
                            color: Color(0xff38786a),
                          ),
                          child: Center(
                            child: FaIcon(
                              FontAwesomeIcons.circle,
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
                                    child: Text('Diabetes Gestacional',
                                        style: TextStyle(
                                            color: Color(0xff38786a),
                                            fontSize: 18.0)),
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
                padding: const EdgeInsets.all(8.0),
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
                          width: ((MediaQuery.of(context).size.width) * .25),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0)),
                            color: Color(0xff38786a),
                          ),
                          child: Center(
                            child: FaIcon(
                              FontAwesomeIcons.circle,
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
                                    child: Text('Embarazo',
                                        style: TextStyle(
                                            color: Color(0xff38786a),
                                            fontSize: 18.0)),
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
                padding: const EdgeInsets.all(8.0),
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
                          width: ((MediaQuery.of(context).size.width) * .25),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0)),
                            color: Color(0xff38786a),
                          ),
                          child: Center(
                            child: FaIcon(
                              FontAwesomeIcons.circle,
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
                                    child: Text('Enfermedad Pulmonar',
                                        style: TextStyle(
                                            color: Color(0xff38786a),
                                            fontSize: 18.0)),
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
                padding: const EdgeInsets.all(8.0),
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
                          width: ((MediaQuery.of(context).size.width) * .25),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0)),
                            color: Color(0xff38786a),
                          ),
                          child: Center(
                            child: FaIcon(
                              FontAwesomeIcons.circle,
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
                                    child: Text('VIH',
                                        style: TextStyle(
                                            color: Color(0xff38786a),
                                            fontSize: 18.0)),
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
        )),
      ),
    );
  }
}
