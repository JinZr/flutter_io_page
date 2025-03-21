import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List> futureUpdate() async {
  final response = await http.get(
      Uri(
        scheme: 'https',
        host: 'raw.githubusercontent.com',
        path:
            '/JinZr/flutter_io_page/main/io_page/assets/texts/latest_update_list.json',
      ),
      headers: {'Accept': 'application/json'});
  if (response.statusCode == 200) {
    return jsonDecode(response.body) as List;
  } else {
    throw Exception('Failed to load update.');
  }
}
