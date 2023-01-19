import 'package:flutter/cupertino.dart';
import 'package:whatchat/components/my_list_tile.dart';
import 'package:whatchat/components/search_bar.dart';
import 'package:whatchat/global.dart';
import 'package:whatchat/models/calls_model.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  IconData getIcon(value) {
    switch (value) {
      case "Missed":
        return CupertinoIcons.phone_badge_plus;
      case "Outgoing":
        return CupertinoIcons.phone_arrow_up_right;
      case "Incoming":
        return CupertinoIcons.phone_arrow_down_left;
      default:
        return CupertinoIcons.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CallsModel>>(
        future: WhatChat.calls(),
        builder: (context, snapshot) {
          return CustomScrollView(
            slivers: [
              CupertinoSliverNavigationBar(
                largeTitle: Text(
                  "Calls",
                  style: TextStyle(color: AppColors.primary),
                ),
              ),
              SearchBar(
                onChanged: () {},
                onSubmitted: () {},
              ),
              snapshot.hasData
                  ? SliverList(
                      delegate: SliverChildListDelegate(
                      snapshot.data!
                          .map((e) => MyListTile(
                              key: UniqueKey(),
                              image: e.avatar,
                              title: e.name,
                              subtitle: e.outbound,
                              icon: getIcon(e.outbound),
                              border: false,
                              onTap: () => {},
                              onImageTap: () => {}))
                          .toList(),
                    ))
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
