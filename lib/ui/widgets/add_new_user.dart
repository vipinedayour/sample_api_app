import 'package:flutter/material.dart';
import 'package:flutter_application/api/user_controller.dart';
import 'package:get/get.dart';

import 'custom_snack_bar.dart';

class AddNewUser extends StatelessWidget {
  final textController1 = TextEditingController();
  final textController2 = TextEditingController();
  final userController = Get.find<UserController>();

  AddNewUser({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue[100],
      content: SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: textController1,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Name'),
            ),
            TextField(
              controller: textController2,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Job'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //add button
                MaterialButton(
                  color: Colors.blue,
                  onPressed: () async {
                    if (textController1.text != '' &&
                        textController2.text != '') {
                      var response = await userController.addUser(
                          name: textController1.text,
                          job: textController2.text);
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: CustomSnackBar(response: response),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                          ),
                        );
                      }
                    }
                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Add"),
                ),
                //cancel button
                MaterialButton(
                  color: Colors.blue[200],
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
