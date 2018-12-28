import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class Util {
  Future<String> loadStringFromFile(String fileName) async {
    return await rootBundle.loadString('assets/$fileName');
  }
}