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
                                //i> if ChatsModel bool story = false return nothing.
                                if (!e.story) return;
                                //ii> create a array type UserModel.
                                List<UserModel> sampleUser = [];
                                //iii> ChatsModel stories String images pass to StoryModel and save into stories variables type StoryModel.                   
                                List<StoryModel> stories = e.stories
                                    .map((img) => StoryModel(img))
                                    .toList();
                                //iv> pass 3 parameter, 
                                //first parameter stories which is comes from ChatModel and convert by StoryModel as a list pass through UserModel,
                                //second parameter comes from ChatsModel name variable,
                                // third parameter comes from ChatModel avatar variables.
                                // all the three parameter pass through UserModel and store it into sampleUser array.
                                sampleUser
                                    .add(UserModel(stories, e.name, e.avatar));
                                //v> pass sampleUser array to StoryPreview screen,
                                // we target particular user to see his story that's why pageIndex = 0,
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
