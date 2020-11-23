import 'package:html/parser.dart';

class Helper {
  static String removeHTMLTag(String text) {
    final document = parse(text);
    final String parsedString = parse(document.body.text).documentElement.text;

    return parsedString;
  }
}