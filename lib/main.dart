import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
import 'dart:async' show Future;
import 'dart:convert';

import 'model/content.dart';
import 'model/topic.dart';
import 'layoutExamples/basicColumnRow.dart';
import 'layoutExamples/gridView.dart';
import 'layoutExamples/listView.dart';
import 'animations/animatedList.dart';
import 'animations/fadeDemo.dart';
import 'designs/drawer.dart';
import 'designs/snackDemo.dart';
import 'designs/tabbarDemo.dart';
import 'navigation/widgetTransition.dart';
import 'navigation/navigateToAndFrom.dart';
import 'navigation/bringBackData.dart';
import 'network/fetchData.dart';
import 'util/util.dart';

const KEY_FILE_TOPICS = 'topics.json';

Future<TopicList> _loadTopics() async {
  Util util = new Util();
  String jsonString = await util.loadStringFromFile(KEY_FILE_TOPICS);
  final jsonResponse = json.decode(jsonString.toString());

  return TopicList.fromJson(jsonResponse);
}

void main() async {
  final TopicList topicList = await _loadTopics();

  runApp(MaterialApp(
    title: 'Flutter Cookbook',
    theme: ThemeData(
      primarySwatch: Colors.deepPurple,
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => MyApp(title: 'Flutter CookBook', topics: topicList.topics),
      '/layoutExamples/basicColumnRow': (context) => BasicColumnRow(),
      '/layoutExamples/gridView' : (context) => gridView(),
      '/layoutExamples/listView' : (context) => ColorsDemo(),
      '/animations/animatedList' : (context) => AnimatedListSample(),
      '/animations/fadeDemo'     : (context) => FadeDemo(),
      '/designs/drawer'          : (context) => DrawerDemo(),
      //'/designs/snackDemo'       : (context) => SnackBarPage(),
      '/designs/tabbarDemo'      : (context) => TabBarDemo(),
      '/navigation/widgetTransition' : (context) => MainScreen(),
      '/navigation/navigateToAndFrom': (context) => FirstScreen(),
      '/navigation/bringBackData'    : (context) => HomeScreen(),
      '/network/fetchData'      : (context) => FetchData(),
    },
  ));
}

class MyApp extends StatelessWidget {
  final String title;
  final List<Topic> topics;

  MyApp({Key key, @required this.title, @required this.topics}) :super(key:key);

  @override
  Widget build(BuildContext context) {
    final listInfo = _getListInformation(topics);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(

        itemCount: listInfo.item1,
        itemBuilder: (context, index) {
          Tuple2<int, int> indexes = listInfo.item3[index];

          Topic topic = topics[listInfo.item2.indexOf(indexes.item1)];

          if(listInfo.item2.contains(index)) {
            return ListTile(
              title: Text(
              topic.title,
              style: Theme.of(context).textTheme.headline),
            );
          } else {
            Content content = topic.contentList[indexes.item2];

            return ListTile(
              title: Text(content.title),
              onTap: () {
                Navigator.pushNamed(context, topic.routeName + content.routeName);
              },
            );
          }
        },
      ),
    );
  }
}

Tuple3<int, List, List> _getListInformation(List<Topic> topicList) {
  int counter = 0;
  List headerIndexes = new List();
  List<Tuple2<int,int>> indexes = new List();

  topicList.forEach((topic) {
    headerIndexes.add(counter);
    indexes.add(Tuple2(counter,counter));

    int i = 0;
    topic.contentList.forEach((content) {
      indexes.add(Tuple2(counter, i));

      i++;
    });

    counter++;
    counter = counter + topic.contentList.length;
  });

  return Tuple3(counter, headerIndexes, indexes);
}