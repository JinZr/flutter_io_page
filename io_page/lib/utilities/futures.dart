import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> futurePub() async {
  final response = await http.Client().get(Uri.parse(
      'https://raw.githubusercontent.com/JinZr/flutter_io_page/main/io_page/assets/texts/publication_list.json'));
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load update');
  }
}

Future<List<dynamic>> futureUpdate() async {
  final response = await http.get(Uri.parse(
      'https://raw.githubusercontent.com/JinZr/flutter_io_page/main/io_page/assets/texts/latest_update_list.json'));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body) as List;
    return data;
  } else {
    throw Exception('Failed to load update');
  }
}
