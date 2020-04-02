import 'package:covi/menu_lateral/menu_wid.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff19535f),
        secondaryHeaderColor: Color(0xff38786a),
        accentColor: Colors.green,
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              snap: false,
              flexibleSpace: FlexibleSpaceBar(
                  stretchModes: <StretchMode>[
                    StretchMode.zoomBackground,
                    StretchMode.blurBackground,
                    StretchMode.fadeTitle,
                  ],
                  title: Text('Covid Report'),
                  centerTitle: false,
                  background: Image.network(
                    "https://image.freepik.com/free-photo/3d-render-conceptual-pandemic-epidemic-virus-medical-health-vaccine-research-microscopic-magnification-green-corona-virus-2019-ncov-outbreak-forms-like-sars-mers-can-be-lethal_166094-85.jpg",
                    fit: BoxFit.cover,
                  )),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                ListTile(
                  leading: Icon(Icons.volume_off),
                  title: Text("Volume Off"),
                ),
                ListTile(
                    leading: Icon(Icons.volume_down),
                    title: Text("Volume Down")),
                ListTile(
                    leading: Icon(Icons.volume_mute),
                    title: Text("Volume Mute")),
                ListTile(
                    leading: Icon(Icons.volume_mute),
                    title: Text("Volume Mute")),
                ListTile(
                    leading: Icon(Icons.volume_mute),
                    title: Text("Volume Mute")),
                ListTile(
                    leading: Icon(Icons.volume_mute),
                    title: Text("Volume Mute")),
                ListTile(
                    leading: Icon(Icons.volume_mute),
                    title: Text("Volume Mute")),
                ListTile(
                    leading: Icon(Icons.volume_mute),
                    title: Text("Volume Mute")),
                ListTile(
                    leading: Icon(Icons.volume_mute),
                    title: Text("Volume Mute")),
                ListTile(
                    leading: Icon(Icons.volume_mute),
                    title: Text("Volume Mute")),
                ListTile(
                    leading: Icon(Icons.volume_mute),
                    title: Text("Volume Mute")),
                ListTile(
                    leading: Icon(Icons.volume_down),
                    title: Text("Volume Down")),
                ListTile(
                    leading: Icon(Icons.volume_down),
                    title: Text("Volume Down")),
                ListTile(
                    leading: Icon(Icons.volume_down),
                    title: Text("Volume Down")),
                ListTile(
                    leading: Icon(Icons.volume_down),
                    title: Text("Volume Down")),
                ListTile(
                    leading: Icon(Icons.volume_down),
                    title: Text("Volume Down")),
                ListTile(
                    leading: Icon(Icons.volume_down),
                    title: Text("Volume Down")),
                ListTile(
                    leading: Icon(Icons.volume_down),
                    title: Text("Volume Down")),
                ListTile(
                    leading: Icon(Icons.volume_down),
                    title: Text("Volume Down")),
                ListTile(
                    leading: Icon(Icons.volume_down),
                    title: Text("Volume Down")),
                ListTile(
                    leading: Icon(Icons.volume_down),
                    title: Text("Volume Down")),
                ListTile(
                    leading: Icon(Icons.volume_down),
                    title: Text("Volume Down")),
                ListTile(
                    leading: Icon(Icons.volume_down),
                    title: Text("Volume Down")),
                ListTile(
                    leading: Icon(Icons.volume_down),
                    title: Text("Volume Down")),
                ListTile(
                    leading: Icon(Icons.volume_down),
                    title: Text("Volume Down")),
              ]),
            )
          ];
        },
        body: Center(
          child: Text("Sample Text"),
        ),
      ),
      drawer: Menu(),
    );
  }
}
