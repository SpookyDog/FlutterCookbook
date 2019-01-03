import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

class InternetImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = 'Web Images';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: <Widget>[
          FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: 'https://github.com/flutter/website/blob/master/src/_includes/code/layout/lakes/images/lake.jpg?raw=true',),
          FadeInImage.assetNetwork(
              placeholder: 'assets/loading.gif',
              image: 'https://github.com/flutter/plugins/raw/master/packages/video_player/doc/demo_ipod.gif?raw=true'),
          CachedNetworkImage(
            placeholder: CircularProgressIndicator(),
            imageUrl: 'https://github.com/flutter/website/blob/master/src/_includes/code/layout/lakes/images/lake.jpg?raw=true',)
        ],
      ),
    );
  }
}