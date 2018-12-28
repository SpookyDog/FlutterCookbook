import 'package:flutter/material.dart';

class gridView extends StatelessWidget {
  Color getColor (int num){
    if((num % 2) == 0) {
      return Colors.red;
    }else {
      return Colors.blue;
    }
  }

List<Container> _buildGridTileList(int count){
  return List<Container>.generate(count,
      (int index) =>
        Container(width: 100.0, height: 100.0,
          decoration: BoxDecoration(color: getColor(index)),));
}

Widget buildGrid() {
  return GridView.extent(
    maxCrossAxisExtent: 150.0,
    padding: const EdgeInsets.all(4.0),
    mainAxisSpacing: 4.0,
    crossAxisSpacing: 4.0,
    children: _buildGridTileList(30),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView"),
      ),
      body: Center(
        child: buildGrid(),
      ),
    );
  }

}