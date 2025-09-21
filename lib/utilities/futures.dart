import 'dart:convert';

import 'package:http/http.dart' as http;

const _basePath =
    '/JinZr/flutter_io_page/refs/heads/main/assets/texts/';

Future<List> loadRemoteJsonList(String fileName) async {
  final response = await http.get(
    Uri(
      scheme: 'https',
      host: 'raw.githubusercontent.com',
      path: '$_basePath$fileName',
    ),
    headers: {'Accept': 'application/json'},
  );
  if (response.statusCode == 200) {
    return jsonDecode(response.body) as List;
  } else {
    throw Exception('Failed to load $fileName.');
  }
}

Future<List> futureUpdate() => loadRemoteJsonList('selected_pub_list.json');

Future<List> futureAcademicService() =>
    loadRemoteJsonList('academic_service_list.json');
