import 'package:flutter/material.dart';

class BasicColumnRow extends StatelessWidget {
  Container titleSection = new Container();
  Container buttonSection = new Container();
  Container textSection = new Container();

  @override
  Widget build(BuildContext context) {
    this.titleSection = titleContainer();
    this.buttonSection = buttonContainer(context);
    this.textSection = textContainer();

    final title = 'Column and Row';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: <Widget>[
          Image.asset('images/lake.jpg',
            width: 400.0,
            height: 240.0,
            fit: BoxFit.cover,
          ),
          titleSection,
          buttonSection,
          textSection,
        ],
      ),
    );
  }
  
  Container titleContainer () {
    return new Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text('Oeschinen Lake Campground',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text('Kandersteg, Switzerland',
                  style: TextStyle(color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red,
          ),
          Text('41'),
        ],
      ),
    );
  }

  Container buttonContainer (BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButtonColumn(Icons.call, 'CALL', context),
          buildButtonColumn(Icons.near_me, 'ROUTE', context),
          buildButtonColumn(Icons.share, 'SHARE', context),
        ],
      ),
    );
  }

  Container textContainer() {
    return Container(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        '''Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.''',
        softWrap: true,
      ),
    );
  }

  Column buildButtonColumn(IconData icon, String label, BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: color,),
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: Text(
            label,
            style: TextStyle(
              fontSize:  12.0,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

}