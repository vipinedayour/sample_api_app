import 'package:flutter/material.dart';
import 'package:flutter_application/api/user_controller.dart';
import 'package:get/get.dart';

import '../widgets/user_card.dart';

class UsersPage extends StatelessWidget {
  final userController = Get.find<UserController>();
  UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users Page"),
        backgroundColor: Colors.grey.shade800,
        centerTitle: true,
      ),
      body: Obx(() {
        if (userController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: userController.userList.length,
            itemBuilder: ((context, index) => UserCard(
                  user: userController.userList[index],
                )),
          );
        }
      }),
    );
  }
}
