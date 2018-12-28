import 'package:flutter/material.dart';

//in progress

class SnackBarPage extends StatelessWidget {
  final String title = "SnackBar Demo";

  SnackBarPage({Key key, title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text(title),
       ),
    body: Center(
      child: RaisedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: Text('Yay! A SnackBar!'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: (){

              }),
          );
          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: Text('Show SnackBar'),
      ),
    ),
    );
  }

}