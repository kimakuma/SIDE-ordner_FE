/* API 함수 */

import 'dart:convert';

import 'package:http/http.dart' as http;

// API 연결
// GET
// Future<Map<String, dynamic>> APIGet({required String path, required dynamic params}) async {
//   String url = "3.34.95.168$path";
//   try {
//     http.Response response = await http.get(Uri.parse(url), headers: {
//       "accept": "application/json",
//       "Content-Type": "application/json",
//     });

//     try {
//       Map<String, dynamic> resBody =
//           jsonDecode(utf8.decode(response.bodyBytes));
//       resBody['statusCode'] = response.statusCode;

//       return resBody;
//     } catch (e) {
//       return {'statusCode': 490};
//     }
//   } catch (e) {
//     // 서버가 응답하지 않는 경우
//     debugPrint("httpGet error: $e");
//     return {'statusCode': 503};
//   }
// }

Future<Map<String, dynamic>> APIPost(
    {required String path, dynamic params}) async {
  String url = "http://3.34.95.168:9600$path";

  try {
    print(jsonEncode(params));
    http.Response response =
        await http.post(Uri.parse(url), body: jsonEncode(params), headers: {
      "accept": "application/json",
      "Content-Type": "application/json",
    });

    return jsonDecode(response.body);
  } catch (e) {
    print("httpPost error: $e");
    return {"status": 503};
  }
}


// Future<int> httpPut({required String path, Map? data}) async {
//   String baseUrl = 'https://Url 입력하세요$path';
//   var body = jsonEncode(data);
//   try {
//     http.Response response =
//         await http.post(Uri.parse(baseUrl), body: body, headers: {
//       "accept": "application/json",
//       "Content-Type": "application/json",
//     });
//     return response.statusCode;
//   } catch (e) {
//     debugPrint("httpPut error: $e");
//     return 503;
//   }
// }

// Future<int> httpDelete({required String path, Map? data}) async {
//   String baseUrl = 'https://Url 입력하세요$path';
//   var body = jsonEncode(data);
//   try {
//     http.Response response =
//         await http.delete(Uri.parse(baseUrl), body: body, headers: {
//       "accept": "application/json",
//       "Content-Type": "application/json",
//     });
//     return response.statusCode;
//   } catch (e) {
//     debugPrint("httpDelete error: $e");

//     return 503;
//   }
// }