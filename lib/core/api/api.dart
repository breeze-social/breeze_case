import 'dart:convert';

import 'package:breeze_case/core/api/api_response.dart';
import 'package:http/http.dart' as http;

class Api {
  final Map<String, String> _headers = {'Accept': 'application/json'};
  final String hostUrl = 'http://<YOUR_URL>:9000/v4.0.5/';

  Future<ApiResponse> get(String url) async {
    try {
      final response = await http.get(Uri.parse('$hostUrl$url'), headers: _headers);
      return ApiResponse(
          statusCode: response.statusCode,
          data: json.decode(response.body)['data'],
          errorMessage: json.decode(response.body)['message']);
    } catch (e) {
      return ApiResponse(statusCode: 500, errorMessage: e.toString());
    }
  }

  Future<ApiResponse> post(String url, Map<String, dynamic> body) async {
    try {
      final response = await http.post(Uri.parse('$hostUrl$url'), headers: _headers, body: body);
      return ApiResponse(
          statusCode: response.statusCode,
          data: json.decode(response.body)['data'],
          errorMessage: json.decode(response.body)['message']);
    } catch (e) {
      return ApiResponse(statusCode: 500, errorMessage: e.toString());
    }
  }

  Future<ApiResponse> put(String url, Map<String, dynamic> body) async {
    try {
      final response = await http.put(Uri.parse('$hostUrl$url'), headers: _headers, body: body);
      return ApiResponse(
          statusCode: response.statusCode,
          data: json.decode(response.body)['data'],
          errorMessage: json.decode(response.body)['message']);
    } catch (e) {
      return ApiResponse(statusCode: 500, errorMessage: e.toString());
    }
  }
}