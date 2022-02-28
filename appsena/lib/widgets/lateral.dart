import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class laterarl extends StatelessWidget {
  const laterarl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            height: 200,
            child: CircleAvatar(
              backgroundColor: Colors.orange.shade700,
              child: Text('JV', style: TextStyle(fontSize: 50)),
            ),
          )
        ],
      ),
    ));
  }
}
