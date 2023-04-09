import 'package:flutter/material.dart';
import 'package:flutter_application/api/user_controller.dart';
import 'package:flutter_application/ui/pages/users_page.dart';
import 'package:get/get.dart';
import '../widgets/add_new_user.dart';
import '../widgets/custom_button.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sample App"),
        backgroundColor: Colors.grey.shade800,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomButton(
            buttonText: 'Fetch Users',
            buttonColor: Colors.green,
            onPressed: () {
              userController.fetchUsers();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UsersPage()),
              );
            },
          ),
          CustomButton(
            buttonText: 'Add User',
            buttonColor: Colors.blue,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AddNewUser();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
