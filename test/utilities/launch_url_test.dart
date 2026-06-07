import 'package:flutter_test/flutter_test.dart';

import 'package:zr_jin_page/utilities/launch_url.dart';

void main() {
  test('launchURL launches when checker allows', () async {
    var checkCalls = 0;
    var launchCalls = 0;

    final launched = await launchURL(
      'https://example.com',
      canLaunch: (_) async {
        checkCalls += 1;
        return true;
      },
      launch: (_) async {
        launchCalls += 1;
        return true;
      },
    );

    expect(launched, isTrue);
    expect(checkCalls, 1);
    expect(launchCalls, 1);
  });

  test('launchURL throws when checker rejects', () async {
    var launchCalls = 0;

    await expectLater(
      launchURL(
        'invalid://example',
        canLaunch: (_) async => false,
        launch: (_) async {
          launchCalls += 1;
          return true;
        },
      ),
      throwsA(equals('Could not launch invalid://example')),
    );

    expect(launchCalls, 0);
  });
}
