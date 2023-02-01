import 'package:flutter/cupertino.dart';
import 'package:whatchat/components/my_list_tile.dart';
import 'package:whatchat/components/search_bar.dart';
import 'package:whatchat/global.dart';
import 'package:whatchat/models/chats_model.dart';
import 'package:whatchat/models/story_model.dart';
import 'package:whatchat/models/user_model.dart';
import 'package:whatchat/screens/messages_screen.dart';
import 'package:whatchat/screens/story_preview.dart';

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
                              onTap: () => navigate(
                                  context,
                                  Messages(
                                    contact: e.name,
                                  )),
                              onImageTap: () {
                                // on chat screen tab on avatar full screen picture will shown.
                                if (!e.story) return;
                                List<UserModel> sampleUser = [];
                                List<StoryModel> stories = [];
                                stories = e.stories
                                    .map((img) => StoryModel(img))
                                    .toList();
                                sampleUser
                                    .add(UserModel(stories, e.name, e.avatar));
                                navigate(context,
                                    StoryPreview( users: sampleUser, pageIndex: 0,));
                              }))
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
