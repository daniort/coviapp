import 'package:covi/bloc/autenticacion_bloc/bloc.dart';
import 'package:covi/bloc/register_bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  RegisterBloc _registerBloc;

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isRegisterButtonEnabled(RegisterState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    super.initState();
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
      // Si estado es submitting
      if (state.isSubmitting) {
        Scaffold.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Registrando'),
                CircularProgressIndicator()
              ],
            ),
          ));
      }
      // Si estado es success
      if (state.isSuccess) {
        BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
        Navigator.of(context).pop();
      }
      // Si estado es failure
      if (state.isFailure) {
        Scaffold.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[Text('Registro Fallido'), Icon(Icons.error)],
            ),
            backgroundColor: Colors.red,
          ));
      }
    }, child: BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            child: ListView(
              children: <Widget>[
                // Un textForm para email
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    labelText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  autovalidate: true,
                  validator: (_) {
                    return !state.isEmailValid ? 'Email Invalido' : null;
                  },
                ),
                // Un textForm para password
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      icon: Icon(Icons.lock), labelText: 'Contraseña'),
                  obscureText: true,
                  autocorrect: false,
                  autovalidate: true,
                  validator: (_) {
                    return !state.isPasswordValid
                        ? 'Contraseña Invalida'
                        : null;
                  },
                ),
                RaisedButton(
                  color: Color(0xffd7c9aa),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  onPressed:
                      isRegisterButtonEnabled(state) ? _onFormSubmitted : null,
                  child: Text('Registrar'),
                ),

                 Container(
                            decoration: BoxDecoration(
                              border:
                                  Border(top: BorderSide(color: Colors.grey)),
                            ),
                          ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    child: Center(
                      child: Text(
                        'Es preferible que te registres con un correo existente y que tengas acceso a él.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ));
  }

  void _onEmailChanged() {
    _registerBloc.add(EmailChanged(email: _emailController.text));
  }

  void _onPasswordChanged() {
    _registerBloc.add(PasswordChanged(password: _passwordController.text));
  }

  void _onFormSubmitted() {
    _registerBloc.add(Submitted(
        email: _emailController.text, password: _passwordController.text));
  }
}
