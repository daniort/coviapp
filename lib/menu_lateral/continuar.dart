import 'package:covi/bloc/autenticacion_bloc/bloc.dart';
import 'package:covi/bloc/registro/eserepo.dart';
import 'package:covi/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  final String name;
  final UserRepository _userRepository;

  HomeScreen(
      {Key key, @required UserRepository userRepository, @required this.name})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          InkWell(
            onTap: () => {
              Navigator.pop(context),
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyApp(
                    userRepository: _userRepository,
                  ),
                ),
              ),
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border(top: BorderSide(color: Color(0xff19535f))),
              ),
              child: ListTile(
                  title: Text(
                    'Continuar con esta cuenta',
                    style: TextStyle(color: Colors.black),
                  ),
                  leading:
                      FaIcon(FontAwesomeIcons.headSideVirus, color: Colors.white
                          //size: 30.0,
                          )),
            ),
          ),
          Container(
            child: Center(
              child: Text('Bienvenido $name!'),
            ),
          )
        ],
      ),
    );
  }
}
