import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:khuthon/services/service_constants.dart';

class ApiService {
  final baseUrl = ApiConstants.baseUrl;

  Future<List<Map<String, dynamic>>> fetchData() async {
    final response = await http.get(Uri.parse('$baseUrl/results'));
    if (response.statusCode == 200) {
      log(' fetch success');
      // log(response.body);
      final List<dynamic> decodedData = jsonDecode(utf8.decode(response.bodyBytes));
      return decodedData.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Map<String, dynamic>> postData(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      log('Post Success:');
      // log(response.body);
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      throw Exception('Failed to post data');
    }
  }

  Future<Map<String, dynamic>> getPostById(id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/results/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      log('FindBYId Success:');
      log(response.body);
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      throw Exception('Failed to FindBYId data');
    }
  }
}
