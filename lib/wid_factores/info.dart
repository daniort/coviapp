import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff19535f),
      appBar: AppBar(
        title: Text('Mas Información'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: ((MediaQuery.of(context).size.height)),
          width: ((MediaQuery.of(context).size.width)),
          decoration: BoxDecoration(
            color: Color(0xfff0f3f5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Container(
                  height: ((MediaQuery.of(context).size.height) * 0.05),
                  child: Center(
                    child: Text('Desarrollada por:',
                        style: GoogleFonts.doHyeon(
                            color: Colors.blueGrey, fontSize: 18.0)),
                  ),
                ),
              ),
              Container(
                height: ((MediaQuery.of(context).size.height) * 0.2),
                child: CachedNetworkImage(
                  imageUrl:
                      "http://ntrzacatecas.com/content/uploads/2019/09/upsz-1-1.jpg",
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Container(
                  height: ((MediaQuery.of(context).size.height) * 0.05),
                  child: Center(
                    child: Text('Bajo Licencia GPL 3.0',
                        style: GoogleFonts.doHyeon(
                            color: Color(0xff19535f), fontSize: 18.0)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                child: Center(
                  child: Text('Desarrolladores:',
                      style: GoogleFonts.doHyeon(
                          color: Colors.blueGrey, fontSize: 14.0)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Center(
                  child: Text('Juan José Pelaez Villegas',
                      style: GoogleFonts.doHyeon(
                          color: Colors.blueGrey, fontSize: 18.0)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Center(
                  child: Text('Daniel Ortiz Castro',
                      style: GoogleFonts.doHyeon(
                          color: Colors.blueGrey, fontSize: 18.0)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                child: Center(
                  child: Text('Asesores Médicos:',
                      style: GoogleFonts.doHyeon(
                          color: Colors.blueGrey, fontSize: 14.0)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Center(
                  child: Text('Sandy Sierra',
                      style: GoogleFonts.doHyeon(
                          color: Colors.blueGrey, fontSize: 18.0)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Center(
                  child: Text('Manuel Escobar',
                      style: GoogleFonts.doHyeon(
                          color: Colors.blueGrey, fontSize: 18.0)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Center(
                  child: Text('Eduardo Gamez',
                      style: GoogleFonts.doHyeon(
                          color: Colors.blueGrey, fontSize: 18.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
