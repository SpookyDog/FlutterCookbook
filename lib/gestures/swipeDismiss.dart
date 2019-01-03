import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class SwipeDismiss extends StatefulWidget {
  SwipeDismiss({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SwipeDismissState();
  }
}

class SwipeDismissState extends State<SwipeDismiss> {
  final items = List<String>.generate(30, (i) => "Item ${i + 1}");

  @override
  Widget build(BuildContext context) {
    final title = 'Dismissing Items';
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return Dismissible(
              key: Key(item),
              onDismissed: (direction) {
                if(direction == DismissDirection.startToEnd) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text("$item dismissed left to right")));
                  setState(() {
                    items.removeAt(index);
                  });
                } else {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text("$item dismissed right to left")));
                  setState(() {
                    items.removeAt(index);
                  });
                }
              },

              background: Container(color: Colors.red),
              child: ListTile(title: Text("$item")),
            );
          },
      ),
    );
  }
}