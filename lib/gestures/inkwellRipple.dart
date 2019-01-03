import 'package:flutter/material.dart';

class InkwellGestureDemo extends StatelessWidget {
  final String title = "InkWell Demo";

  InkwellGestureDemo({Key key, title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(child: MyButton()),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Tap'),
        ));
      },
      child: Container(
        padding: EdgeInsets.all(12.0),
        width: 200.0,
        height: 150.0,
        child: Text('Flat Button', textAlign: TextAlign.center),
      ),
    );
  }
}