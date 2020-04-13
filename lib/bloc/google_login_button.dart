import 'package:covi/main.dart';
import 'package:covi/bloc/registro/eserepo.dart';
import 'package:flutter/material.dart';

class Cancelar extends StatelessWidget {
  final UserRepository _userRepository;

  Cancelar({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => {
          Navigator.pop(context),
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyApp(userRepository: _userRepository),
            ),
          ),
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey)),
          ),
          child: ListTile(
            title: Text(
              'Continuar de forma anonima',
              style: TextStyle(
                color: Color(0xff000000),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
