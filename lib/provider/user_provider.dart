import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:user_flutter_app/model/user_model.dart';

class UserProvider with ChangeNotifier {
  List<User> _users = [];
  bool _isFetching = false;

  List<User> get users => _users;
  bool get isFetching => _isFetching;

  UserProvider() {
    fetchUsers(); // Automatically fetch users when the provider is initialized
  }

  Future<void> fetchUsers() async {
    final url = Uri.parse('https://lionfish-app-qkntx.ondigitalocean.app/api/users/');
    _isFetching = true;
    notifyListeners();

    try {
      final response = await http.get(url);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        _users = data.map((item) => User.fromJson(item as Map<String, dynamic>)).toList();
      } else {
        throw Exception('Failed to load users');
      }
    } catch (error) {
      print('Error fetching users: $error');
      _users = [];
    } finally {
      _isFetching = false;
      notifyListeners();
    }
  }

  Future<void> updateUser(int id, User user) async {
    final url = Uri.parse('https://lionfish-app-qkntx.ondigitalocean.app/api/user/$id');
    try {
      final response = await http.patch(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': user.name,
          'email': user.email,
          'occupation': user.occupation,
          'bio': user.bio,
        }),
      );

      if (response.statusCode == 200) {
        fetchUsers();
      } else {
        throw Exception('Failed to update user');
      }
    } catch (error) {
      print('Error updating user: $error');
    }
  }
}
