/* esConnector.dart */
import 'package:elastic_client/elastic_client.dart';

Future<Client> esConnector() async {
  print("Connecting to ES Server...");

  final transport = HttpTransport(url: 'http://100.200.100.152:17000/');
  final client = Client(transport);

  print("Connected ES Server");

  return client;
}