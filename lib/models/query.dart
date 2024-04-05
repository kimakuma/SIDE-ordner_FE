import 'package:elastic_client/elastic_client.dart';
import 'package:foodplace/services/esConnector.dart';

Future<Map?> searchTest() async {
  final client = await esConnector();

  final result;
  
  result = await client.search(
    index: "v1-kms_data-048",
    type: "_doc",
    query: Query.matchAll(),
    source: "item_nm_ksk",
    size: 1
  );

  return result.toMap();
}