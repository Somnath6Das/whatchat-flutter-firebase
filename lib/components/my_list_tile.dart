import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatchat/global.dart';
import 'package:whatchat/models/chats_model.dart';

class MyListTile extends StatelessWidget {
  final ChatsModel data;
  const MyListTile({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(data.avatar),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(data.name, style: const TextStyle(fontSize: 17),), Text(data.type, style: const TextStyle(fontSize: 11),)],
              )
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Text(data.date),
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: AppColors.primary,
                    child: Text(data.count, style: const TextStyle(color: Colors.white),),
                  )
                ],
              ),const Icon(CupertinoIcons.chevron_right)
            ],
          )
        ],
      ),
    );
  }
}
