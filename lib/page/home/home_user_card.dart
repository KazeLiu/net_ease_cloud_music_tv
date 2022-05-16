import 'package:flutter/material.dart';

import '../../provider/user_provider.dart';
import '../../tool/color.dart';
Card UserDetail(UserProvider data) {
  return Card(
    clipBehavior: Clip.hardEdge,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(130),
                child: Image.network(
                  data.userAccountModel.profile!.avatarUrl!,
                  width: 130,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Text(
                    data.userAccountModel.profile!.nickname!,
                    style: KazeFontStyles.text30,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    data.userAccountModel.profile!.userId
                        .toString(),
                    style: KazeFontStyles.text20,
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
                      data.userAccountModel.profile!
                          .backgroundUrl!,
                    ),
                    fit: BoxFit.cover,
                    alignment:Alignment.topCenter
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
                    Colors.white.withOpacity(1.0),
                    Colors.white.withOpacity(0.9),
                    Colors.white.withOpacity(0.8),
                    Colors.white.withOpacity(0.2),
                    Colors.white.withOpacity(0.1),
                    Colors.white.withOpacity(0.1),
                    Colors.white.withOpacity(0.1),
                    Colors.white.withOpacity(0.1),
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