import 'dart:convert';

import 'package:appsena/vistas/lista.dart';
import 'package:appsena/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Loerem extends StatefulWidget {
  String valor;

  Loerem(this.valor);

  @override
  State<Loerem> createState() => _CardcursosState();
}

class _CardcursosState extends State<Loerem> {
  getMethod() async {
    String theUrl = "http://10.0.2.2/bd/lorem.php?id_cursos=" + widget.valor;
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
            return ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Card(
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
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          snap?[index]['desc_curso'],
                          style: Theme.of(context).textTheme.subtitle1,
                          textAlign: TextAlign.center,
                        ),
                      ]),
                    ));
                ;
              },
            );
          },
        ));
  }
}
