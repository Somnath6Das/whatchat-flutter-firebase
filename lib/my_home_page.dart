import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatchat/global.dart';
import 'package:whatchat/screens/calls_screen.dart';
import 'package:whatchat/screens/charts_screen.dart';
import 'package:whatchat/screens/people_screen.dart';
import 'package:whatchat/screens/settings_screen.dart';

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
    await WhatChat.people();
    await WhatChat.calls();
    await WhatChat.message();
  }

  var screen = [ChatsScreen(), CallsScreen(), PeopleScreen(), SettingsScreen()];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
               
                items: const [
                  BottomNavigationBarItem(
                      label: "Chats",
                      icon: Icon(
                        CupertinoIcons.chat_bubble_fill,
                      )),
                  BottomNavigationBarItem(
                      label: "Calls",
                      icon: Icon(CupertinoIcons.phone_circle_fill)),
                  BottomNavigationBarItem(
                      label: "People",
                      icon: Icon(CupertinoIcons.person_circle_fill)),
                  BottomNavigationBarItem(
                      label: "Settings",
                      icon: Icon(CupertinoIcons.gear_alt_fill)),
                ]),
            tabBuilder: ((BuildContext context, int index) {
              return Container(
                child: Center(
                  child: screen[index],
                ),
              );
            })));
  }
}
