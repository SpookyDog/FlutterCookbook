class Content {
  String title;
  String routeName;

  Content({
   this.title,
   this.routeName
  });

  factory Content.fromJson(Map<String, dynamic> parsedJson) {
    return Content(
      title: parsedJson['contentTitle'],
      routeName: parsedJson['routeName']
    );
  }
}