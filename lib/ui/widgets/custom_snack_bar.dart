import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class CustomSnackBar extends StatelessWidget {
  const CustomSnackBar({
    Key? key,
    required this.response,
  }) : super(key: key);

  final dynamic response;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.blue.shade300, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "New User Added",
            style: kTextStyleTitle,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Name : ${response['name']}',
            style: kTextStyleSubtitle,
          ),
          Text(
            'Job : ${response['job']}',
            style: kTextStyleSubtitle,
          ),
          Text(
            'Id : ${response['id']}',
            style: kTextStyleSubtitle,
          ),
          Text(
            'Created At : ${response['createdAt']}',
            style: kTextStyleSubtitle,
          ),
        ],
      ),
    );
  }
}
