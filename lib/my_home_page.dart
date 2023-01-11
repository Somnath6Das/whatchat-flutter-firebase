import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatchat/global.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    getMe();
    super.initState();
  }

  void getMe() async {
    await WhatChat.me();
    await WhatChat.chats();
    await WhatChat.stackoOverTest();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
                backgroundColor: AppColors.bottomTabBarBackground,
                items: const [
                  BottomNavigationBarItem(
                      label: "Chats",
                      icon: Icon(
                        CupertinoIcons.chat_bubble_text,
                      )),
                  BottomNavigationBarItem(
                      label: "Calls", icon: Icon(CupertinoIcons.phone_circle)),
                  BottomNavigationBarItem(
                      label: "People",
                      icon: Icon(CupertinoIcons.person_alt_circle)),
                  BottomNavigationBarItem(
                      label: "Settings", icon: Icon(CupertinoIcons.gear_alt)),
                ]),
            tabBuilder: ((BuildContext context, int index) {
              return Container(
                child: Center(
                  child: Text(index.toString()),
                ),
              );
            })));
  }
}
