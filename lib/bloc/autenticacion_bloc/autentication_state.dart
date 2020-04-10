import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class NoInicializado extends AuthenticationState {
  @override
  String toString() => 'No inicializado';
}

class Autenticado extends AuthenticationState {
  final String displayName;

  const Autenticado(this.displayName);

  @override
  List<Object> get props => [displayName];

  @override
  String toString() => 'Autenticado - displayName :$displayName';
}

class NoAutenticado extends AuthenticationState {
  @override
  String toString() => 'No Autenticado';
}
