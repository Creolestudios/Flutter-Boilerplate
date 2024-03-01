import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServices {
  String? baseUrl;
  String? endPoint;
  String? apiMethod;
  Map<String, String>? headers;
  Map<String, dynamic>? body;
  Map<String, dynamic>? params;

  ApiServices({
    required this.baseUrl,
    required this.endPoint,
    required this.apiMethod,
    this.body,
    this.headers,
    this.params,
  });

  Uri _buildUri() {
    Uri uri = Uri.parse('$baseUrl/$endPoint');

    if (params != null) {
      uri = Uri.parse('$baseUrl/$endPoint').replace(queryParameters: params);
    }

    return uri;
  }

  Future<Map<String, dynamic>> apiCall() async {
    try {
      final Uri uri = _buildUri();

      http.Response response;

      switch (apiMethod?.toLowerCase()) {
        case 'get':
          response = await http.get(uri, headers: headers);
          break;
        case 'post':
          response =
              await http.post(uri, headers: headers, body: jsonEncode(body));
          break;
        case 'put':
          response =
              await http.put(uri, headers: headers, body: jsonEncode(body));
          break;
        case 'delete':
          response = await http.delete(uri, headers: headers);
          break;
        default:
          throw Exception('Invalid API method');
      }

      return _handleResponse(response);
    } catch (e) {
      throw Exception('API Call Failed: $e');
    }
  }

  Map<String, dynamic> _handleResponse(http.Response response) {
    final Map<String, dynamic> responseBody = json.decode(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return responseBody;
    } else {
      throw Exception(
          'Failed to fetch data. Status code: ${response.statusCode}');
    }
  }
}
