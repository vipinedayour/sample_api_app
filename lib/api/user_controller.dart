import 'dart:convert';
import 'dart:developer';

import 'package:flutter_application/api/user_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  final String baseUrl = 'https://reqres.in/api';
  var userList = <User>[].obs;
  var isLoading = true.obs;
  /////
  //method to fetch users
  void fetchUsers() async {
    isLoading.value = true;
    try {
      var url = Uri.parse('$baseUrl/users?page=2');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var users = userModelFromJson(jsonString);
        userList.value = users;
      } else {
        throw ('error');
      }
    } finally {
      isLoading.value = false;
    }
  }

////
  //method to add user
  Future<dynamic> addUser({required String name, required String job}) async {
    var url = Uri.parse('$baseUrl/users');
    var response = await http.post(url, body: {"name": name, "job": job});
    if (response.statusCode == 201) {
      log('success');
      return (json.decode(response.body));
    }
  }
}
