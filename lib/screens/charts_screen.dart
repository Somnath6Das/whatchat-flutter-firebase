import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatchat/components/my_list_tile.dart';
import 'package:whatchat/components/search_bar.dart';
import 'package:whatchat/global.dart';
import 'package:whatchat/models/chats_model.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ChatsModel>>(
        future: WhatChat.chats(),
        builder: (context, snapshot) {
          return CustomScrollView(
            slivers: [
              CupertinoSliverNavigationBar(
                largeTitle: Text(
                  "Chats",
                  style: TextStyle(color: AppColors.primary),
                ),
              ),
              SearchBar(
                onChanged: () {},
                onSubmitted: () {},
              ),
              snapshot.hasData
                  ? SliverList(
                      delegate: SliverChildListDelegate(snapshot.data!
                          .map((e) => MyListTile(
                              key: UniqueKey(),
                              image: e.avatar,
                              title: e.name,
                              subtitle: e.msg,
                              date: e.date,
                              count: e.count,
                              icon: CupertinoIcons.chevron_right,
                              border: e.story,
                              onTap: ()=>{},
                              onImageTap: ()=>{}))
                          .toList()),
                    )
                  : (snapshot.connectionState == ConnectionState.waiting)
                      ? SliverFillRemaining(
                          child: CupertinoActivityIndicator(
                            color: AppColors.primary,
                          ),
                        )
                      : SliverFillRemaining(
                          child: Center(
                          child: Text(snapshot.error.toString()),
                        ))
            ],
          );
        });
  }
}
