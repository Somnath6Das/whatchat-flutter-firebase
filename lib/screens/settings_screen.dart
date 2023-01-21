import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatchat/global.dart';
import 'package:cupertino_list_tile/cupertino_list_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CupertinoSliverNavigationBar(
          largeTitle:
              Text("Settings", style: TextStyle(color: AppColors.primary)),
        ),
        SettingsItem(
          title: "Starred Messaged",
          color: Colors.amber.shade800,
          onTap: () => {},
          icon: CupertinoIcons.star_fill,
        ),
        SettingsItem(
          title: "Linked Devices",
          color: Colors.lightBlueAccent,
          onTap: () => {},
          icon: CupertinoIcons.device_laptop,
        ),
        SettingsItem(
          title: 'Account',
          color: Colors.blue,
          onTap: () => {},
          icon: CupertinoIcons.person_fill,
        ),
        SettingsItem(
          title: 'Chats',
          color: Colors.green,
          onTap: () => {},
          icon: CupertinoIcons.chat_bubble_fill,
        ),
        SettingsItem(
          title: 'Notifications',
          color: Colors.red,
          onTap: () => {},
          icon: CupertinoIcons.app_badge,
        ),
        SettingsItem(
          title: 'Storage and Data',
          color: Colors.lightGreenAccent.shade400,
          onTap: () => {},
          icon: CupertinoIcons.arrow_up_arrow_down_circle,
        ),
        SettingsItem(
          title: 'Help',
          color: Colors.indigo,
          onTap: () => {},
          icon: CupertinoIcons.info_circle_fill,
        ),
        SettingsItem(
          title: 'Tell a Friend',
          color: Colors.pink.shade400,
          onTap: () => {},
          icon: CupertinoIcons.heart_fill,
        ),
      ],
    );
  }
}

class SettingsItem extends StatelessWidget {
  final title;
  final icon;
  final color;
  final onTap;

  const SettingsItem({
    Key? key,
    this.title,
    this.icon,
    this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: CupertinoListTile(
      onTap: () => onTap(),
      leading: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(7)),
          child: Icon(
            icon,
            color: Colors.white,
          )),
      title:
          Text(title, style: TextStyle(fontSize: 18, color: Colors.grey.shade700,fontWeight: FontWeight.w600)),
      trailing: const Icon(CupertinoIcons.chevron_right),
    ));
  }
}
