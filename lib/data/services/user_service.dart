import 'dart:convert';
import 'package:http/http.dart' as http;

class UserService {
  final String baseUrl = 'https://reqres.in/';

  Future<List<dynamic>> getUsers(int page) async {
    final response = await http.get(Uri.parse('$baseUrl/api/users?page=$page'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['data'];
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<Map<String, dynamic>> getUserDetails(int userId) async {
    final response = await http.get(Uri.parse('$baseUrl/api/users/$userId'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['data'];
    } else {
      throw Exception('Failed to load user details');
    }
  }
}
