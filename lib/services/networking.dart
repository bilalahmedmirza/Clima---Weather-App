import 'dart:convert';
import 'package:http/http.dart';

class NetworkHelper {
  String url;

  NetworkHelper({required this.url});

  Future getData() async {
    Response response = await get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      // ignore: avoid_print
      print(response.statusCode);
    }
  }
}
