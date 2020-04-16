import 'package:covi/bloc/autenticacion_bloc/bloc.dart';
import 'package:covi/bloc/simple_bloc_delegate.dart';
import 'package:covi/main.dart';
import 'package:bloc/bloc.dart';
import 'package:covi/menu_lateral/continuar.dart';
import 'package:covi/menu_lateral/menu_wid.dart';
import 'package:covi/bloc/registro/eserepo.dart';
import 'package:covi/wid_factores/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();

  final UserRepository userRepository = UserRepository();
  runApp(BlocProvider(
    create: (context) =>
        AuthenticationBloc(userRepository: userRepository)..add(AppStarted()),
    child: App(userRepository: userRepository),
  ));
}

class App extends StatelessWidget {
  final UserRepository _userRepository;

  App({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is NoInicializado) {
            var myApp = MyApp(
              userRepository: _userRepository,
            );
            return myApp;
          }
          if (state is Autenticado) {
            return Encuesta();
            //HomeScreen(
            //name: state.displayName,
            //userRepository: _userRepository,
            //);
          }
          if (state is NoAutenticado) {
            return LoginScreen(
              userRepository: _userRepository,
            );
          }
          return Container();
        },
      ),
    );
  }
}
