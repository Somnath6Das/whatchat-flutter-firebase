import 'package:flutter/cupertino.dart';
import 'package:whatchat/components/search_bar.dart';
import 'package:whatchat/global.dart';
import 'package:whatchat/models/calls_model.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

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
              SearchBar(onChanged: (){}, onSubmitted: (){},),
              snapshot.hasData
                  ? SliverList(
                      delegate: SliverChildListDelegate(
                          snapshot.data!.map((e) => Text(e.name)).toList()),
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
