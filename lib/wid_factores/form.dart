import 'package:covi/bloc/login_form.dart';
import 'package:covi/bloc/registro/eserepo.dart';

import 'package:covi/wid_factores/warnin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Encuesta extends StatefulWidget {
  @override
  _EncuestaState createState() => _EncuestaState();
}

final _scaffoldKey = GlobalKey<ScaffoldState>();
TextEditingController _controllerNombre;
TextEditingController _controllerEdad;
TextEditingController _controllerOtro;
String sex;
bool check_cancer = false;
bool check_cardi = false;
bool check_diabetes = false;
bool check_gesta = false;
bool check_embara = false;
bool check_pulm = false;
bool check_vih = false;
bool check_toracico = false;
bool check_respirato = false;
bool check_fiebre = false;
bool check_cabeza = false;
bool check_tos = false;
bool check_muscular = false;
bool check_articulaciones = false;
bool check_garganta = false;
bool check_moco = false;
bool check_ojos = false;
bool viaje = false;
bool reunion = false;

class _EncuestaState extends State<Encuesta> {
  final UserRepository _userRepository;
  _EncuestaState({@required UserRepository userRepository})
      : _userRepository = userRepository;

  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  Position _currentPosition;
  String _currentLocality;
  String _currentCp;
  String _currentEstado;
  String _lati;
  String _longi;

