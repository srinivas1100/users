import 'dart:convert';
import 'package:http/http.dart' as http;

class UserService {
  Future<List<dynamic>> getUsers(int page) async {
    http.Response response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=$page'));
    try {
      final data = json.decode(response.body);
      return data['data'];
    } catch (e) {
      throw Exception('Failed to load users');
    }
  }

  Future<Map<String, dynamic>> getUserDetails(int userId) async {
    final response =
        await http.get(Uri.parse('https://reqres.in/api/users/$userId'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load user details');
    }
  }
}
