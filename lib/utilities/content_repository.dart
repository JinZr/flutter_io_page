import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;

class ContentRepository {
  ContentRepository({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;
  final Map<String, List<dynamic>> _localCache = {};
  final Map<String, List<dynamic>> _remoteCache = {};
  final Map<String, Future<List<dynamic>>> _remoteInFlight = {};

  static final ContentRepository instance = ContentRepository();

  static const String _basePath =
      '/JinZr/flutter_io_page/refs/heads/main/assets/texts/';

  Future<List<dynamic>> loadLocalList(String fileName) async {
    if (_localCache.containsKey(fileName)) {
      return _localCache[fileName]!;
    }
    final assetPath = 'assets/texts/$fileName';
    try {
      final jsonString = await rootBundle.loadString(assetPath);
      final data = jsonDecode(jsonString) as List<dynamic>;
      _localCache[fileName] = data;
      return data;
    } on Error catch (error) {
      throw StateError('Missing bundled asset: $assetPath\n$error');
    }
  }

  Future<List<dynamic>> loadRemoteList(
    String fileName, {
    Duration timeout = const Duration(seconds: 4),
  }) {
    if (_remoteCache.containsKey(fileName)) {
      return Future.value(_remoteCache[fileName]!);
    }

    return _remoteInFlight.putIfAbsent(fileName, () async {
      final uri = Uri(
        scheme: 'https',
        host: 'raw.githubusercontent.com',
        path: '$_basePath$fileName',
      );

      final response = await _client
          .get(uri, headers: const {'Accept': 'application/json'})
          .timeout(timeout);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List<dynamic>;
        _remoteCache[fileName] = data;
        return data;
      }
      throw Exception('Failed to load $fileName: ${response.statusCode}');
    });
  }
}
