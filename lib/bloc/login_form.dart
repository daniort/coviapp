import 'package:covi/bloc/autenticacion_bloc/bloc.dart';
import 'package:covi/bloc/login_bloc/bloc.dart';
import 'package:covi/bloc/registro/eserepo.dart';
import 'package:covi/bloc/registro/register_scream.dart';
import 'package:covi/wid_factores/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  final UserRepository _userRepository;
  

  LoginForm(
      {Key key, @required UserRepository userRepository})
      
      : _userRepository = userRepository;
      

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginBloc _loginBloc;

  UserRepository get _userRepository => widget._userRepository;

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isLoginButtonEnabled(LoginState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  String user='null';

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocListener<LoginBloc, LoginState>(listener: (context, state) {
        // tres casos, tres if:
        if (state.isFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Login Failure'), Icon(Icons.error)],
                ),
                backgroundColor: Colors.red,
              ),
            );
        }
        if (state.isSubmitting) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Iniciando... '),
                  CircularProgressIndicator(),
                ],
              ),
            ));
        }
        if (state.isSuccess) {
          setState(() {
            user= _emailController.text;
          });
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Encuesta(),
            ),
          );
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
        }
      }, child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Container(
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
                            style:
                                TextStyle(color: Colors.blueGrey, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(top: BorderSide(color: Colors.grey)),
                      ),
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          icon: Icon(Icons.email), labelText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                      autovalidate: true,
                      autocorrect: false,
                      validator: (_) {
                        return !state.isEmailValid ? 'Email Incorrecto' : null;
                      },
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                          icon: Icon(Icons.lock), labelText: 'Contraseña'),
                      obscureText: true,
                      autovalidate: true,
                      autocorrect: false,
                      validator: (_) {
                        return !state.isPasswordValid
                            ? 'Invalid Password'
                            : null;
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            child: RaisedButton(
                              color: Color(0xffd7c9aa),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              onPressed: isLoginButtonEnabled(state)
                                  ? _onFormSubmitted
                                  : null,
                              child: Text('Ingresar'),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Color(0xffd7c9aa),
                                  borderRadius: BorderRadius.circular(25.0)),
                              child: FlatButton(
                                child: Text('Crear una Cuenta'),
                                onPressed: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return RegisterScreen(
                                        userRepository: _userRepository);
                                  }));
                                },
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border:
                                  Border(top: BorderSide(color: Colors.grey)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: InkWell(
                              onTap: () => {
                                Navigator.pop(context),
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Encuesta(),
                                  ),
                                ),
                              },
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Color(0xffd7c9aa),
                                    borderRadius: BorderRadius.circular(25.0)),
                                child: Center(
                                  child: Text(
                                    'Continuar como Anónimo',
                                    style: TextStyle(
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border:
                                    Border(top: BorderSide(color: Colors.grey)),
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
        },
      )),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    _loginBloc.add(EmailChanged(email: _emailController.text));
  }

  void _onPasswordChanged() {
    _loginBloc.add(PasswordChanged(password: _passwordController.text));
  }

  void _onFormSubmitted() {
    _loginBloc.add(LoginWithCredentialsPressed(
        email: _emailController.text, password: _passwordController.text));
  }

  getUser() {
    if(user=='null'){
        return null;
    }else{
      return user.toString();
    }
  }
}
