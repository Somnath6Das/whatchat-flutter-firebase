import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatchat/components/search_bar.dart';
import 'package:whatchat/global.dart';
import 'package:whatchat/models/message_model.dart';

class Messages extends StatelessWidget {
  final contact;
  const Messages({this.contact,super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MessageModel>>(
        future: WhatChat.message(),
        builder: (context, snapshot) {
          return CustomScrollView(
            slivers: [
              CupertinoSliverNavigationBar(
                largeTitle: Text(
                 contact,
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
                      snapshot.data!.map((e) {
                        return e.sender
                            ? BubbleSpecialThree(
                                text: e.msg,
                                color: AppColors.primary!,
                                tail: true,
                                textStyle: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                              )
                            : BubbleSpecialThree(
                                text: e.msg,
                                color: Colors.white,
                                tail: true,
                                isSender: false,
                                textStyle: const TextStyle(
                                    color: Colors.black, fontSize: 16),
                              );
                      }).toList(),
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
