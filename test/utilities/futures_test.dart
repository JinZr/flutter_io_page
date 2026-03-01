import 'package:flutter_test/flutter_test.dart';

import 'package:zr_jin_page/utilities/futures.dart';

void main() {
  test(
    'loadCachedJsonList returns local bundled list for selected publications',
    () async {
      final result = await loadCachedJsonList('selected_pub_list.json');

      expect(result, isNotEmpty);
      expect(result.first, isA<Map>());
    },
  );

  test(
    'loadCachedJsonList returns local bundled list for academic services',
    () async {
      final result = await loadCachedJsonList('academic_service_list.json');

      expect(result, isNotEmpty);
      expect(result.first, isA<Map>());
    },
  );
}
