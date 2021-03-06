import 'package:appsena/widgets/background.dart';
import 'package:appsena/widgets/card.dart';
import 'package:appsena/widgets/lateral.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SENA"),
        centerTitle: true,
        backgroundColor: Colors.orange.shade700,
      ),
      drawer: laterarl(),
      body: Stack(
        alignment: Alignment.center,
        children: [Background(), CardImg()],
      ),
    );
  }
}
