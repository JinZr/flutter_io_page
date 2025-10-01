import 'dart:async';
import 'dart:convert';

import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;

const _basePath =
    '/JinZr/flutter_io_page/refs/heads/main/assets/texts/';

final Map<String, Future<List>> _jsonFutureCache = <String, Future<List>>{};

Future<List> loadRemoteJsonList(String fileName) {
  return _jsonFutureCache.putIfAbsent(fileName, () {
    final completer = Completer<List>();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      try {
        final response = await http.get(
          Uri(
            scheme: 'https',
            host: 'raw.githubusercontent.com',
            path: '$_basePath$fileName',
          ),
          headers: const {'Accept': 'application/json'},
        );
        if (response.statusCode == 200) {
          completer.complete(jsonDecode(response.body) as List);
        } else {
          throw Exception('Failed to load $fileName.');
        }
      } catch (error, stackTrace) {
        completer.completeError(error, stackTrace);
      }
    });
    return completer.future;
  });
}

Future<List> futureUpdate() => loadRemoteJsonList('selected_pub_list.json');

Future<List> futureAcademicService() =>
    loadRemoteJsonList('academic_service_list.json');
