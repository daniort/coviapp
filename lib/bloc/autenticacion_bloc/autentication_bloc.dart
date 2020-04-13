import 'package:bloc/bloc.dart';
import 'package:covi/bloc/autenticacion_bloc/bloc.dart';
import 'package:covi/bloc/registro/eserepo.dart';
import 'package:flutter/foundation.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  AuthenticationState get initialState => NoInicializado();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    }
    if (event is LoggedIn) {
      yield* _mapLoggedInToState();
    }
    if (event is LoggedOut) {
      yield* _mapLoggedOut();
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    try {
      final isSignedIn = await _userRepository.isSignedIn();
      if (isSignedIn) {
        final user = await _userRepository.getUser();
        yield Autenticado(user);
      } else {
        yield NoAutenticado();
      }
    } catch (_) {
      yield NoAutenticado();
    }
  }

  Stream<AuthenticationState> _mapLoggedInToState() async* {
    yield Autenticado(await _userRepository.getUser());
  }

  Stream<AuthenticationState> _mapLoggedOut() async* {
    yield NoAutenticado();
    _userRepository.signOut();
  }
}
