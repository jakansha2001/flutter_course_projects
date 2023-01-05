import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  final String url;

  ApiService({required this.url});

  Future<void> getData() async {
    http.Response response = await http.get(
      Uri.parse(
        url,
      ),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print('status code ${response.statusCode}');
    }
  }
}
