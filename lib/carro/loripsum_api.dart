import 'package:http/http.dart' as http;

class LoripsumApi {
  static Future<String> getLoripsum() async {
    var url = "https://loripsum.net/api";

    var response = await http.get(url);

    String text = response.body;

    text = text.replaceAll("<p>", "").replaceAll("</p>", "");

    return text;
  }
}