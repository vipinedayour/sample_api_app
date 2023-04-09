import 'package:flutter/material.dart';
import 'package:flutter_application/utils/constants.dart';

import '../../api/user_model.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.green.shade500,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 50.0,
            backgroundImage: NetworkImage(user.avatar),
            backgroundColor: Colors.transparent,
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('First Name:${user.firstName}', style: kTextStyleSubtitle),
              Text('Last Name:${user.lastName}', style: kTextStyleSubtitle),
              Text('Email Id:${user.email}', style: kTextStyleSubtitle),
              Text('Id:${user.id}', style: kTextStyleSubtitle),
            ],
          )
        ],
      ),
    );
  }
}
