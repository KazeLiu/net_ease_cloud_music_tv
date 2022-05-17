import 'package:flutter/material.dart';

import '../../provider/user_provider.dart';
import '../../tool/color.dart';

Card UserDetail(UserProvider data) {
  return Card(
    color: const Color(0xFF2C2C2C),
    clipBehavior: Clip.hardEdge,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              SizedBox(
                height: 130,
                width: 130,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    data.userAccountModel.profile!.avatarUrl!,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Text(
                    data.userAccountModel.profile!.nickname!,
                    style: KazeFontStyles.text30CW,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    data.userAccountModel.profile!.userId.toString(),
                    style: KazeFontStyles.text20C,
                  ),
                ],
              )
            ],
          ),
        ),
        Stack(
          children: [
            Container(
              height: 160,
              width: 600,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      data.userAccountModel.profile!.backgroundUrl!,
                    ),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter
                    // 完全填充
                    ),
              ),
            ),
            Container(
              height: 160,
              width: 600,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    const Color(0xFF2C2C2C).withOpacity(1.0),
                    const Color(0xFF2C2C2C).withOpacity(0.9),
                    const Color(0xFF2C2C2C).withOpacity(0.8),
                    const Color(0xFF2C2C2C).withOpacity(0.2),
                    const Color(0xFF2C2C2C).withOpacity(0.1),
                    const Color(0xFF2C2C2C).withOpacity(0.1),
                    const Color(0xFF2C2C2C).withOpacity(0.1),
                    const Color(0xFF2C2C2C).withOpacity(0.1),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
