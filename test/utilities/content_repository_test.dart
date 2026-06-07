import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import 'package:zr_jin_page/utilities/content_repository.dart';

void main() {
  test('loadRemoteList parses JSON and caches subsequent calls', () async {
    var requestCount = 0;
    final repo = ContentRepository(
      client: MockClient((request) async {
        requestCount += 1;
        return http.Response(
          jsonEncode([
            {'title': 'Cached Item'},
          ]),
          200,
        );
      }),
    );

    final first = await repo.loadRemoteList('selected_pub_list.json');
    final second = await repo.loadRemoteList('selected_pub_list.json');

    expect(requestCount, 1);
    expect(first, isNotEmpty);
    expect(first.first, isA<Map>());
    expect(second.first, isA<Map>());
  });

  test('loadRemoteList deduplicates in-flight requests', () async {
    var requestCount = 0;
    final repo = ContentRepository(
      client: MockClient((request) async {
        requestCount += 1;
        await Future<void>.delayed(const Duration(milliseconds: 50));
        return http.Response(
          jsonEncode([
            {'role': 'Service'},
          ]),
          200,
        );
      }),
    );

    final results = await Future.wait([
      repo.loadRemoteList('academic_service_list.json'),
      repo.loadRemoteList('academic_service_list.json'),
    ]);

    expect(requestCount, 1);
    expect(results[0], isNotEmpty);
    expect(results[1], isNotEmpty);
  });

  test('loadRemoteList throws on non-200 responses', () async {
    final repo = ContentRepository(
      client: MockClient((request) async => http.Response('error', 500)),
    );

    await expectLater(
      repo.loadRemoteList('selected_pub_list.json'),
      throwsA(isA<Exception>()),
    );
  });

  test('loadLocalList reports missing local assets', () async {
    final repo = ContentRepository(
      client: MockClient((request) async => http.Response('[]', 200)),
    );

    await expectLater(
      repo.loadLocalList('missing_file_for_test.json'),
      throwsA(isA<StateError>()),
    );
  });
}
