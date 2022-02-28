import 'dart:convert';

import 'package:appsena/vistas/lista.dart';
import 'package:appsena/vistas/lorem.dart';
import 'package:appsena/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Cardcursos extends StatefulWidget {
  String valor;

  Cardcursos(this.valor);

  @override
  State<Cardcursos> createState() => _CardcursosState();
}

class _CardcursosState extends State<Cardcursos> {
  getMethod() async {
    String theUrl =
        "http://10.0.2.2/bd/getcursos.php?id_fichas=" + widget.valor;
    var res = await http
        .get(Uri.parse(theUrl), headers: {"Accept": "application/json"});
    var responsBody = jsonDecode(res.body);
    print(responsBody);
    return responsBody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange.shade700,
        ),
        body: FutureBuilder(
          future: getMethod(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            List? snap = snapshot.data;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(child: Text("no se concectó"));
            }
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: snap?.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {
                      int id = snap?[index]['id_cursos'];
                      String valor = id.toString();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Loerem(valor);
                      }));
                    },
                    child: Card(
                        elevation: 10.0,
                        margin: EdgeInsets.all(14.0),
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Column(children: [
                            const SizedBox(
                              height: 10.1,
                            ),
                            Text(
                              snap?[index]['nombre'],
                              style: Theme.of(context).textTheme.subtitle1,
                              textAlign: TextAlign.center,
                            ),
                          ]),
                        )));
              },
            );
          },
        ));
  }
}
