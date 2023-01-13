import 'package:flutter/cupertino.dart';
import 'package:whatchat/global.dart';
import 'package:whatchat/models/people_model.dart';

class PeopleScreen extends StatelessWidget {
  const PeopleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PeopleModel>>(
        future: WhatChat.people(),
        builder: (context, snapshot) {
          return CustomScrollView(
            slivers: [
              CupertinoSliverNavigationBar(
                largeTitle: Text(
                  "People",
                  style: TextStyle(color: AppColors.primary),
                ),
              ),
              snapshot.hasData
                  ? SliverList(
                      delegate: SliverChildListDelegate(snapshot.data!
                          .map((e) => Text(e.firstname + " " + e.lastname))
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
