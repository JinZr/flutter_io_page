import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:zr_jin_page/modal/pub_item.dart';

class PubProvider with ChangeNotifier, DiagnosticableTreeMixin {
  late List<PublicationItem> _result;

  List get result => _result;

  void setResult(List<PublicationItem> value) {
    _result = value;
    notifyListeners();
  }
}

Future<String> futurePub() async {
  final response = await http.get(
      Uri(
        scheme: 'https',
        host: 'raw.githubusercontent.com',
        path:
            '/JinZr/flutter_io_page/main/io_page/assets/texts/publication_list.json',
      ),
      headers: {'Accept': 'application/json'});
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load publications.');
  }
}

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