  void initState() {
    _controllerNombre = TextEditingController();
    _controllerEdad = TextEditingController();
    _controllerOtro = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xff19535f),
      appBar: AppBar(
        title: Text('Encuestas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xfff0f3f5),
                    borderRadius: BorderRadius.circular(30.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: ((MediaQuery.of(context).size.height) * .06),
                      width: ((MediaQuery.of(context).size.width)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                        color: Color(0xfff0f3f5),
                      ),
                      child: Center(
                        child: Text('Responde con honestidad.',
                            style: GoogleFonts.doHyeon(
                                color: Color(0xff0d2a31), fontSize: 20.0)),
                      ),
                    ),
                    Container(
                      height: ((MediaQuery.of(context).size.height) * .05),
                      width: ((MediaQuery.of(context).size.width)),
                      decoration: BoxDecoration(
                        color: Color(0xffd7c9aa),
                      ),
                      child: Center(
                        child: Text('Datos Generales.',
                            style: TextStyle(
                                color: Color(0xff0d2a31), fontSize: 15.0)),
                      ),
                    ),
                    Container(
                      height: ((MediaQuery.of(context).size.height) * .08),
                      color: Color(0xfff0f3f5),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: TextField(
                          controller: _controllerNombre,
                          decoration:
                              InputDecoration(hintText: 'Nombre Completo:'),
                          inputFormatters: [
                            BlacklistingTextInputFormatter(RegExp("[0-9]")),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: TextField(
                              controller: _controllerEdad,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                WhitelistingTextInputFormatter(RegExp("[0-9]")),
                                BlacklistingTextInputFormatter(
                                    RegExp("[-*,.+]")),
                              ],
                              maxLength: 2,
                              decoration: InputDecoration(hintText: 'Edad:'),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              'Sexo:',
                              style: TextStyle(
                                  color: Color(0xFF838383), fontSize: 17.0),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: DropdownButton<String>(
                                value: sex,
                                items: [
                                  DropdownMenuItem<String>(
                                    child: Text('Femenino'),
                                    value: 'Femenino',
                                  ),
                                  DropdownMenuItem<String>(
                                    child: Text('Masculino'),
                                    value: 'Masculino',
                                  ),
                                ],
                                onChanged: (String value) {
                                  setState(() {
                                    sex = value;
                                  });
                                },
                                hint: Text('Elegir...'),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
               
                    Container(
                      height: ((MediaQuery.of(context).size.height) * .05),
                      width: ((MediaQuery.of(context).size.width)),
                      decoration: BoxDecoration(
                        color: Color(0xffd7c9aa),
                      ),
                      child: Center(
                        child: Text(
                            'Selecciona los Factores de Riesgo que tengas:',
                            style: TextStyle(
                                color: Color(0xff0d2a31), fontSize: 15.0)),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: ((MediaQuery.of(context).size.width) * .15),
                          height: ((MediaQuery.of(context).size.height) * .05),
                          decoration: BoxDecoration(
                              //color: Color(0xff0d2a31),
                              ),
                          child: Checkbox(
                            value: check_cancer,
                            onChanged: (bool value) {
                              setState(() {
                                check_cancer = value;
                              });
                            },
                            activeColor: Color(0xffd7c9aa),
                          ),
                        ),
                        Container(
                          //width: ((MediaQuery.of(context).size.width) * .60),
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
                                            color: Color(0xff0d2a31),
                                            fontSize: 15.0)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: ((MediaQuery.of(context).size.width) * .15),
                          height: ((MediaQuery.of(context).size.height) * .05),
                          decoration: BoxDecoration(
                              //color: Color(0xff0d2a31),
                              ),
                          child: Checkbox(
                            value: check_cardi,
                            onChanged: (bool value) {
                              setState(() {
                                check_cardi = value;
                              });
                            },
                            activeColor: Color(0xffd7c9aa),
                          ),
                        ),
                        Container(
                          //width: ((MediaQuery.of(context).size.width) * .60),
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
                                            color: Color(0xff0d2a31),
                                            fontSize: 15.0)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: ((MediaQuery.of(context).size.width) * .15),
                          height: ((MediaQuery.of(context).size.height) * .05),
                          child: Checkbox(
                            value: check_diabetes,
                            onChanged: (bool value) {
                              setState(() {
                                check_diabetes = value;
                              });
                            },
                            activeColor: Color(0xffd7c9aa),
                          ),
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text('Diabetes 1 o 2',
                                  style: TextStyle(
                                      color: Color(0xff0d2a31),
                                      fontSize: 15.0)),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: ((MediaQuery.of(context).size.width) * .15),
                          height: ((MediaQuery.of(context).size.height) * .05),
                          child: Checkbox(
                            value: check_gesta,
                            onChanged: (bool value) {
                              setState(() {
                                check_gesta = value;
                              });
                            },
                            activeColor: Color(0xffd7c9aa),
                          ),
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text('Diabetes Gestacional',
                                  style: TextStyle(
                                      color: Color(0xff0d2a31),
                                      fontSize: 15.0)),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: ((MediaQuery.of(context).size.width) * .15),
                          height: ((MediaQuery.of(context).size.height) * .05),
                          child: Checkbox(
                            value: check_embara,
                            onChanged: (bool value) {
                              setState(() {
                                check_embara = value;
                              });
                            },
                            activeColor: Color(0xffd7c9aa),
                          ),
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text('Embarazo',
                                  style: TextStyle(
                                      color: Color(0xff0d2a31),
                                      fontSize: 15.0)),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: ((MediaQuery.of(context).size.width) * .15),
                          height: ((MediaQuery.of(context).size.height) * .05),
                          child: Checkbox(
                            value: check_pulm,
                            onChanged: (bool value) {
                              setState(() {
                                check_pulm = value;
                              });
                            },
                            activeColor: Color(0xffd7c9aa),
                          ),
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text('Enfermedad Pulmonar',
                                  style: TextStyle(
                                      color: Color(0xff0d2a31),
                                      fontSize: 15.0)),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: ((MediaQuery.of(context).size.width) * .15),
                          height: ((MediaQuery.of(context).size.height) * .05),
                          child: Checkbox(
                            value: check_vih,
                            onChanged: (bool value) {
                              setState(() {
                                check_vih = value;
                              });
                            },
                            activeColor: Color(0xffd7c9aa),
                          ),
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text('VIH',
                                  style: TextStyle(
                                      color: Color(0xff0d2a31),
                                      fontSize: 15.0)),
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: ((MediaQuery.of(context).size.height) * .05),
                      color: Color(0xfff0f3f5),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: _controllerOtro,
                          decoration: InputDecoration(hintText: 'Otro:'),
                          inputFormatters: [
                            BlacklistingTextInputFormatter(RegExp("[0-9]")),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: ((MediaQuery.of(context).size.height) * .05),
                      width: ((MediaQuery.of(context).size.width)),
                      decoration: BoxDecoration(
                        color: Color(0xffd7c9aa),
                      ),
                      child: Center(
                        child: Text(
                            'Selecciona los Signos y Síntomas que presentes:',
                            style: TextStyle(
                                color: Color(0xff0d2a31), fontSize: 15.0)),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: ((MediaQuery.of(context).size.width) * .15),
                          height: ((MediaQuery.of(context).size.height) * .05),
                          child: Checkbox(
                            value: check_toracico,
                            onChanged: (bool value) {
                              setState(() {
                                check_toracico = value;
                              });
                            },
                            activeColor: Color(0xffd7c9aa),
                          ),
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text('Dolor Toracico',
                                  style: TextStyle(
                                      color: Color(0xff0d2a31),
                                      fontSize: 15.0)),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: ((MediaQuery.of(context).size.width) * .15),
                          height: ((MediaQuery.of(context).size.height) * .05),
                          child: Checkbox(
                            value: check_respirato,
                            onChanged: (bool value) {
                              setState(() {
                                check_respirato = value;
                              });
                            },
                            activeColor: Color(0xffd7c9aa),
                          ),
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text('Dificultad Respiratoría',
                                  style: TextStyle(
                                      color: Color(0xff0d2a31),
                                      fontSize: 15.0)),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: ((MediaQuery.of(context).size.width) * .15),
                          height: ((MediaQuery.of(context).size.height) * .05),
                          child: Checkbox(
                            value: check_fiebre,
                            onChanged: (bool value) {
                              setState(() {
                                check_fiebre = value;
                              });
                            },
                            activeColor: Color(0xffd7c9aa),
                          ),
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text('Fiebre Mayor a 38.3°C',
                                  style: TextStyle(
                                      color: Color(0xff0d2a31),
                                      fontSize: 15.0)),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: ((MediaQuery.of(context).size.width) * .15),
                          height: ((MediaQuery.of(context).size.height) * .05),
                          child: Checkbox(
                            value: check_cabeza,
                            onChanged: (bool value) {
                              setState(() {
                                check_cabeza = value;
                              });
                            },
                            activeColor: Color(0xffd7c9aa),
                          ),
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text('Dolor de Cabeza',
                                  style: TextStyle(
                                      color: Color(0xff0d2a31),
                                      fontSize: 15.0)),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: ((MediaQuery.of(context).size.width) * .15),
                          height: ((MediaQuery.of(context).size.height) * .05),
                          child: Checkbox(
                            value: check_tos,
                            onChanged: (bool value) {
                              setState(() {
                                check_tos = value;
                              });
                            },
                            activeColor: Color(0xffd7c9aa),
                          ),
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text('Tos',
                                  style: TextStyle(
                                      color: Color(0xff0d2a31),
                                      fontSize: 15.0)),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: ((MediaQuery.of(context).size.width) * .15),
                          height: ((MediaQuery.of(context).size.height) * .05),
                          child: Checkbox(
                            value: check_muscular,
                            onChanged: (bool value) {
                              setState(() {
                                check_muscular = value;
                              });
                            },
                            activeColor: Color(0xffd7c9aa),
                          ),
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text('Dolor Muscular',
                                  style: TextStyle(
                                      color: Color(0xff0d2a31),
                                      fontSize: 15.0)),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: ((MediaQuery.of(context).size.width) * .15),
                          height: ((MediaQuery.of(context).size.height) * .05),
                          child: Checkbox(
                            value: check_articulaciones,
                            onChanged: (bool value) {
                              setState(() {
                                check_articulaciones = value;
                              });
                            },
                            activeColor: Color(0xffd7c9aa),
                          ),
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text('Dolor en Articulaciones',
                                  style: TextStyle(
                                      color: Color(0xff0d2a31),
                                      fontSize: 15.0)),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: ((MediaQuery.of(context).size.width) * .15),
                          height: ((MediaQuery.of(context).size.height) * .05),
                          child: Checkbox(
                            value: check_garganta,
                            onChanged: (bool value) {
                              setState(() {
                                check_garganta = value;
                              });
                            },
                            activeColor: Color(0xffd7c9aa),
                          ),
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text('Dolor y/o Ardor de Garganta',
                                  style: TextStyle(
                                      color: Color(0xff0d2a31),
                                      fontSize: 15.0)),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: ((MediaQuery.of(context).size.width) * .15),
                          height: ((MediaQuery.of(context).size.height) * .05),
                          child: Checkbox(
                            value: check_moco,
                            onChanged: (bool value) {
                              setState(() {
                                check_moco = value;
                              });
                            },
                            activeColor: Color(0xffd7c9aa),
                          ),
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text('Escurrimiento Nasal',
                                  style: TextStyle(
                                      color: Color(0xff0d2a31),
                                      fontSize: 15.0)),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: ((MediaQuery.of(context).size.width) * .15),
                          height: ((MediaQuery.of(context).size.height) * .05),
                          child: Checkbox(
                            value: check_ojos,
                            onChanged: (bool value) {
                              setState(() {
                                check_ojos = value;
                              });
                            },
                            activeColor: Color(0xffd7c9aa),
                          ),
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text('Ojos Rojos, Llorosos',
                                  style: TextStyle(
                                      color: Color(0xff0d2a31),
                                      fontSize: 15.0)),
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: ((MediaQuery.of(context).size.height) * .05),
                      width: ((MediaQuery.of(context).size.width)),
                      decoration: BoxDecoration(
                        color: Color(0xffd7c9aa),
                      ),
                      child: Center(
                        child: Text('En los últimos 7 días tuvo:',
                            style: TextStyle(
                                color: Color(0xff0d2a31), fontSize: 15.0)),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: ((MediaQuery.of(context).size.width) * .15),
                          child: Checkbox(
                            value: viaje,
                            onChanged: (bool value) {
                              setState(() {
                                viaje = value;
                              });
                            },
                            activeColor: Color(0xffd7c9aa),
                          ),
                        ),
                        Container(
                          // height: ((MediaQuery.of(context).size.height) * .05),
                          child: Center(
                            child: Text(
                                'Viaje o estancia a Paises con tranmision \nLocal comunitariode COVID-19',
                                style: TextStyle(
                                    color: Color(0xff0d2a31), fontSize: 15.0)),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: ((MediaQuery.of(context).size.width) * .15),
                          child: Checkbox(
                            value: reunion,
                            onChanged: (bool value) {
                              setState(() {
                                reunion = value;
                              });
                            },
                            activeColor: Color(0xffd7c9aa),
                          ),
                        ),
                        Container(
                          child: Center(
                            child: Text(
                                'Haber estado en contacto con un caso\nconfirmado o bajo investigacion a \nCOVID-19.',
                                style: TextStyle(
                                    color: Color(0xff0d2a31), fontSize: 15.0)),
                          ),
                        )
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        String _otro;
                        String _edad;
                        String _name;
                        _getCurrentLocation();
                        if (_controllerNombre.text.isNotEmpty) {
                          _name = _controllerNombre.text.toUpperCase();
                        } else {
                          _name = "null";
                        }
                        if (_controllerEdad.text.isNotEmpty) {
                          _edad = _controllerEdad.text.toUpperCase();
                        } else {
                          _edad = "null";
                        }
                        if (_controllerOtro.text.isNotEmpty) {
                          _otro = _controllerOtro.text.toUpperCase();
                        } else {
                          _otro = "null";
                        }
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text('Presiona para Confirmar:'),
                          duration: Duration(milliseconds: 3000),
                          backgroundColor: Color(0xff92140c),
                          action: SnackBarAction(
                            label: 'Confirmar',
                            textColor: Color(0xffffffff),
                            onPressed: () {
                              int _fiebretoscabeza = 0;
                              int _unode = 0;
                              int _viaje = 0;
                              int _dia  = DateTime.now().day;
                              int _mes  = DateTime.now().month;
                              int _year  = DateTime.now().year;
                              if (check_respirato || check_toracico) {
                                Firestore.instance
                                    .collection('encuestas')
                                    .document()
                                    .setData({
                                      'dia':  _dia,
                                      'mes':  _mes,
                                      'year':  _year,
                                  'distrito': '$_currentLocality',
                                  'cp': '$_currentCp',
                                  'estado': '$_currentEstado',
                                  'latitud': '$_lati',
                                  'longitud': '$_longi',
                                  'nombre': '$_name',
                                  'edad': '$_edad',
                                  'sexo': '$sex',
                                  'check_cancer': check_cancer,
                                  'check_cardi': check_cardi,
                                  'check_diabetes': check_diabetes,
                                  'check_gesta': check_gesta,
                                  'check_embara': check_embara,
                                  'check_pulm': check_pulm,
                                  'check_vih': check_vih,
                                  'otro': '$_otro',
                                  'check_toracico': check_toracico,
                                  'check_respirato': check_respirato,
                                  'check_fiebre': check_fiebre,
                                  'check_cabeza': check_cabeza,
                                  'check_tos': check_tos,
                                  'check_muscular': check_muscular,
                                  'check_articulaciones': check_articulaciones,
                                  'check_garganta': check_garganta,
                                  'check_moco': check_moco,
                                  'check_ojos': check_ojos,
                                  'viaje': viaje,
                                  'reunion': reunion,
                                  'res': 2,
                                });
                                showModalBottomSheet(
                                    backgroundColor: Color.fromRGBO(0, 0, 0, 0),
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return Urgencias(
                                          userRepository: _userRepository);
                                    });
                              } else {
                                if (check_fiebre) _fiebretoscabeza++;
                                if (check_cabeza) _fiebretoscabeza++;
                                if (check_tos) _fiebretoscabeza++;
                                if (check_muscular) _unode++;
                                if (check_articulaciones) _unode++;
                                if (check_garganta) _unode++;
                                if (check_moco) _unode++;
                                if (check_ojos) _unode++;
                                if (viaje) _viaje++;
                                if (reunion) _viaje++;
                                if (_fiebretoscabeza >= 2) {
                                  if (_unode >= 1) {
                                    if (_viaje >= 1) {
                                      Firestore.instance
                                          .collection('encuestas')
                                          .document()
                                          .setData({
                                          'dia':  _dia,
                                      'mes':  _mes,
                                      'year':  _year,
                                        'distrito': '$_currentLocality',
                                        'cp': '$_currentCp',
                                        'estado': '$_currentEstado',
                                        'latitud': '$_lati',
                                        'longitud': '$_longi',
                                        'res': 1,
                                        'saludo': 'hola',
                                        'nombre': '$_name',
                                        'edad': '$_edad',
                                        'sexo': '$sex',
                                        'check_cancer': check_cancer,
                                        'check_cardi': check_cardi,
                                        'check_diabetes': check_diabetes,
                                        'check_gesta': check_gesta,
                                        'check_embara': check_embara,
                                        'check_pulm': check_pulm,
                                        'check_vih': check_vih,
                                        'otro': '$_otro',
                                        'check_toracico': check_toracico,
                                        'check_respirato': check_respirato,
                                        'check_fiebre': check_fiebre,
                                        'check_cabeza': check_cabeza,
                                        'check_tos': check_tos,
                                        'check_muscular': check_muscular,
                                        'check_articulaciones':
                                            check_articulaciones,
                                        'check_garganta': check_garganta,
                                        'check_moco': check_moco,
                                        'check_ojos': check_ojos,
                                        'viaje': viaje,
                                        'reunion': reunion,
                                      });
                                      showModalBottomSheet(
                                          backgroundColor:
                                              Color.fromRGBO(0, 0, 0, 0),
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (context) {
                                            return Sospecha(
                                                userRepository:
                                                    _userRepository);
                                          });
                                    } else {
                                      Firestore.instance
                                          .collection('encuestas')
                                          .document()
                                          .setData({
                                              'dia':  _dia,
                                      'mes':  _mes,
                                      'year':  _year,
                                        'distrito': '$_currentLocality',
                                        'cp': '$_currentCp',
                                        'estado': '$_currentEstado',
                                        'latitud': '$_lati',
                                        'longitud': '$_longi',
                                        'res': 1,
                                        'saludo': 'hola',
                                        'nombre': '$_name',
                                        'edad': '$_edad',
                                        'sexo': '$sex',
                                        'check_cancer': check_cancer,
                                        'check_cardi': check_cardi,
                                        'check_diabetes': check_diabetes,
                                        'check_gesta': check_gesta,
                                        'check_embara': check_embara,
                                        'check_pulm': check_pulm,
                                        'check_vih': check_vih,
                                        'otro': '$_otro',
                                        'check_toracico': check_toracico,
                                        'check_respirato': check_respirato,
                                        'check_fiebre': check_fiebre,
                                        'check_cabeza': check_cabeza,
                                        'check_tos': check_tos,
                                        'check_muscular': check_muscular,
                                        'check_articulaciones':
                                            check_articulaciones,
                                        'check_garganta': check_garganta,
                                        'check_moco': check_moco,
                                        'check_ojos': check_ojos,
                                        'viaje': viaje,
                                        'reunion': reunion,
                                      });
                                      showModalBottomSheet(
                                          backgroundColor:
                                              Color.fromRGBO(0, 0, 0, 0),
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (context) {
                                            return Sospecha(
                                                userRepository:
                                                    _userRepository);
                                          });
                                    }
                                  } else {
                                    print('Cuidate');
                                    Firestore.instance
                                        .collection('encuestas')
                                        .document()
                                        .setData({
                                            'dia':  _dia,
                                      'mes':  _mes,
                                      'year':  _year,
                                      'distrito': '$_currentLocality',
                                      'cp': '$_currentCp',
                                      'estado': '$_currentEstado',
                                      'latitud': '$_lati',
                                        'longitud': '$_longi',
                                      'res': 0,
                                      'saludo': 'hola',
                                      'nombre': '$_name',
                                      'edad': '$_edad',
                                      'sexo': '$sex',
                                      'check_cancer': check_cancer,
                                      'check_cardi': check_cardi,
                                      'check_diabetes': check_diabetes,
                                      'check_gesta': check_gesta,
                                      'check_embara': check_embara,
                                      'check_pulm': check_pulm,
                                      'check_vih': check_vih,
                                      'otro': '$_otro',
                                      'check_toracico': check_toracico,
                                      'check_respirato': check_respirato,
                                      'check_fiebre': check_fiebre,
                                      'check_cabeza': check_cabeza,
                                      'check_tos': check_tos,
                                      'check_muscular': check_muscular,
                                      'check_articulaciones':
                                          check_articulaciones,
                                      'check_garganta': check_garganta,
                                      'check_moco': check_moco,
                                      'check_ojos': check_ojos,
                                      'viaje': viaje,
                                      'reunion': reunion,
                                    });
                                    showModalBottomSheet(
                                        backgroundColor:
                                            Color.fromRGBO(0, 0, 0, 0),
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (context) {
                                          return Warnin(
                                              userRepository: _userRepository);
                                        });
                                  }
                                } else {
                                  print('Cuidate');
                                  Firestore.instance
                                      .collection('encuestas')
                                      .document()
                                      .setData({
                                          'dia':  _dia,
                                      'mes':  _mes,
                                      'year':  _year,
                                    'distrito': '$_currentLocality',
                                    'cp': '$_currentCp',
                                    'estado': '$_currentEstado',
                                    'latitud': '$_lati',
                                        'longitud': '$_longi',
                                    'res': 0,
                                    'saludo': 'hola',
                                    'nombre': '$_name',
                                    'edad': '$_edad',
                                    'sexo': '$sex',
                                    'check_cancer': check_cancer,
                                    'check_cardi': check_cardi,
                                    'check_diabetes': check_diabetes,
                                    'check_gesta': check_gesta,
                                    'check_embara': check_embara,
                                    'check_pulm': check_pulm,
                                    'check_vih': check_vih,
                                    'otro': '$_otro',
                                    'check_toracico': check_toracico,
                                    'check_respirato': check_respirato,
                                    'check_fiebre': check_fiebre,
                                    'check_cabeza': check_cabeza,
                                    'check_tos': check_tos,
                                    'check_muscular': check_muscular,
                                    'check_articulaciones':
                                        check_articulaciones,
                                    'check_garganta': check_garganta,
                                    'check_moco': check_moco,
                                    'check_ojos': check_ojos,
                                    'viaje': viaje,
                                    'reunion': reunion,
                                  });
                                  showModalBottomSheet(
                                      backgroundColor:
                                          Color.fromRGBO(0, 0, 0, 0),
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (context) {
                                        return Warnin(
                                            userRepository: _userRepository);
                                      });
                                }
                              }

                              print('Limpiando');
                              check_cancer = false;
                              check_cardi = false;
                              check_diabetes = false;
                              check_gesta = false;
                              check_embara = false;
                              check_pulm = false;
                              check_vih = false;
                              check_toracico = false;
                              check_respirato = false;
                              check_fiebre = false;
                              check_cabeza = false;
                              check_tos = false;
                              check_muscular = false;
                              check_articulaciones = false;
                              check_garganta = false;
                              check_moco = false;
                              check_ojos = false;
                              viaje = false;
                              reunion = false;
                              _controllerNombre.clear();
                              _controllerOtro.clear();
                              _controllerEdad.clear();
                            },
                          ),
                        ));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: ((MediaQuery.of(context).size.height) * .08),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0),
                          ),
                          color: Color(0xff0d2a31),
                        ),
                        child: Center(
                          child: Text(
                            'Enviar Encuesta',
                            style: GoogleFonts.doHyeon(
                                color: Color(0xffd7c9aa), fontSize: 20.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: ((MediaQuery.of(context).size.height) * .04),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentLocality = "${place.locality}";
        _currentCp = "${place.postalCode}";
        _currentEstado = "${place.administrativeArea}";
        _lati = "${_currentPosition.latitude}";
        _longi = "${_currentPosition.longitude}";
      });
    } catch (e) {
      print(e);
    }
  }
}
