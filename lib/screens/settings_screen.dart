import 'package:flutter/cupertino.dart';
import 'package:whatchat/global.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CupertinoSliverNavigationBar(
          largeTitle: Text("Settings",style: TextStyle(color: AppColors.primary)),
        )
      ],
    );
  }
}