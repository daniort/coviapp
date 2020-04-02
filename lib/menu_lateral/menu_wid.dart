import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(color: Color(0xFF0d2a31)),
        child: new ListView(
          children: <Widget>[
            Container(
              child: UserAccountsDrawerHeader(
                accountName: Text("Guillermo García"),
                accountEmail: Text("email@prueba.es"),
                currentAccountPicture:
                    CircleAvatar(backgroundColor: Color(0XFFF0F3F5)),
                decoration: BoxDecoration(
                  color: Color(0xff19535f),
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.grey)),
                    ),
                    child: ListTile(
                      title: Text('Factores de Riesgo'),
                      leading: Icon(Icons.priority_high),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.grey)),
                    ),
                    child: ListTile(
                      title: Text('Signos y Sintomas'),
                      leading: Icon(Icons.sentiment_dissatisfied),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.grey)),
                    ),
                    child: ListTile(
                      title: Text('Recomendaciones'),
                      leading: Icon(Icons.sort),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.grey)),
                    ),
                    child: ListTile(
                      title: Text('Enlaces prioritarios'),
                      leading: Icon(Icons.phone_android),
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
